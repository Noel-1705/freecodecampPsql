--
-- PostgreSQL database dump
--

-- Dumped from database version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)
-- Dumped by pg_dump version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

DROP DATABASE universe;
--
-- Name: universe; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE universe WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE universe OWNER TO freecodecamp;

\connect universe

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: asteroid; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.asteroid (
    asteroid_id integer NOT NULL,
    name character varying(20) NOT NULL,
    galaxy text,
    unq integer
);


ALTER TABLE public.asteroid OWNER TO freecodecamp;

--
-- Name: asteroid_asteroid_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.asteroid_asteroid_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.asteroid_asteroid_id_seq OWNER TO freecodecamp;

--
-- Name: asteroid_asteroid_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.asteroid_asteroid_id_seq OWNED BY public.asteroid.asteroid_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(10) NOT NULL,
    galaxy_age_billion_years numeric(4,1) NOT NULL,
    galaxy_description character varying(255),
    galaxy_distance_from_earth integer NOT NULL
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: galaxy_gid_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_gid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_gid_seq OWNER TO freecodecamp;

--
-- Name: galaxy_gid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_gid_seq OWNED BY public.galaxy.galaxy_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(255) NOT NULL,
    mage integer NOT NULL,
    planet_id integer NOT NULL,
    mshape character varying(255) NOT NULL
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: moon_mid_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.moon_mid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.moon_mid_seq OWNER TO freecodecamp;

--
-- Name: moon_mid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.moon_mid_seq OWNED BY public.moon.moon_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying(255) NOT NULL,
    page integer NOT NULL,
    has_life boolean NOT NULL,
    ptype character varying(255) NOT NULL,
    life_possible boolean NOT NULL,
    galaxy_id integer,
    star_id integer
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: planets_pid_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planets_pid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planets_pid_seq OWNER TO freecodecamp;

--
-- Name: planets_pid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planets_pid_seq OWNED BY public.planet.planet_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    galaxy_id integer NOT NULL,
    name character varying(50) NOT NULL,
    sage numeric(4,1) NOT NULL,
    sdis integer NOT NULL,
    stype character varying(20) NOT NULL,
    star_id integer NOT NULL
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.star_star_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.star_star_id_seq OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.star_star_id_seq OWNED BY public.star.star_id;


--
-- Name: stars_sid_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.stars_sid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.stars_sid_seq OWNER TO freecodecamp;

--
-- Name: stars_sid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.stars_sid_seq OWNED BY public.star.galaxy_id;


--
-- Name: asteroid asteroid_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.asteroid ALTER COLUMN asteroid_id SET DEFAULT nextval('public.asteroid_asteroid_id_seq'::regclass);


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_gid_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_mid_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planets_pid_seq'::regclass);


