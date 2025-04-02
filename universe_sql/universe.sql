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
-- Name: comet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.comet (
    comet_id integer NOT NULL,
    name character varying(255) NOT NULL,
    star_id integer NOT NULL,
    diameter_in_km integer,
    orbital_period_in_years numeric,
    has_tail boolean
);


ALTER TABLE public.comet OWNER TO freecodecamp;

--
-- Name: comet_comet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.comet_comet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.comet_comet_id_seq OWNER TO freecodecamp;

--
-- Name: comet_comet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.comet_comet_id_seq OWNED BY public.comet.comet_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(255) NOT NULL,
    description text,
    age_in_millions_of_years numeric,
    has_life boolean,
    is_spherical boolean,
    number_of_stars integer,
    diameter_in_light_years integer
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_galaxy_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_galaxy_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_galaxy_id_seq OWNED BY public.galaxy.galaxy_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(255) NOT NULL,
    planet_id integer NOT NULL,
    has_life boolean,
    is_spherical boolean,
    age_in_millions_of_years numeric,
    diameter_in_km integer,
    orbital_period_in_days integer
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.moon_moon_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.moon_moon_id_seq OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.moon_moon_id_seq OWNED BY public.moon.moon_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying(255) NOT NULL,
    star_id integer NOT NULL,
    has_life boolean,
    is_spherical boolean,
    age_in_millions_of_years numeric,
    diameter_in_km integer,
    number_of_moons integer
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_planet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_planet_id_seq OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_planet_id_seq OWNED BY public.planet.planet_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(255) NOT NULL,
    galaxy_id integer NOT NULL,
    age_in_millions_of_years numeric,
    is_spherical boolean,
    distance_from_earth numeric,
    temperature_in_kelvin integer,
    mass_in_solar_masses integer
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
-- Name: comet comet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.comet ALTER COLUMN comet_id SET DEFAULT nextval('public.comet_comet_id_seq'::regclass);


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_galaxy_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_moon_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: comet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.comet VALUES (1, 'Halley', 1, 11, 75.3, true);
INSERT INTO public.comet VALUES (2, 'Hale-Bopp', 1, 40, 2537, true);
INSERT INTO public.comet VALUES (3, '67P/Churyumov-Gerasimenko', 1, 4, 6.45, true);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 'Our home galaxy', 13000, true, true, 100000, 100000);
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 'Nearest spiral galaxy', 10000, false, true, 1000000, 220000);
INSERT INTO public.galaxy VALUES (3, 'Triangulum', 'Third-largest galaxy in the Local Group', 5000, false, true, 40000, 60000);
INSERT INTO public.galaxy VALUES (4, 'Messier 87', 'Supergiant elliptical galaxy', 6000, false, true, 2000000, 120000);
INSERT INTO public.galaxy VALUES (5, 'Whirlpool', 'Grand-design spiral galaxy', 4000, false, true, 300000, 80000);
INSERT INTO public.galaxy VALUES (6, 'Sombrero', 'Unusual spiral galaxy', 8000, false, true, 500000, 90000);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Moon', 1, false, true, 4500, 3474, 27);
INSERT INTO public.moon VALUES (2, 'Phobos', 2, false, true, 4500, 22, 0);
INSERT INTO public.moon VALUES (3, 'Deimos', 2, false, true, 4500, 12, 1);
INSERT INTO public.moon VALUES (4, 'Europa', 4, false, true, 4500, 3121, 4);
INSERT INTO public.moon VALUES (5, 'Ganymede', 4, false, true, 4500, 5262, 7);
INSERT INTO public.moon VALUES (6, 'Callisto', 4, false, true, 4500, 4820, 17);
INSERT INTO public.moon VALUES (7, 'Titan', 5, false, true, 4500, 5149, 16);
INSERT INTO public.moon VALUES (8, 'Enceladus', 5, false, true, 4500, 504, 1);
INSERT INTO public.moon VALUES (9, 'Triton', 6, false, true, 4500, 2706, 6);
INSERT INTO public.moon VALUES (10, 'Charon', 7, false, true, 4500, 1212, 6);
INSERT INTO public.moon VALUES (11, 'Io', 4, false, true, 4500, 3643, 2);
INSERT INTO public.moon VALUES (12, 'Mimas', 5, false, true, 4500, 396, 1);
INSERT INTO public.moon VALUES (13, 'Rhea', 5, false, true, 4500, 1527, 5);
INSERT INTO public.moon VALUES (14, 'Iapetus', 5, false, true, 4500, 1468, 79);
INSERT INTO public.moon VALUES (15, 'Oberon', 7, false, true, 4500, 1522, 14);
INSERT INTO public.moon VALUES (16, 'Titania', 7, false, true, 4500, 1576, 9);
INSERT INTO public.moon VALUES (17, 'Miranda', 7, false, true, 4500, 471, 1);
INSERT INTO public.moon VALUES (18, 'Ariel', 7, false, true, 4500, 1158, 3);
INSERT INTO public.moon VALUES (19, 'Umbriel', 7, false, true, 4500, 1169, 4);
INSERT INTO public.moon VALUES (20, 'Dione', 5, false, true, 4500, 1123, 3);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Earth', 1, true, true, 4500, 12742, 1);
INSERT INTO public.planet VALUES (2, 'Mars', 1, false, true, 4500, 6779, 2);
INSERT INTO public.planet VALUES (3, 'Venus', 1, false, true, 4500, 12104, 0);
INSERT INTO public.planet VALUES (4, 'Jupiter', 1, false, true, 4500, 139820, 79);
INSERT INTO public.planet VALUES (5, 'Saturn', 1, false, true, 4500, 116460, 83);
INSERT INTO public.planet VALUES (6, 'Neptune', 1, false, true, 4500, 49244, 14);
INSERT INTO public.planet VALUES (7, 'Uranus', 1, false, true, 4500, 50724, 27);
INSERT INTO public.planet VALUES (8, 'Mercury', 1, false, true, 4500, 4879, 0);
INSERT INTO public.planet VALUES (9, 'Kepler-186f', 2, true, true, 4000, 12000, 1);
INSERT INTO public.planet VALUES (10, 'Proxima Centauri b', 6, true, true, 4800, 14000, 0);
INSERT INTO public.planet VALUES (11, 'TRAPPIST-1e', 2, true, true, 7500, 11000, 2);
INSERT INTO public.planet VALUES (12, 'HD 209458 b', 3, false, true, 7000, 150000, 0);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 1, 4600, true, 0, 5778, 1);
INSERT INTO public.star VALUES (2, 'Alpha Centauri', 1, 6000, true, 4.37, 5790, 1);
INSERT INTO public.star VALUES (3, 'Betelgeuse', 1, 8000, true, 642.5, 3500, 15);
INSERT INTO public.star VALUES (4, 'Vega', 1, 455, true, 25.04, 9600, 2);
INSERT INTO public.star VALUES (5, 'Sirius', 1, 230, true, 8.6, 9940, 2);
INSERT INTO public.star VALUES (6, 'Proxima Centauri', 1, 4800, true, 4.24, 3042, 0);


--
-- Name: comet_comet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.comet_comet_id_seq', 3, true);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 20, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 6, true);


--
-- Name: comet comet_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.comet
    ADD CONSTRAINT comet_name_key UNIQUE (name);


--
-- Name: comet comet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.comet
    ADD CONSTRAINT comet_pkey PRIMARY KEY (comet_id);


--
-- Name: galaxy galaxy_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_name_key UNIQUE (name);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_name_key UNIQUE (name);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: planet planet_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_name_key UNIQUE (name);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: star star_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_name_key UNIQUE (name);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: comet comet_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.comet
    ADD CONSTRAINT comet_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: moon moon_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet planet_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--

