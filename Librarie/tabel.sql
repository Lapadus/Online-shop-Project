--
-- PostgreSQL database dump
--

-- Dumped from database version 14.0
-- Dumped by pg_dump version 14.0

-- Started on 2021-11-22 14:51:27

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
-- TOC entry 210 (class 1259 OID 16396)
-- Name: tabel_proiect; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.tabel_proiect (
    id integer NOT NULL,
    nume character varying(100) NOT NULL,
    pret integer NOT NULL,
    online boolean DEFAULT true NOT NULL
);


ALTER TABLE public.tabel_proiect OWNER TO postgres;

--
-- TOC entry 209 (class 1259 OID 16395)
-- Name: tabel_proiect_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.tabel_proiect ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.tabel_proiect_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 3309 (class 0 OID 16396)
-- Dependencies: 210
-- Data for Name: tabel_proiect; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.tabel_proiect (id, nume, pret, online) OVERRIDING SYSTEM VALUE VALUES (1, 'ceva', 100, true);
INSERT INTO public.tabel_proiect (id, nume, pret, online) OVERRIDING SYSTEM VALUE VALUES (2, 'ceva2', 200, false);
INSERT INTO public.tabel_proiect (id, nume, pret, online) OVERRIDING SYSTEM VALUE VALUES (3, 'altceva', 300, true);


--
-- TOC entry 3317 (class 0 OID 0)
-- Dependencies: 209
-- Name: tabel_proiect_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.tabel_proiect_id_seq', 3, true);


--
-- TOC entry 3168 (class 2606 OID 16400)
-- Name: tabel_proiect tabel_proiect_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tabel_proiect
    ADD CONSTRAINT tabel_proiect_pkey PRIMARY KEY (id);


--
-- TOC entry 3315 (class 0 OID 0)
-- Dependencies: 210
-- Name: TABLE tabel_proiect; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.tabel_proiect TO raluca;


--
-- TOC entry 3316 (class 0 OID 0)
-- Dependencies: 209
-- Name: SEQUENCE tabel_proiect_id_seq; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON SEQUENCE public.tabel_proiect_id_seq TO raluca;


-- Completed on 2021-11-22 14:51:27

--
-- PostgreSQL database dump complete
--

