--
-- PostgreSQL database dump
--

-- Dumped from database version 14.0
-- Dumped by pg_dump version 14.0

-- Started on 2021-11-22 14:34:21

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

--
-- TOC entry 3314 (class 0 OID 16403)
-- Dependencies: 211
-- Data for Name: produse; Type: TABLE DATA; Schema: public; Owner: raluca
--



--
-- TOC entry 3313 (class 0 OID 16396)
-- Dependencies: 210
-- Data for Name: tabel_proiect; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.tabel_proiect (id, nume, pret, online) OVERRIDING SYSTEM VALUE VALUES (1, 'ceva', 100, true);
INSERT INTO public.tabel_proiect (id, nume, pret, online) OVERRIDING SYSTEM VALUE VALUES (2, 'ceva2', 200, false);
INSERT INTO public.tabel_proiect (id, nume, pret, online) OVERRIDING SYSTEM VALUE VALUES (3, 'altceva', 300, true);


--
-- TOC entry 3322 (class 0 OID 0)
-- Dependencies: 209
-- Name: tabel_proiect_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.tabel_proiect_id_seq', 3, true);


-- Completed on 2021-11-22 14:34:21

--
-- PostgreSQL database dump complete
--

