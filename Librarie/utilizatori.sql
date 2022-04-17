-- Type: roluri

-- DROP TYPE public.roluri;

CREATE TYPE public.roluri AS ENUM
    ('admin', 'moderator', 'comun');

ALTER TYPE public.roluri
    OWNER TO postgres;
--
-- PostgreSQL database dump
--

-- Dumped from database version 14.0
-- Dumped by pg_dump version 14.0

-- Started on 2022-01-21 15:18:19

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
-- TOC entry 214 (class 1259 OID 16484)
-- Name: utilizatori; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.utilizatori (
    id integer NOT NULL,
    username character varying(50) NOT NULL,
    nume character varying(100) NOT NULL,
    prenume character varying(100) NOT NULL,
    parola character varying(100) NOT NULL,
    rol public.roluri DEFAULT 'comun'::public.roluri NOT NULL,
    email character varying(100) NOT NULL,
    culoare_chat character varying(50) NOT NULL,
    data_adaugare timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    problema_vedere boolean,
    fotografie character varying(300),
    cod character varying(300),
    confirmat_mail boolean DEFAULT false
);


ALTER TABLE public.utilizatori OWNER TO postgres;

--
-- TOC entry 213 (class 1259 OID 16483)
-- Name: utilizatori_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.utilizatori_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.utilizatori_id_seq OWNER TO postgres;

--
-- TOC entry 3338 (class 0 OID 0)
-- Dependencies: 213
-- Name: utilizatori_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.utilizatori_id_seq OWNED BY public.utilizatori.id;


--
-- TOC entry 3183 (class 2604 OID 16487)
-- Name: utilizatori id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.utilizatori ALTER COLUMN id SET DEFAULT nextval('public.utilizatori_id_seq'::regclass);


--
-- TOC entry 3331 (class 0 OID 16484)
-- Dependencies: 214
-- Data for Name: utilizatori; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.utilizatori (id, username, nume, prenume, parola, rol, email, culoare_chat, data_adaugare, problema_vedere, fotografie, cod, confirmat_mail) VALUES (1, 'RalucaLapadus', 'Lapadus', 'Raluca', 'fhL&7U3Q&PcC6pxMaI3E9[', 'comun', 'raluca@gmail.com', 'green', '2021-12-16 12:20:24.749142', NULL, NULL, NULL, NULL);
INSERT INTO public.utilizatori (id, username, nume, prenume, parola, rol, email, culoare_chat, data_adaugare, problema_vedere, fotografie, cod, confirmat_mail) VALUES (37, 'Admin', 'adm', 'adm', 'fhL&7U3Q&PcC6pxMaI3E9[', 'admin', 'raluca.lapadus13@gmail.com', 'red', '2022-01-10 14:00:33.968521', true, '', '20220114033/Admin/SFLWDLCQGVPZFBDNSBQFDKHGDZBGXSMWGQKWVFRNBLXCLBQZTWKDFSDQYZWBSFYKLVWPMLTDLLYTNZNLCCGZYMJQSMKSZZBWBVRW', true);
INSERT INTO public.utilizatori (id, username, nume, prenume, parola, rol, email, culoare_chat, data_adaugare, problema_vedere, fotografie, cod, confirmat_mail) VALUES (43, 'test', 'Ana', 'Maria', 'fhL&7U3Q&PcC6pxMaI3E9[', 'comun', 'raluca.lapadus13@gmail.com', 'red', '2022-01-21 15:16:23.770619', NULL, '/poze_uploadate/test/poza.jpg', '202205151623/test/TJYTCSKXYCQQKFNGYSYMKYHGZZKLGTCLDJYYLXXSMXMBNDBKZHSCGVCTYTTHGXYZKXYLTZQJDCMWZCCXMLDMPWTBQQXFWFTDXDPN', true);


--
-- TOC entry 3340 (class 0 OID 0)
-- Dependencies: 213
-- Name: utilizatori_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.utilizatori_id_seq', 43, true);


--
-- TOC entry 3188 (class 2606 OID 16493)
-- Name: utilizatori utilizatori_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.utilizatori
    ADD CONSTRAINT utilizatori_pkey PRIMARY KEY (id);


--
-- TOC entry 3190 (class 2606 OID 16495)
-- Name: utilizatori utilizatori_username_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.utilizatori
    ADD CONSTRAINT utilizatori_username_key UNIQUE (username);


--
-- TOC entry 3337 (class 0 OID 0)
-- Dependencies: 214
-- Name: TABLE utilizatori; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.utilizatori TO raluca;


--
-- TOC entry 3339 (class 0 OID 0)
-- Dependencies: 213
-- Name: SEQUENCE utilizatori_id_seq; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON SEQUENCE public.utilizatori_id_seq TO raluca;


-- Completed on 2022-01-21 15:18:20

--
-- PostgreSQL database dump complete
--

