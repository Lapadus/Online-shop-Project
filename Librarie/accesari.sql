--
-- PostgreSQL database dump
--

-- Dumped from database version 14.0
-- Dumped by pg_dump version 14.0

-- Started on 2022-01-21 14:44:11

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
-- TOC entry 215 (class 1259 OID 16499)
-- Name: accesari; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.accesari (
    id integer NOT NULL,
    ip character varying(200),
    user_id integer,
    pagina character varying(200),
    data_accesare timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE public.accesari OWNER TO postgres;

--
-- TOC entry 216 (class 1259 OID 16504)
-- Name: accesari_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.accesari ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.accesari_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 3325 (class 0 OID 16499)
-- Dependencies: 215
-- Data for Name: accesari; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.accesari (id, ip, user_id, pagina, data_accesare) OVERRIDING SYSTEM VALUE VALUES (1, '::ffff:127.0.0.1', NULL, '/', NULL);
INSERT INTO public.accesari (id, ip, user_id, pagina, data_accesare) OVERRIDING SYSTEM VALUE VALUES (2, '::ffff:127.0.0.1', NULL, '/Resurse/Css/main.css', NULL);
INSERT INTO public.accesari (id, ip, user_id, pagina, data_accesare) OVERRIDING SYSTEM VALUE VALUES (3, '::ffff:127.0.0.1', NULL, '/Resurse/Css/grid.css', NULL);
INSERT INTO public.accesari (id, ip, user_id, pagina, data_accesare) OVERRIDING SYSTEM VALUE VALUES (4, '::1', NULL, '/Resurse/Css/grid_mic.css', NULL);
INSERT INTO public.accesari (id, ip, user_id, pagina, data_accesare) OVERRIDING SYSTEM VALUE VALUES (5, '::1', NULL, '/Resurse/Css/grid_mediu.css', NULL);
INSERT INTO public.accesari (id, ip, user_id, pagina, data_accesare) OVERRIDING SYSTEM VALUE VALUES (6, '::1', NULL, '/Resurse/Css/navigation_bar.css', NULL);
INSERT INTO public.accesari (id, ip, user_id, pagina, data_accesare) OVERRIDING SYSTEM VALUE VALUES (7, '::1', NULL, '/Resurse/Css/home_btn.css', NULL);
INSERT INTO public.accesari (id, ip, user_id, pagina, data_accesare) OVERRIDING SYSTEM VALUE VALUES (8, '::ffff:127.0.0.1', NULL, '/Resurse/Css/tab_iframe.css', NULL);
INSERT INTO public.accesari (id, ip, user_id, pagina, data_accesare) OVERRIDING SYSTEM VALUE VALUES (9, '::ffff:127.0.0.1', NULL, '/Resurse/Css/tab_iframe_mediu.css', NULL);
INSERT INTO public.accesari (id, ip, user_id, pagina, data_accesare) OVERRIDING SYSTEM VALUE VALUES (10, '::1', NULL, '/Resurse/Css/pag_eroare.css', NULL);
INSERT INTO public.accesari (id, ip, user_id, pagina, data_accesare) OVERRIDING SYSTEM VALUE VALUES (11, '::1', NULL, '/Resurse/Css/footer.css', NULL);
INSERT INTO public.accesari (id, ip, user_id, pagina, data_accesare) OVERRIDING SYSTEM VALUE VALUES (12, '::1', NULL, '/Resurse/scss/nav.css', NULL);
INSERT INTO public.accesari (id, ip, user_id, pagina, data_accesare) OVERRIDING SYSTEM VALUE VALUES (13, '::1', NULL, '/Resurse/Css/nav_mediu.css', NULL);
INSERT INTO public.accesari (id, ip, user_id, pagina, data_accesare) OVERRIDING SYSTEM VALUE VALUES (14, '::ffff:127.0.0.1', NULL, '/Resurse/Css/link_top.css', NULL);
INSERT INTO public.accesari (id, ip, user_id, pagina, data_accesare) OVERRIDING SYSTEM VALUE VALUES (15, '::ffff:127.0.0.1', NULL, '/Resurse/Css/despre_noi.css', NULL);
INSERT INTO public.accesari (id, ip, user_id, pagina, data_accesare) OVERRIDING SYSTEM VALUE VALUES (16, '::1', NULL, '/Resurse/Css/galerie_animata.css', NULL);
INSERT INTO public.accesari (id, ip, user_id, pagina, data_accesare) OVERRIDING SYSTEM VALUE VALUES (17, '::1', NULL, '/Resurse/Css/galerie_static_mic.css', NULL);
INSERT INTO public.accesari (id, ip, user_id, pagina, data_accesare) OVERRIDING SYSTEM VALUE VALUES (18, '::1', NULL, '/Resurse/Css/galerie_static_medie.css', NULL);
INSERT INTO public.accesari (id, ip, user_id, pagina, data_accesare) OVERRIDING SYSTEM VALUE VALUES (19, '::1', NULL, '/Resurse/Css/galerie_static.css', NULL);
INSERT INTO public.accesari (id, ip, user_id, pagina, data_accesare) OVERRIDING SYSTEM VALUE VALUES (20, '::ffff:127.0.0.1', NULL, '/Resurse/Js/tema.js', NULL);
INSERT INTO public.accesari (id, ip, user_id, pagina, data_accesare) OVERRIDING SYSTEM VALUE VALUES (21, '::ffff:127.0.0.1', NULL, '/Resurse/Imagini/Hamburger_icon_alb.png', NULL);
INSERT INTO public.accesari (id, ip, user_id, pagina, data_accesare) OVERRIDING SYSTEM VALUE VALUES (22, '::1', NULL, '/Resurse/Imagini/Pag1/agenda.png', NULL);
INSERT INTO public.accesari (id, ip, user_id, pagina, data_accesare) OVERRIDING SYSTEM VALUE VALUES (23, '::1', NULL, '/Resurse/Imagini/Pag1/shelf.png', NULL);
INSERT INTO public.accesari (id, ip, user_id, pagina, data_accesare) OVERRIDING SYSTEM VALUE VALUES (24, '::1', NULL, '/Resurse/Imagini/Pag1/zapada_om.png', NULL);
INSERT INTO public.accesari (id, ip, user_id, pagina, data_accesare) OVERRIDING SYSTEM VALUE VALUES (25, '::1', NULL, '/Resurse/Imagini/Pag1/urs.png', NULL);
INSERT INTO public.accesari (id, ip, user_id, pagina, data_accesare) OVERRIDING SYSTEM VALUE VALUES (26, '::ffff:127.0.0.1', NULL, '/Resurse/Imagini/Pag1/baiat.png', NULL);
INSERT INTO public.accesari (id, ip, user_id, pagina, data_accesare) OVERRIDING SYSTEM VALUE VALUES (27, '::ffff:127.0.0.1', NULL, '/Resurse/Imagini/Pag1/bus.png', NULL);
INSERT INTO public.accesari (id, ip, user_id, pagina, data_accesare) OVERRIDING SYSTEM VALUE VALUES (28, '::1', NULL, '/Resurse/Imagini/Pag1/fulg.png', NULL);
INSERT INTO public.accesari (id, ip, user_id, pagina, data_accesare) OVERRIDING SYSTEM VALUE VALUES (29, '::1', NULL, '/Resurse/Imagini/Pag1/iarna_casa.png', NULL);
INSERT INTO public.accesari (id, ip, user_id, pagina, data_accesare) OVERRIDING SYSTEM VALUE VALUES (30, '::1', NULL, '/Resurse/Imagini/Pag1/merry.png', NULL);
INSERT INTO public.accesari (id, ip, user_id, pagina, data_accesare) OVERRIDING SYSTEM VALUE VALUES (31, '::ffff:127.0.0.1', NULL, '/Resurse/Imagini/Pag1/geniu.png', NULL);
INSERT INTO public.accesari (id, ip, user_id, pagina, data_accesare) OVERRIDING SYSTEM VALUE VALUES (32, '::1', NULL, '/Resurse/Imagini/Pag1/chimie.png', NULL);
INSERT INTO public.accesari (id, ip, user_id, pagina, data_accesare) OVERRIDING SYSTEM VALUE VALUES (33, '::1', NULL, '/Resurse/Imagini/Pag1/blonde.png', NULL);
INSERT INTO public.accesari (id, ip, user_id, pagina, data_accesare) OVERRIDING SYSTEM VALUE VALUES (34, '::1', NULL, '/Resurse/Imagini/Pag1/joaca.png', NULL);
INSERT INTO public.accesari (id, ip, user_id, pagina, data_accesare) OVERRIDING SYSTEM VALUE VALUES (35, '::1', NULL, '/Resurse/Imagini/Pag1/pinguin.png', NULL);
INSERT INTO public.accesari (id, ip, user_id, pagina, data_accesare) OVERRIDING SYSTEM VALUE VALUES (36, '::ffff:127.0.0.1', NULL, '/Resurse/Imagini/Pag1/dovleac_festiv.png', NULL);
INSERT INTO public.accesari (id, ip, user_id, pagina, data_accesare) OVERRIDING SYSTEM VALUE VALUES (37, '::1', NULL, '/Resurse/Css/nav-500.css', NULL);
INSERT INTO public.accesari (id, ip, user_id, pagina, data_accesare) OVERRIDING SYSTEM VALUE VALUES (38, '::1', NULL, '/Resurse/Css/printare.css', NULL);
INSERT INTO public.accesari (id, ip, user_id, pagina, data_accesare) OVERRIDING SYSTEM VALUE VALUES (39, '::1', NULL, '/Resurse/Imagini/favicon.ico', NULL);
INSERT INTO public.accesari (id, ip, user_id, pagina, data_accesare) OVERRIDING SYSTEM VALUE VALUES (40, '::1', NULL, '/login', NULL);
INSERT INTO public.accesari (id, ip, user_id, pagina, data_accesare) OVERRIDING SYSTEM VALUE VALUES (41, '::1', 37, '/index', NULL);
INSERT INTO public.accesari (id, ip, user_id, pagina, data_accesare) OVERRIDING SYSTEM VALUE VALUES (42, '::1', 37, '/Resurse/Css/main.css', NULL);
INSERT INTO public.accesari (id, ip, user_id, pagina, data_accesare) OVERRIDING SYSTEM VALUE VALUES (43, '::1', 37, '/Resurse/Css/grid.css', NULL);
INSERT INTO public.accesari (id, ip, user_id, pagina, data_accesare) OVERRIDING SYSTEM VALUE VALUES (44, '::1', 37, '/Resurse/Css/grid_mic.css', NULL);
INSERT INTO public.accesari (id, ip, user_id, pagina, data_accesare) OVERRIDING SYSTEM VALUE VALUES (45, '::1', 37, '/Resurse/Css/grid_mediu.css', NULL);
INSERT INTO public.accesari (id, ip, user_id, pagina, data_accesare) OVERRIDING SYSTEM VALUE VALUES (46, '::1', 37, '/Resurse/Css/navigation_bar.css', NULL);
INSERT INTO public.accesari (id, ip, user_id, pagina, data_accesare) OVERRIDING SYSTEM VALUE VALUES (47, '::1', 37, '/Resurse/Css/home_btn.css', NULL);
INSERT INTO public.accesari (id, ip, user_id, pagina, data_accesare) OVERRIDING SYSTEM VALUE VALUES (48, '::1', 37, '/Resurse/Css/tab_iframe.css', NULL);
INSERT INTO public.accesari (id, ip, user_id, pagina, data_accesare) OVERRIDING SYSTEM VALUE VALUES (49, '::1', 37, '/Resurse/Css/tab_iframe_mediu.css', NULL);
INSERT INTO public.accesari (id, ip, user_id, pagina, data_accesare) OVERRIDING SYSTEM VALUE VALUES (50, '::1', 37, '/Resurse/Css/pag_eroare.css', NULL);
INSERT INTO public.accesari (id, ip, user_id, pagina, data_accesare) OVERRIDING SYSTEM VALUE VALUES (51, '::1', 37, '/Resurse/Css/footer.css', NULL);
INSERT INTO public.accesari (id, ip, user_id, pagina, data_accesare) OVERRIDING SYSTEM VALUE VALUES (52, '::1', 37, '/Resurse/scss/nav.css', NULL);
INSERT INTO public.accesari (id, ip, user_id, pagina, data_accesare) OVERRIDING SYSTEM VALUE VALUES (53, '::1', 37, '/Resurse/Css/nav_mediu.css', NULL);
INSERT INTO public.accesari (id, ip, user_id, pagina, data_accesare) OVERRIDING SYSTEM VALUE VALUES (54, '::1', 37, '/Resurse/Css/link_top.css', NULL);
INSERT INTO public.accesari (id, ip, user_id, pagina, data_accesare) OVERRIDING SYSTEM VALUE VALUES (55, '::1', 37, '/Resurse/Css/despre_noi.css', NULL);
INSERT INTO public.accesari (id, ip, user_id, pagina, data_accesare) OVERRIDING SYSTEM VALUE VALUES (56, '::1', 37, '/Resurse/Css/galerie_animata.css', NULL);
INSERT INTO public.accesari (id, ip, user_id, pagina, data_accesare) OVERRIDING SYSTEM VALUE VALUES (57, '::1', 37, '/Resurse/Css/galerie_static_mic.css', NULL);
INSERT INTO public.accesari (id, ip, user_id, pagina, data_accesare) OVERRIDING SYSTEM VALUE VALUES (58, '::1', 37, '/Resurse/Css/galerie_static_medie.css', NULL);
INSERT INTO public.accesari (id, ip, user_id, pagina, data_accesare) OVERRIDING SYSTEM VALUE VALUES (59, '::1', 37, '/Resurse/Css/galerie_static.css', NULL);
INSERT INTO public.accesari (id, ip, user_id, pagina, data_accesare) OVERRIDING SYSTEM VALUE VALUES (60, '::1', 37, '/Resurse/Js/tema.js', NULL);
INSERT INTO public.accesari (id, ip, user_id, pagina, data_accesare) OVERRIDING SYSTEM VALUE VALUES (61, '::1', 37, '/Resurse/Imagini/Hamburger_icon_alb.png', NULL);
INSERT INTO public.accesari (id, ip, user_id, pagina, data_accesare) OVERRIDING SYSTEM VALUE VALUES (62, '::1', 37, '/Resurse/Imagini/Pag1/agenda.png', NULL);
INSERT INTO public.accesari (id, ip, user_id, pagina, data_accesare) OVERRIDING SYSTEM VALUE VALUES (63, '::1', 37, '/Resurse/Imagini/Pag1/zapada_om.png', NULL);
INSERT INTO public.accesari (id, ip, user_id, pagina, data_accesare) OVERRIDING SYSTEM VALUE VALUES (64, '::1', 37, '/Resurse/Imagini/Pag1/shelf.png', NULL);
INSERT INTO public.accesari (id, ip, user_id, pagina, data_accesare) OVERRIDING SYSTEM VALUE VALUES (65, '::1', 37, '/Resurse/Imagini/Pag1/baiat.png', NULL);
INSERT INTO public.accesari (id, ip, user_id, pagina, data_accesare) OVERRIDING SYSTEM VALUE VALUES (66, '::1', 37, '/Resurse/Imagini/Pag1/urs.png', NULL);
INSERT INTO public.accesari (id, ip, user_id, pagina, data_accesare) OVERRIDING SYSTEM VALUE VALUES (67, '::1', 37, '/Resurse/Imagini/Pag1/bus.png', NULL);
INSERT INTO public.accesari (id, ip, user_id, pagina, data_accesare) OVERRIDING SYSTEM VALUE VALUES (68, '::1', 37, '/Resurse/Imagini/Pag1/fulg.png', NULL);
INSERT INTO public.accesari (id, ip, user_id, pagina, data_accesare) OVERRIDING SYSTEM VALUE VALUES (69, '::1', 37, '/Resurse/Imagini/Pag1/iarna_casa.png', NULL);
INSERT INTO public.accesari (id, ip, user_id, pagina, data_accesare) OVERRIDING SYSTEM VALUE VALUES (70, '::1', 37, '/Resurse/Imagini/Pag1/merry.png', NULL);
INSERT INTO public.accesari (id, ip, user_id, pagina, data_accesare) OVERRIDING SYSTEM VALUE VALUES (71, '::1', 37, '/Resurse/Imagini/Pag1/geniu.png', NULL);
INSERT INTO public.accesari (id, ip, user_id, pagina, data_accesare) OVERRIDING SYSTEM VALUE VALUES (72, '::1', 37, '/Resurse/Imagini/Pag1/chimie.png', NULL);
INSERT INTO public.accesari (id, ip, user_id, pagina, data_accesare) OVERRIDING SYSTEM VALUE VALUES (73, '::1', 37, '/Resurse/Imagini/Pag1/joaca.png', NULL);
INSERT INTO public.accesari (id, ip, user_id, pagina, data_accesare) OVERRIDING SYSTEM VALUE VALUES (74, '::1', 37, '/Resurse/Imagini/Pag1/blonde.png', NULL);
INSERT INTO public.accesari (id, ip, user_id, pagina, data_accesare) OVERRIDING SYSTEM VALUE VALUES (75, '::1', 37, '/Resurse/Imagini/Pag1/pinguin.png', NULL);
INSERT INTO public.accesari (id, ip, user_id, pagina, data_accesare) OVERRIDING SYSTEM VALUE VALUES (76, '::1', 37, '/Resurse/Imagini/Pag1/dovleac_festiv.png', NULL);
INSERT INTO public.accesari (id, ip, user_id, pagina, data_accesare) OVERRIDING SYSTEM VALUE VALUES (77, '::1', 37, '/Resurse/Css/nav-500.css', NULL);
INSERT INTO public.accesari (id, ip, user_id, pagina, data_accesare) OVERRIDING SYSTEM VALUE VALUES (78, '::1', 37, '/Resurse/Css/printare.css', NULL);
INSERT INTO public.accesari (id, ip, user_id, pagina, data_accesare) OVERRIDING SYSTEM VALUE VALUES (79, '::1', 37, '/logout', NULL);
INSERT INTO public.accesari (id, ip, user_id, pagina, data_accesare) OVERRIDING SYSTEM VALUE VALUES (2511, '::1', NULL, '/', '2022-01-21 14:36:31.955473');
INSERT INTO public.accesari (id, ip, user_id, pagina, data_accesare) OVERRIDING SYSTEM VALUE VALUES (2512, '::1', NULL, '/Resurse/Css/main.css', '2022-01-21 14:36:32.961146');
INSERT INTO public.accesari (id, ip, user_id, pagina, data_accesare) OVERRIDING SYSTEM VALUE VALUES (2513, '::1', NULL, '/Resurse/Css/navigation_bar.css', '2022-01-21 14:36:32.981084');
INSERT INTO public.accesari (id, ip, user_id, pagina, data_accesare) OVERRIDING SYSTEM VALUE VALUES (2514, '::1', NULL, '/Resurse/Css/grid.css', '2022-01-21 14:36:33.018209');
INSERT INTO public.accesari (id, ip, user_id, pagina, data_accesare) OVERRIDING SYSTEM VALUE VALUES (2515, '::1', NULL, '/Resurse/Css/tab_iframe_mediu.css', '2022-01-21 14:36:33.045722');
INSERT INTO public.accesari (id, ip, user_id, pagina, data_accesare) OVERRIDING SYSTEM VALUE VALUES (2516, '::1', NULL, '/Resurse/Css/pag_eroare.css', '2022-01-21 14:36:33.071817');
INSERT INTO public.accesari (id, ip, user_id, pagina, data_accesare) OVERRIDING SYSTEM VALUE VALUES (2517, '::1', NULL, '/Resurse/Css/footer.css', '2022-01-21 14:36:34.016612');
INSERT INTO public.accesari (id, ip, user_id, pagina, data_accesare) OVERRIDING SYSTEM VALUE VALUES (2518, '::1', NULL, '/Resurse/scss/nav.css', '2022-01-21 14:36:34.039702');
INSERT INTO public.accesari (id, ip, user_id, pagina, data_accesare) OVERRIDING SYSTEM VALUE VALUES (2519, '::1', NULL, '/Resurse/Css/link_top.css', '2022-01-21 14:36:34.064374');
INSERT INTO public.accesari (id, ip, user_id, pagina, data_accesare) OVERRIDING SYSTEM VALUE VALUES (2520, '::1', NULL, '/Resurse/Css/despre_noi.css', '2022-01-21 14:36:34.070671');
INSERT INTO public.accesari (id, ip, user_id, pagina, data_accesare) OVERRIDING SYSTEM VALUE VALUES (2521, '::1', NULL, '/Resurse/Css/galerie_animata.css', '2022-01-21 14:36:34.076951');
INSERT INTO public.accesari (id, ip, user_id, pagina, data_accesare) OVERRIDING SYSTEM VALUE VALUES (2522, '::1', NULL, '/Resurse/Css/grid_mic.css', '2022-01-21 14:36:34.082478');
INSERT INTO public.accesari (id, ip, user_id, pagina, data_accesare) OVERRIDING SYSTEM VALUE VALUES (2523, '::1', NULL, '/Resurse/Css/home_btn.css', '2022-01-21 14:36:34.087878');
INSERT INTO public.accesari (id, ip, user_id, pagina, data_accesare) OVERRIDING SYSTEM VALUE VALUES (2524, '::1', NULL, '/Resurse/Css/tab_iframe.css', '2022-01-21 14:36:34.089203');
INSERT INTO public.accesari (id, ip, user_id, pagina, data_accesare) OVERRIDING SYSTEM VALUE VALUES (2525, '::1', NULL, '/Resurse/Css/grid_mediu.css', '2022-01-21 14:36:34.098473');
INSERT INTO public.accesari (id, ip, user_id, pagina, data_accesare) OVERRIDING SYSTEM VALUE VALUES (2526, '::1', NULL, '/Resurse/Css/galerie_static_medie.css', '2022-01-21 14:36:34.107614');
INSERT INTO public.accesari (id, ip, user_id, pagina, data_accesare) OVERRIDING SYSTEM VALUE VALUES (2527, '::1', NULL, '/Resurse/Css/galerie_static_mic.css', '2022-01-21 14:36:34.122898');
INSERT INTO public.accesari (id, ip, user_id, pagina, data_accesare) OVERRIDING SYSTEM VALUE VALUES (2528, '::1', NULL, '/Resurse/Css/galerie_static.css', '2022-01-21 14:36:34.138782');
INSERT INTO public.accesari (id, ip, user_id, pagina, data_accesare) OVERRIDING SYSTEM VALUE VALUES (2529, '::1', NULL, '/Resurse/Css/nav_mediu.css', '2022-01-21 14:36:34.162182');
INSERT INTO public.accesari (id, ip, user_id, pagina, data_accesare) OVERRIDING SYSTEM VALUE VALUES (2530, '::1', NULL, '/Resurse/Css/calendar.css', '2022-01-21 14:36:34.185563');
INSERT INTO public.accesari (id, ip, user_id, pagina, data_accesare) OVERRIDING SYSTEM VALUE VALUES (2531, '::1', NULL, '/Resurse/Js/tema.js', '2022-01-21 14:36:34.213837');
INSERT INTO public.accesari (id, ip, user_id, pagina, data_accesare) OVERRIDING SYSTEM VALUE VALUES (2532, '::1', NULL, '/Resurse/Imagini/Hamburger_icon_alb.png', '2022-01-21 14:36:34.218033');
INSERT INTO public.accesari (id, ip, user_id, pagina, data_accesare) OVERRIDING SYSTEM VALUE VALUES (2533, '::1', NULL, '/Resurse/Imagini/Pag1/agenda.png', '2022-01-21 14:36:34.219852');
INSERT INTO public.accesari (id, ip, user_id, pagina, data_accesare) OVERRIDING SYSTEM VALUE VALUES (2534, '::1', NULL, '/Resurse/Imagini/Pag1/zapada_om.png', '2022-01-21 14:36:34.221262');
INSERT INTO public.accesari (id, ip, user_id, pagina, data_accesare) OVERRIDING SYSTEM VALUE VALUES (2535, '::1', NULL, '/Resurse/Imagini/Pag1/shelf.png', '2022-01-21 14:36:34.22364');
INSERT INTO public.accesari (id, ip, user_id, pagina, data_accesare) OVERRIDING SYSTEM VALUE VALUES (2536, '::1', NULL, '/Resurse/Imagini/Pag1/urs.png', '2022-01-21 14:36:34.225433');
INSERT INTO public.accesari (id, ip, user_id, pagina, data_accesare) OVERRIDING SYSTEM VALUE VALUES (2537, '::1', NULL, '/Resurse/Imagini/Pag1/baiat.png', '2022-01-21 14:36:34.232355');
INSERT INTO public.accesari (id, ip, user_id, pagina, data_accesare) OVERRIDING SYSTEM VALUE VALUES (2538, '::1', NULL, '/Resurse/Imagini/Pag1/bus.png', '2022-01-21 14:36:34.240549');
INSERT INTO public.accesari (id, ip, user_id, pagina, data_accesare) OVERRIDING SYSTEM VALUE VALUES (2539, '::1', NULL, '/Resurse/Imagini/Pag1/fulg.png', '2022-01-21 14:36:34.247901');
INSERT INTO public.accesari (id, ip, user_id, pagina, data_accesare) OVERRIDING SYSTEM VALUE VALUES (2540, '::1', NULL, '/Resurse/Imagini/Pag1/iarna_casa.png', '2022-01-21 14:36:34.253005');
INSERT INTO public.accesari (id, ip, user_id, pagina, data_accesare) OVERRIDING SYSTEM VALUE VALUES (2541, '::1', NULL, '/Resurse/Imagini/Pag1/merry.png', '2022-01-21 14:36:34.254581');
INSERT INTO public.accesari (id, ip, user_id, pagina, data_accesare) OVERRIDING SYSTEM VALUE VALUES (2542, '::1', NULL, '/Resurse/Imagini/Pag1/geniu.png', '2022-01-21 14:36:34.255953');
INSERT INTO public.accesari (id, ip, user_id, pagina, data_accesare) OVERRIDING SYSTEM VALUE VALUES (2543, '::1', NULL, '/Resurse/Imagini/Pag1/chimie.png', '2022-01-21 14:36:34.257259');
INSERT INTO public.accesari (id, ip, user_id, pagina, data_accesare) OVERRIDING SYSTEM VALUE VALUES (2544, '::1', NULL, '/Resurse/Imagini/Pag1/blonde.png', '2022-01-21 14:36:34.258488');
INSERT INTO public.accesari (id, ip, user_id, pagina, data_accesare) OVERRIDING SYSTEM VALUE VALUES (2545, '::1', NULL, '/Resurse/Imagini/Pag1/joaca.png', '2022-01-21 14:36:34.259495');
INSERT INTO public.accesari (id, ip, user_id, pagina, data_accesare) OVERRIDING SYSTEM VALUE VALUES (2546, '::1', NULL, '/Resurse/Imagini/Pag1/pinguin.png', '2022-01-21 14:36:34.260551');
INSERT INTO public.accesari (id, ip, user_id, pagina, data_accesare) OVERRIDING SYSTEM VALUE VALUES (2547, '::1', NULL, '/Resurse/Css/printare.css', '2022-01-21 14:36:34.26175');
INSERT INTO public.accesari (id, ip, user_id, pagina, data_accesare) OVERRIDING SYSTEM VALUE VALUES (2548, '::1', NULL, '/Resurse/Css/nav-500.css', '2022-01-21 14:36:34.262816');
INSERT INTO public.accesari (id, ip, user_id, pagina, data_accesare) OVERRIDING SYSTEM VALUE VALUES (2549, '::1', NULL, '/login', '2022-01-21 14:36:41.346358');
INSERT INTO public.accesari (id, ip, user_id, pagina, data_accesare) OVERRIDING SYSTEM VALUE VALUES (2550, '::1', 37, '/index', '2022-01-21 14:36:41.594107');
INSERT INTO public.accesari (id, ip, user_id, pagina, data_accesare) OVERRIDING SYSTEM VALUE VALUES (2551, '::1', 37, '/Resurse/Css/main.css', '2022-01-21 14:36:42.154768');
INSERT INTO public.accesari (id, ip, user_id, pagina, data_accesare) OVERRIDING SYSTEM VALUE VALUES (2552, '::1', 37, '/Resurse/Css/grid_mediu.css', '2022-01-21 14:36:42.168895');
INSERT INTO public.accesari (id, ip, user_id, pagina, data_accesare) OVERRIDING SYSTEM VALUE VALUES (2553, '::1', 37, '/Resurse/Css/grid.css', '2022-01-21 14:36:42.191577');
INSERT INTO public.accesari (id, ip, user_id, pagina, data_accesare) OVERRIDING SYSTEM VALUE VALUES (2554, '::1', 37, '/Resurse/Css/grid_mic.css', '2022-01-21 14:36:42.201596');
INSERT INTO public.accesari (id, ip, user_id, pagina, data_accesare) OVERRIDING SYSTEM VALUE VALUES (2555, '::1', 37, '/Resurse/Css/navigation_bar.css', '2022-01-21 14:36:42.210907');
INSERT INTO public.accesari (id, ip, user_id, pagina, data_accesare) OVERRIDING SYSTEM VALUE VALUES (2556, '::1', 37, '/Resurse/Css/home_btn.css', '2022-01-21 14:36:42.226009');
INSERT INTO public.accesari (id, ip, user_id, pagina, data_accesare) OVERRIDING SYSTEM VALUE VALUES (2557, '::1', 37, '/Resurse/Css/tab_iframe.css', '2022-01-21 14:36:42.269477');
INSERT INTO public.accesari (id, ip, user_id, pagina, data_accesare) OVERRIDING SYSTEM VALUE VALUES (2558, '::1', 37, '/Resurse/Css/tab_iframe_mediu.css', '2022-01-21 14:36:42.295021');
INSERT INTO public.accesari (id, ip, user_id, pagina, data_accesare) OVERRIDING SYSTEM VALUE VALUES (2559, '::1', 37, '/Resurse/Css/pag_eroare.css', '2022-01-21 14:36:42.586858');
INSERT INTO public.accesari (id, ip, user_id, pagina, data_accesare) OVERRIDING SYSTEM VALUE VALUES (2560, '::1', 37, '/Resurse/Css/footer.css', '2022-01-21 14:36:42.617996');
INSERT INTO public.accesari (id, ip, user_id, pagina, data_accesare) OVERRIDING SYSTEM VALUE VALUES (2561, '::1', 37, '/Resurse/scss/nav.css', '2022-01-21 14:36:42.6193');
INSERT INTO public.accesari (id, ip, user_id, pagina, data_accesare) OVERRIDING SYSTEM VALUE VALUES (2562, '::1', 37, '/Resurse/Css/nav_mediu.css', '2022-01-21 14:36:42.62055');
INSERT INTO public.accesari (id, ip, user_id, pagina, data_accesare) OVERRIDING SYSTEM VALUE VALUES (2563, '::1', 37, '/Resurse/Css/link_top.css', '2022-01-21 14:36:42.621948');
INSERT INTO public.accesari (id, ip, user_id, pagina, data_accesare) OVERRIDING SYSTEM VALUE VALUES (2564, '::1', 37, '/Resurse/Css/despre_noi.css', '2022-01-21 14:36:42.63682');
INSERT INTO public.accesari (id, ip, user_id, pagina, data_accesare) OVERRIDING SYSTEM VALUE VALUES (2565, '::1', 37, '/Resurse/Css/galerie_animata.css', '2022-01-21 14:36:42.639132');
INSERT INTO public.accesari (id, ip, user_id, pagina, data_accesare) OVERRIDING SYSTEM VALUE VALUES (2566, '::1', 37, '/Resurse/Css/galerie_static_mic.css', '2022-01-21 14:36:42.643311');
INSERT INTO public.accesari (id, ip, user_id, pagina, data_accesare) OVERRIDING SYSTEM VALUE VALUES (2567, '::1', 37, '/Resurse/Css/galerie_static_medie.css', '2022-01-21 14:36:42.648941');
INSERT INTO public.accesari (id, ip, user_id, pagina, data_accesare) OVERRIDING SYSTEM VALUE VALUES (2568, '::1', 37, '/Resurse/Css/galerie_static.css', '2022-01-21 14:36:42.656539');
INSERT INTO public.accesari (id, ip, user_id, pagina, data_accesare) OVERRIDING SYSTEM VALUE VALUES (2569, '::1', 37, '/Resurse/Css/calendar.css', '2022-01-21 14:36:42.671949');
INSERT INTO public.accesari (id, ip, user_id, pagina, data_accesare) OVERRIDING SYSTEM VALUE VALUES (2570, '::1', 37, '/Resurse/Js/tema.js', '2022-01-21 14:36:42.676704');
INSERT INTO public.accesari (id, ip, user_id, pagina, data_accesare) OVERRIDING SYSTEM VALUE VALUES (2571, '::1', 37, '/Resurse/Imagini/Pag1/agenda.png', '2022-01-21 14:36:42.684932');
INSERT INTO public.accesari (id, ip, user_id, pagina, data_accesare) OVERRIDING SYSTEM VALUE VALUES (2572, '::1', 37, '/Resurse/Imagini/Hamburger_icon_alb.png', '2022-01-21 14:36:42.704583');
INSERT INTO public.accesari (id, ip, user_id, pagina, data_accesare) OVERRIDING SYSTEM VALUE VALUES (2573, '::1', 37, '/Resurse/Imagini/Pag1/zapada_om.png', '2022-01-21 14:36:42.712226');
INSERT INTO public.accesari (id, ip, user_id, pagina, data_accesare) OVERRIDING SYSTEM VALUE VALUES (2574, '::1', 37, '/Resurse/Imagini/Pag1/shelf.png', '2022-01-21 14:36:42.734171');
INSERT INTO public.accesari (id, ip, user_id, pagina, data_accesare) OVERRIDING SYSTEM VALUE VALUES (2575, '::1', 37, '/Resurse/Imagini/Pag1/urs.png', '2022-01-21 14:36:42.741318');
INSERT INTO public.accesari (id, ip, user_id, pagina, data_accesare) OVERRIDING SYSTEM VALUE VALUES (2576, '::1', 37, '/Resurse/Imagini/Pag1/baiat.png', '2022-01-21 14:36:42.744712');
INSERT INTO public.accesari (id, ip, user_id, pagina, data_accesare) OVERRIDING SYSTEM VALUE VALUES (2577, '::1', 37, '/Resurse/Imagini/Pag1/bus.png', '2022-01-21 14:36:42.7471');
INSERT INTO public.accesari (id, ip, user_id, pagina, data_accesare) OVERRIDING SYSTEM VALUE VALUES (2578, '::1', 37, '/Resurse/Imagini/Pag1/fulg.png', '2022-01-21 14:36:42.752533');
INSERT INTO public.accesari (id, ip, user_id, pagina, data_accesare) OVERRIDING SYSTEM VALUE VALUES (2579, '::1', 37, '/Resurse/Imagini/Pag1/merry.png', '2022-01-21 14:36:42.754034');
INSERT INTO public.accesari (id, ip, user_id, pagina, data_accesare) OVERRIDING SYSTEM VALUE VALUES (2580, '::1', 37, '/Resurse/Imagini/Pag1/iarna_casa.png', '2022-01-21 14:36:42.755177');
INSERT INTO public.accesari (id, ip, user_id, pagina, data_accesare) OVERRIDING SYSTEM VALUE VALUES (2581, '::1', 37, '/Resurse/Imagini/Pag1/geniu.png', '2022-01-21 14:36:42.755937');
INSERT INTO public.accesari (id, ip, user_id, pagina, data_accesare) OVERRIDING SYSTEM VALUE VALUES (2582, '::1', 37, '/Resurse/Imagini/Pag1/chimie.png', '2022-01-21 14:36:42.756625');
INSERT INTO public.accesari (id, ip, user_id, pagina, data_accesare) OVERRIDING SYSTEM VALUE VALUES (2583, '::1', 37, '/Resurse/Imagini/Pag1/blonde.png', '2022-01-21 14:36:42.757599');
INSERT INTO public.accesari (id, ip, user_id, pagina, data_accesare) OVERRIDING SYSTEM VALUE VALUES (2584, '::1', 37, '/Resurse/Imagini/Pag1/joaca.png', '2022-01-21 14:36:42.758344');
INSERT INTO public.accesari (id, ip, user_id, pagina, data_accesare) OVERRIDING SYSTEM VALUE VALUES (2585, '::1', 37, '/Resurse/Imagini/Pag1/pinguin.png', '2022-01-21 14:36:42.760021');
INSERT INTO public.accesari (id, ip, user_id, pagina, data_accesare) OVERRIDING SYSTEM VALUE VALUES (2586, '::1', 37, '/Resurse/Css/nav-500.css', '2022-01-21 14:36:42.762058');
INSERT INTO public.accesari (id, ip, user_id, pagina, data_accesare) OVERRIDING SYSTEM VALUE VALUES (2587, '::1', 37, '/Resurse/Css/printare.css', '2022-01-21 14:36:42.763748');
INSERT INTO public.accesari (id, ip, user_id, pagina, data_accesare) OVERRIDING SYSTEM VALUE VALUES (2588, '::1', 37, '/logout', '2022-01-21 14:36:50.477138');
INSERT INTO public.accesari (id, ip, user_id, pagina, data_accesare) OVERRIDING SYSTEM VALUE VALUES (2589, '::1', NULL, '/', '2022-01-21 14:37:36.943722');
INSERT INTO public.accesari (id, ip, user_id, pagina, data_accesare) OVERRIDING SYSTEM VALUE VALUES (2590, '::1', NULL, '/Resurse/Css/main.css', '2022-01-21 14:37:37.480515');
INSERT INTO public.accesari (id, ip, user_id, pagina, data_accesare) OVERRIDING SYSTEM VALUE VALUES (2591, '::1', NULL, '/Resurse/Css/grid.css', '2022-01-21 14:37:37.497377');
INSERT INTO public.accesari (id, ip, user_id, pagina, data_accesare) OVERRIDING SYSTEM VALUE VALUES (2592, '::1', NULL, '/Resurse/Css/grid_mic.css', '2022-01-21 14:37:37.556996');
INSERT INTO public.accesari (id, ip, user_id, pagina, data_accesare) OVERRIDING SYSTEM VALUE VALUES (2593, '::1', NULL, '/Resurse/Css/grid_mediu.css', '2022-01-21 14:37:37.577153');
INSERT INTO public.accesari (id, ip, user_id, pagina, data_accesare) OVERRIDING SYSTEM VALUE VALUES (2594, '::1', NULL, '/Resurse/Css/navigation_bar.css', '2022-01-21 14:37:37.581397');
INSERT INTO public.accesari (id, ip, user_id, pagina, data_accesare) OVERRIDING SYSTEM VALUE VALUES (2595, '::1', NULL, '/Resurse/Css/home_btn.css', '2022-01-21 14:37:37.590199');
INSERT INTO public.accesari (id, ip, user_id, pagina, data_accesare) OVERRIDING SYSTEM VALUE VALUES (2596, '::1', NULL, '/Resurse/Css/tab_iframe.css', '2022-01-21 14:37:37.625775');
INSERT INTO public.accesari (id, ip, user_id, pagina, data_accesare) OVERRIDING SYSTEM VALUE VALUES (2597, '::1', NULL, '/Resurse/Css/tab_iframe_mediu.css', '2022-01-21 14:37:37.634638');
INSERT INTO public.accesari (id, ip, user_id, pagina, data_accesare) OVERRIDING SYSTEM VALUE VALUES (2598, '::1', NULL, '/Resurse/Css/pag_eroare.css', '2022-01-21 14:37:37.649128');
INSERT INTO public.accesari (id, ip, user_id, pagina, data_accesare) OVERRIDING SYSTEM VALUE VALUES (2599, '::1', NULL, '/Resurse/scss/nav.css', '2022-01-21 14:37:37.676048');
INSERT INTO public.accesari (id, ip, user_id, pagina, data_accesare) OVERRIDING SYSTEM VALUE VALUES (2600, '::1', NULL, '/Resurse/Css/nav_mediu.css', '2022-01-21 14:37:37.688865');
INSERT INTO public.accesari (id, ip, user_id, pagina, data_accesare) OVERRIDING SYSTEM VALUE VALUES (2601, '::1', NULL, '/Resurse/Css/footer.css', '2022-01-21 14:37:37.709542');
INSERT INTO public.accesari (id, ip, user_id, pagina, data_accesare) OVERRIDING SYSTEM VALUE VALUES (2602, '::1', NULL, '/Resurse/Css/link_top.css', '2022-01-21 14:37:37.735584');
INSERT INTO public.accesari (id, ip, user_id, pagina, data_accesare) OVERRIDING SYSTEM VALUE VALUES (2603, '::1', NULL, '/Resurse/Css/despre_noi.css', '2022-01-21 14:37:38.168705');
INSERT INTO public.accesari (id, ip, user_id, pagina, data_accesare) OVERRIDING SYSTEM VALUE VALUES (2604, '::1', NULL, '/Resurse/Css/galerie_animata.css', '2022-01-21 14:37:38.171895');
INSERT INTO public.accesari (id, ip, user_id, pagina, data_accesare) OVERRIDING SYSTEM VALUE VALUES (2605, '::1', NULL, '/Resurse/Css/galerie_static_mic.css', '2022-01-21 14:37:38.179362');
INSERT INTO public.accesari (id, ip, user_id, pagina, data_accesare) OVERRIDING SYSTEM VALUE VALUES (2606, '::1', NULL, '/Resurse/Css/galerie_static.css', '2022-01-21 14:37:38.180872');
INSERT INTO public.accesari (id, ip, user_id, pagina, data_accesare) OVERRIDING SYSTEM VALUE VALUES (2607, '::1', NULL, '/Resurse/Css/galerie_static_medie.css', '2022-01-21 14:37:38.186463');
INSERT INTO public.accesari (id, ip, user_id, pagina, data_accesare) OVERRIDING SYSTEM VALUE VALUES (2608, '::1', NULL, '/Resurse/Css/calendar.css', '2022-01-21 14:37:38.200386');
INSERT INTO public.accesari (id, ip, user_id, pagina, data_accesare) OVERRIDING SYSTEM VALUE VALUES (2609, '::1', NULL, '/Resurse/Js/tema.js', '2022-01-21 14:37:38.210062');
INSERT INTO public.accesari (id, ip, user_id, pagina, data_accesare) OVERRIDING SYSTEM VALUE VALUES (2610, '::1', NULL, '/Resurse/Imagini/Hamburger_icon_alb.png', '2022-01-21 14:37:38.222166');
INSERT INTO public.accesari (id, ip, user_id, pagina, data_accesare) OVERRIDING SYSTEM VALUE VALUES (2611, '::1', NULL, '/Resurse/Imagini/Pag1/agenda.png', '2022-01-21 14:37:38.248507');
INSERT INTO public.accesari (id, ip, user_id, pagina, data_accesare) OVERRIDING SYSTEM VALUE VALUES (2612, '::1', NULL, '/Resurse/Imagini/Pag1/zapada_om.png', '2022-01-21 14:37:38.259599');
INSERT INTO public.accesari (id, ip, user_id, pagina, data_accesare) OVERRIDING SYSTEM VALUE VALUES (2613, '::1', NULL, '/Resurse/Imagini/Pag1/shelf.png', '2022-01-21 14:37:38.278453');
INSERT INTO public.accesari (id, ip, user_id, pagina, data_accesare) OVERRIDING SYSTEM VALUE VALUES (2614, '::1', NULL, '/Resurse/Imagini/Pag1/urs.png', '2022-01-21 14:37:38.309446');
INSERT INTO public.accesari (id, ip, user_id, pagina, data_accesare) OVERRIDING SYSTEM VALUE VALUES (2615, '::1', NULL, '/Resurse/Imagini/Pag1/baiat.png', '2022-01-21 14:37:38.312159');
INSERT INTO public.accesari (id, ip, user_id, pagina, data_accesare) OVERRIDING SYSTEM VALUE VALUES (2616, '::1', NULL, '/Resurse/Imagini/Pag1/bus.png', '2022-01-21 14:37:38.324502');
INSERT INTO public.accesari (id, ip, user_id, pagina, data_accesare) OVERRIDING SYSTEM VALUE VALUES (2617, '::1', NULL, '/Resurse/Imagini/Pag1/fulg.png', '2022-01-21 14:37:38.358942');
INSERT INTO public.accesari (id, ip, user_id, pagina, data_accesare) OVERRIDING SYSTEM VALUE VALUES (2618, '::1', NULL, '/Resurse/Imagini/Pag1/iarna_casa.png', '2022-01-21 14:37:38.376321');
INSERT INTO public.accesari (id, ip, user_id, pagina, data_accesare) OVERRIDING SYSTEM VALUE VALUES (2619, '::1', NULL, '/Resurse/Imagini/Pag1/merry.png', '2022-01-21 14:37:38.396605');
INSERT INTO public.accesari (id, ip, user_id, pagina, data_accesare) OVERRIDING SYSTEM VALUE VALUES (2620, '::1', NULL, '/Resurse/Imagini/Pag1/geniu.png', '2022-01-21 14:37:38.42626');
INSERT INTO public.accesari (id, ip, user_id, pagina, data_accesare) OVERRIDING SYSTEM VALUE VALUES (2621, '::1', NULL, '/Resurse/Imagini/Pag1/chimie.png', '2022-01-21 14:37:38.429327');
INSERT INTO public.accesari (id, ip, user_id, pagina, data_accesare) OVERRIDING SYSTEM VALUE VALUES (2622, '::1', NULL, '/Resurse/Imagini/Pag1/blonde.png', '2022-01-21 14:37:38.432359');
INSERT INTO public.accesari (id, ip, user_id, pagina, data_accesare) OVERRIDING SYSTEM VALUE VALUES (2623, '::1', NULL, '/Resurse/Imagini/Pag1/joaca.png', '2022-01-21 14:37:38.433906');
INSERT INTO public.accesari (id, ip, user_id, pagina, data_accesare) OVERRIDING SYSTEM VALUE VALUES (2624, '::1', NULL, '/Resurse/Imagini/Pag1/pinguin.png', '2022-01-21 14:37:38.435872');
INSERT INTO public.accesari (id, ip, user_id, pagina, data_accesare) OVERRIDING SYSTEM VALUE VALUES (2625, '::1', NULL, '/Resurse/Css/nav-500.css', '2022-01-21 14:37:38.440043');
INSERT INTO public.accesari (id, ip, user_id, pagina, data_accesare) OVERRIDING SYSTEM VALUE VALUES (2626, '::1', NULL, '/Resurse/Imagini/Pag1/dovleac_festiv.png', '2022-01-21 14:37:38.441617');
INSERT INTO public.accesari (id, ip, user_id, pagina, data_accesare) OVERRIDING SYSTEM VALUE VALUES (2627, '::1', NULL, '/Resurse/Css/printare.css', '2022-01-21 14:37:38.443241');


--
-- TOC entry 3333 (class 0 OID 0)
-- Dependencies: 216
-- Name: accesari_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.accesari_id_seq', 2627, true);


--
-- TOC entry 3185 (class 2606 OID 16503)
-- Name: accesari accesari_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.accesari
    ADD CONSTRAINT accesari_pkey PRIMARY KEY (id);


--
-- TOC entry 3332 (class 0 OID 0)
-- Dependencies: 215
-- Name: TABLE accesari; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.accesari TO raluca;


-- Completed on 2022-01-21 14:44:12

--
-- PostgreSQL database dump complete
--

