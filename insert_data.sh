#! /bin/bash

if [[ $1 == "test" ]]
then
  PSQL="psql --username=postgres --dbname=worldcuptest -t --no-align -c"
else
  PSQL="psql --username=freecodecamp --dbname=worldcup -t --no-align -c"
fi

# Do not change code above this line. Use the PSQL variable above to query your database.
cat games.csv | while IFS="," read YEAR ROUND WINNER OPPONENT WINNER_GOALS OPPONENT_GOALS
do
if [[ $WINNER != "winner" ]]
then
team1_name= $($PSQL "select name from teams where name='$WINNER'")
if [[ -z $team1_name ]]
then
insert_team1_name=$($PSQL"insert into teams(name) values('$WINNER')")
if [[ $insert_team1_name == "INSERT 0 1" ]]
then
echo Inserted team $WINNER
fi
fi
fi

if [[ $OPPONENT != "opponent" ]]
then
opponent1_name=$($PSQL "select name from teams where name=$OPPONENT")
if [[ -z $opponent1_name ]]
then
insert_opponent1_name=$($PSQL "insert into teams(name) values('$OPPONENT')")
if [[ $insert_opponent1_name=="INSERT 0 1" ]]
then 
echo Inserted team $OPPONENT
fi
fi
fi
if [[ $YEAR != "year" ]]
then
WINNER_ID=$($PSQL "select team_id from teams where name='$WINNER'")
OPPONENT_ID=$($PSQL "select team_id from teams where name='$OPPONENT'")
insert_game=$($PSQL "insert into games(year,round,winner_id,opponent_id,winner_goals,opponent_goals) values($YEAR,'$ROUND',$WINNER_ID,$OPPONENT_ID,$WINNER_GOALS,$OPPONENT_GOALS)")
if [[ $insert_game == "INSERT 0 1" ]]
then
echo New game added: $YEAR, $ROUND, $WINNER_ID VS $OPPONENT_ID, score $WINNER_GOALS : $OPPONENT_GOALS
fi
fi
done