--
-- Name: star galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN galaxy_id SET DEFAULT nextval('public.stars_sid_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: asteroid; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.asteroid VALUES (1, '1', 'Ceres', 1);
INSERT INTO public.asteroid VALUES (2, '2', 'Pallas', 11);
INSERT INTO public.asteroid VALUES (3, '3', 'Juno', 3);
INSERT INTO public.asteroid VALUES (4, '4', 'Vesta', 4);
INSERT INTO public.asteroid VALUES (5, '5', 'Hygiea', 5);
INSERT INTO public.asteroid VALUES (6, '6', 'Eunomia', 12);
INSERT INTO public.asteroid VALUES (7, '7', 'Interamnia', 2);
INSERT INTO public.asteroid VALUES (8, '8', 'Davida', 13);
INSERT INTO public.asteroid VALUES (9, '9', 'Sylvia', 40);
INSERT INTO public.asteroid VALUES (10, '10', 'Cybele', 59);
INSERT INTO public.asteroid VALUES (11, '11', 'Thisbe', 10);
INSERT INTO public.asteroid VALUES (12, '12', 'Europa', 242);
INSERT INTO public.asteroid VALUES (13, '13', 'Psyche', 3524);
INSERT INTO public.asteroid VALUES (14, '14', 'Egeria', 324);
INSERT INTO public.asteroid VALUES (15, '15', 'Iris', 590);
INSERT INTO public.asteroid VALUES (16, '16', 'Metis', 189700);
INSERT INTO public.asteroid VALUES (17, '17', 'Hebe', 254654);
INSERT INTO public.asteroid VALUES (18, '18', 'Amphitrite', 76993);
INSERT INTO public.asteroid VALUES (19, '19', 'Doris', 47667);
INSERT INTO public.asteroid VALUES (20, '20', 'Aegle', 59797);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Andromica', 10.0, 'Spiral with billions of stars', 2500000);
INSERT INTO public.galaxy VALUES (2, 'Zaphyra', 8.0, 'Barred,spiral,rich in nebulaee', 3000000);
INSERT INTO public.galaxy VALUES (3, 'Vortan', 6.0, 'Irregular with active starbursts', 4500000);
INSERT INTO public.galaxy VALUES (4, 'Astralis', 11.0, 'Elliptical, ancient and massive', 5000000);
INSERT INTO public.galaxy VALUES (5, 'Celestara', 9.0, 'Rich spiral with young stars', 2700000);
INSERT INTO public.galaxy VALUES (6, 'Klyra', 7.0, 'Binary spiral, unique structure', 3800000);
INSERT INTO public.galaxy VALUES (7, 'Exoventia', 5.0, 'Clustered irregular, dynamic formation', 4200000);
INSERT INTO public.galaxy VALUES (8, 'Morphina', 6.5, 'Mysterious spiral with dark matter', 6000000);
INSERT INTO public.galaxy VALUES (9, 'Galvoria', 8.2, 'Highly luminous irregular', 3200000);
INSERT INTO public.galaxy VALUES (10, 'Luminaris', 7.5, 'Compact elliptical, highly dense', 2900000);
INSERT INTO public.galaxy VALUES (11, 'Tempestris', 9.1, 'Stormy barred spiral system', 5500000);
INSERT INTO public.galaxy VALUES (12, 'Pyroxia', 4.8, 'Active star-forming region', 4700000);
INSERT INTO public.galaxy VALUES (13, 'Aquathis', 6.3, 'Water-rich spiral galaxy', 3600000);
INSERT INTO public.galaxy VALUES (14, 'Geonova', 10.2, 'Earth-like planets in abundance', 4000000);
INSERT INTO public.galaxy VALUES (15, 'Cryon', 9.7, 'Cold and icy galactic formation', 3300000);
INSERT INTO public.galaxy VALUES (16, 'Zephyros', 7.4, 'Windswept irregular system', 5200000);
INSERT INTO public.galaxy VALUES (17, 'Floralis', 8.9, 'Floral nebulae patterns present', 3100000);
INSERT INTO public.galaxy VALUES (18, 'Eclipsara', 12.1, 'Dark galaxy with eclipsing features', 7000000);
INSERT INTO public.galaxy VALUES (19, 'Chronoxis', 10.5, 'Time-dilated elliptical system', 4900000);
INSERT INTO public.galaxy VALUES (20, 'Mystara', 11.3, 'Arcane elliptical galaxy with magic-like phenomena', 6000000);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Luna', 5, 1, 'Barren');
INSERT INTO public.moon VALUES (2, 'Phobos', 5, 1, 'Irregular');
INSERT INTO public.moon VALUES (3, 'Deimos', 5, 1, 'Irregular');
INSERT INTO public.moon VALUES (4, 'Callisto', 4, 2, 'Cratered');
INSERT INTO public.moon VALUES (5, 'Europa', 4, 2, 'Ice Shell');
INSERT INTO public.moon VALUES (6, 'Ganymede', 4, 2, 'Rocky');
INSERT INTO public.moon VALUES (7, 'Io', 4, 2, 'Volcanic');
INSERT INTO public.moon VALUES (8, 'Charon', 5, 3, 'Fractured');
INSERT INTO public.moon VALUES (9, 'Triton', 4, 3, 'Geologically Active');
INSERT INTO public.moon VALUES (10, 'Enceladus', 4, 3, 'Ice Plumes');
INSERT INTO public.moon VALUES (11, 'Mimas', 4, 3, 'Craters');
INSERT INTO public.moon VALUES (12, 'Oberon', 4, 4, 'Rocky');
INSERT INTO public.moon VALUES (13, 'Rhea', 4, 4, 'Rocky');
INSERT INTO public.moon VALUES (14, 'Tethys', 4, 4, 'Water Ice');
INSERT INTO public.moon VALUES (15, 'Iapetus', 5, 5, 'Dual-Tone');
INSERT INTO public.moon VALUES (16, 'Dione', 5, 5, 'Heavily Cratered');
INSERT INTO public.moon VALUES (17, 'Ariel', 5, 5, 'Geologically Young');
INSERT INTO public.moon VALUES (18, 'Umbriel', 5, 5, 'Dark');
INSERT INTO public.moon VALUES (19, 'Miranda', 5, 6, 'Ridged');
INSERT INTO public.moon VALUES (20, 'Prospero', 4, 6, 'Inclined');
INSERT INTO public.moon VALUES (21, 'Hyperion', 5, 6, 'Irregular');
INSERT INTO public.moon VALUES (22, 'Nereid', 4, 6, 'Eccentric Orbit');
INSERT INTO public.moon VALUES (23, 'Titan', 4, 7, 'Hydrocarbon Seas');
INSERT INTO public.moon VALUES (24, 'Rosalind', 5, 7, 'Rocky');
INSERT INTO public.moon VALUES (25, 'Triton', 4, 7, 'Nitrogen Ice');
INSERT INTO public.moon VALUES (26, 'Prometheus', 4, 7, 'Rocky');
INSERT INTO public.moon VALUES (27, 'Bianca', 5, 8, 'Rocky');
INSERT INTO public.moon VALUES (28, 'Cressida', 4, 8, 'Rocky');
INSERT INTO public.moon VALUES (29, 'Titania', 5, 8, 'Rocky');
INSERT INTO public.moon VALUES (30, 'Oberon', 4, 8, 'Rocky');
INSERT INTO public.moon VALUES (31, 'Caliban', 4, 9, 'Retrograde');
INSERT INTO public.moon VALUES (32, 'Sycorax', 4, 9, 'Retrograde');
INSERT INTO public.moon VALUES (33, 'Miranda', 5, 9, 'Ridged');
INSERT INTO public.moon VALUES (34, 'Ariel', 5, 9, 'Rocky');
INSERT INTO public.moon VALUES (35, 'Umbriel', 5, 10, 'Dark');
INSERT INTO public.moon VALUES (36, 'Titania', 5, 10, 'Rocky');
INSERT INTO public.moon VALUES (37, 'Oberon', 4, 10, 'Rocky');
INSERT INTO public.moon VALUES (38, 'Bianca', 5, 10, 'Rocky');


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (2, 'Zephyr Prime', 3, false, 'Gas Giant', false, 1, 1);
INSERT INTO public.planet VALUES (1, 'Terra Nova', 5, false, 'Rocky Terrestrial', true, 1, 1);
INSERT INTO public.planet VALUES (3, 'Aqua Mundo', 7, true, 'Ocean Planet', true, 2, 2);
INSERT INTO public.planet VALUES (4, 'Emerald World', 7, true, 'Jungle Planet', true, 2, 2);
INSERT INTO public.planet VALUES (5, 'Crystal Sphere', 5, false, 'Ice Giant', true, 2, 2);
INSERT INTO public.planet VALUES (6, 'Vulcan Forge', 3, false, 'Volcanic Planet', false, 3, 3);
INSERT INTO public.planet VALUES (7, 'Helios Minor', 4, false, 'Molten Planet', false, 3, 3);
INSERT INTO public.planet VALUES (8, 'Storm Realm', 4, false, 'Gas Giant', false, 3, 3);
INSERT INTO public.planet VALUES (9, 'Genesis', 6, true, 'Terrestrial', true, 4, 4);
INSERT INTO public.planet VALUES (10, 'Sentinel', 4, false, 'Desert Planet', true, 4, 4);
INSERT INTO public.planet VALUES (11, 'Frozen Horizon', 4, false, 'Ice Planet', true, 4, 4);
INSERT INTO public.planet VALUES (12, 'Quantum Prime', 6, true, 'Super-Earth', true, 5, 5);
INSERT INTO public.planet VALUES (13, 'Nano World', 5, false, 'Nano-Engineered Planet', true, 5, 5);
INSERT INTO public.planet VALUES (14, 'Sylph', 6, false, 'Atmospheric Planet', true, 6, 6);
INSERT INTO public.planet VALUES (15, 'Metallic Core', 3, false, 'Metallic Planet', false, 6, 6);
INSERT INTO public.planet VALUES (16, 'Eden Replica', 5, true, 'Earth-like', true, 7, 7);
INSERT INTO public.planet VALUES (17, 'Crimson Sphere', 6, false, 'Red Planet', true, 7, 7);
INSERT INTO public.planet VALUES (18, 'Harmony', 8, true, 'Utopian Planet', true, 8, 8);
INSERT INTO public.planet VALUES (19, 'Wind Dancer', 4, false, 'Gaseous Planet', true, 8, 8);
INSERT INTO public.planet VALUES (20, 'Nebula', 7, false, 'Plasma Planet', false, 9, 9);
INSERT INTO public.planet VALUES (21, 'Crystalline', 4, false, 'Crystal Planet', true, 9, 9);
INSERT INTO public.planet VALUES (22, 'Radiance', 5, true, 'Luminous Planet', true, 10, 10);
INSERT INTO public.planet VALUES (23, 'Obsidian', 5, false, 'Dark Planet', false, 10, 10);
INSERT INTO public.planet VALUES (24, 'Oceanus', 7, true, 'Water World', true, 11, 11);
INSERT INTO public.planet VALUES (25, 'Stone Guardian', 4, false, 'Rocky Wasteland', true, 11, 11);
INSERT INTO public.planet VALUES (26, 'Zeta Prime', 6, false, 'Neutron Planet', false, 12, 12);
INSERT INTO public.planet VALUES (27, 'Chronos', 4, true, 'Time-Distorted Planet', true, 12, 12);
INSERT INTO public.planet VALUES (28, 'Ember', 6, false, 'Lava Planet', false, 13, 13);
INSERT INTO public.planet VALUES (29, 'Twilight Realm', 4, true, 'Terminator Planet', true, 13, 13);
INSERT INTO public.planet VALUES (30, 'Aurora', 7, true, 'Magnetic Planet', true, 14, 14);
INSERT INTO public.planet VALUES (31, 'Phantom Sphere', 4, false, 'Ghost Planet', false, 14, 14);
INSERT INTO public.planet VALUES (32, 'Silicon Dreams', 5, true, 'Silicon-Based Planet', true, 15, 15);
INSERT INTO public.planet VALUES (33, 'Pulse', 3, false, 'Pulsar Planet', false, 16, 16);
INSERT INTO public.planet VALUES (34, 'Elysium', 7, true, 'Paradise Planet', true, 17, 17);
INSERT INTO public.planet VALUES (35, 'Dark Matter', 5, false, 'Dark Matter Planet', false, 18, 18);
INSERT INTO public.planet VALUES (36, 'Quantum Realm', 7, true, 'Quantum Planet', true, 19, 19);
INSERT INTO public.planet VALUES (37, 'Mystic', 3, false, 'Mystic Planet', true, 19, 19);
INSERT INTO public.planet VALUES (38, 'Zenith', 6, true, 'Advanced Civilization Planet', true, 20, 20);
INSERT INTO public.planet VALUES (39, 'Shadow World', 4, false, 'Shadow Planet', true, 20, 20);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 4.6, 0, 'G-type', 1);
INSERT INTO public.star VALUES (2, 'Proxima Centauri', 4.9, 4, 'Red Dwarf', 2);
INSERT INTO public.star VALUES (3, 'Sirius A', 0.3, 9, 'Blue-white', 3);
INSERT INTO public.star VALUES (4, 'Betelgeuse', 8.0, 643, 'Red Supergiant', 4);
INSERT INTO public.star VALUES (5, 'VY Canis Majoris', 8.0, 3900, 'Red Hypergiant', 5);
INSERT INTO public.star VALUES (6, 'Procyon A', 1.9, 11, 'F-type', 6);
INSERT INTO public.star VALUES (7, 'Barnards Star', 10.0, 6, 'Red Dwarf', 7);
INSERT INTO public.star VALUES (8, 'Alpha Centauri B', 5.3, 4, 'K-type', 8);
INSERT INTO public.star VALUES (9, 'Rigel', 8.0, 860, 'Blue Supergiant', 9);
INSERT INTO public.star VALUES (10, 'Wolf 359', 0.1, 8, 'Red Dwarf', 10);
INSERT INTO public.star VALUES (11, 'Vega', 0.5, 25, 'A-type', 11);
INSERT INTO public.star VALUES (12, 'Antares A', 12.0, 604, 'Red Supergiant', 12);
INSERT INTO public.star VALUES (13, 'Polaris', 0.1, 434, 'Yellow Supergiant', 13);
INSERT INTO public.star VALUES (14, 'Aldebaran', 6.4, 65, 'Orange Giant', 14);
INSERT INTO public.star VALUES (15, 'Spica', 0.2, 260, 'Blue Giant', 15);
INSERT INTO public.star VALUES (16, 'Neutron Star in Cassiopeia A', 0.0, 11000, 'Neutron', 16);
INSERT INTO public.star VALUES (17, 'PSR B1257+12', 0.0, 2300, 'Pulsar', 17);
INSERT INTO public.star VALUES (18, 'Gliese 581', 7.0, 20, 'Red Dwarf', 18);
INSERT INTO public.star VALUES (19, 'T Tauri', 0.0, 450, 'T Tauri', 19);
INSERT INTO public.star VALUES (20, 'WISE 1828+2650', 0.1, 47, 'Brown Dwarf', 20);


--
-- Name: asteroid_asteroid_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.asteroid_asteroid_id_seq', 20, true);


--
-- Name: galaxy_gid_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_gid_seq', 20, true);


--
-- Name: moon_mid_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_mid_seq', 38, true);


--
-- Name: planets_pid_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planets_pid_seq', 39, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 20, true);


--
-- Name: stars_sid_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.stars_sid_seq', 20, true);


--
-- Name: asteroid asteroid_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.asteroid
    ADD CONSTRAINT asteroid_pkey PRIMARY KEY (asteroid_id);


--
-- Name: asteroid asteroid_unq_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.asteroid
    ADD CONSTRAINT asteroid_unq_key UNIQUE (unq);


--
-- Name: galaxy galaxy_idunq; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_idunq UNIQUE (galaxy_id);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_idunq; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_idunq UNIQUE (moon_id);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: planet planet_idunq; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_idunq UNIQUE (planet_id);


--
-- Name: planet planets_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planets_pkey PRIMARY KEY (planet_id);


--
-- Name: star star_idunq; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_idunq UNIQUE (star_id);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: moon moon_pid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pid_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet planet_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: planet planets_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planets_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- Name: star stars_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT stars_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--

