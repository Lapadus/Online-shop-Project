--
-- PostgreSQL database dump
--

-- Dumped from database version 14.0
-- Dumped by pg_dump version 14.0

-- Started on 2021-12-06 14:08:37

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
-- TOC entry 211 (class 1259 OID 16403)
-- Name: produse; Type: TABLE; Schema: public; Owner: raluca
--
CREATE TYPE public.culori AS ENUM
    ('rosu', 'galben', 'multicolor', 'verde', 'alb', 'mov', 'portocaliu');

CREATE TYPE public.tipuri_mici AS ENUM
    ('petrecere', 'scoala', 'special', 'comun', 'sarbatoare');

CREATE TYPE public.tipuri_produse AS ENUM
    ('rechizite', 'arte plastice', 'papetarie', 'birotica', 'articole scoala');

CREATE TABLE public.produse (
    id integer NOT NULL,
    nume character varying(100) NOT NULL,
    descriere character varying(300),
    imagine character varying(100) NOT NULL,
    pret integer NOT NULL,
    timp_garantie integer NOT NULL,
    data_oferta date NOT NULL,
    modalitati_folosire "char"[] NOT NULL,
    reducere boolean NOT NULL,
    categ_mare public.tipuri_produse NOT NULL,
    categ_mica public.tipuri_mici NOT NULL,
    culoare public.culori NOT NULL
);


ALTER TABLE public.produse OWNER TO raluca;

--
-- TOC entry 212 (class 1259 OID 16434)
-- Name: produse_id_seq; Type: SEQUENCE; Schema: public; Owner: raluca
--

ALTER TABLE public.produse ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.produse_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 3314 (class 0 OID 16403)
-- Dependencies: 211
-- Data for Name: produse; Type: TABLE DATA; Schema: public; Owner: raluca
--

INSERT INTO public.produse (id, nume, descriere, imagine, pret, timp_garantie, data_oferta, modalitati_folosire, reducere, categ_mare, categ_mica, culoare) OVERRIDING SYSTEM VALUE VALUES (22, 'Raportor', 'Grade atent masurate', '/Resurse/Imagini/Pag2/raportor.png', 20, 10, '2021-04-25', '{e,s,a}', true, 'rechizite', 'scoala', 'alb');
INSERT INTO public.produse (id, nume, descriere, imagine, pret, timp_garantie, data_oferta, modalitati_folosire, reducere, categ_mare, categ_mica, culoare) OVERRIDING SYSTEM VALUE VALUES (23, 'Rigla', 'Cele mai drepte linii, doar cu rigla de la libraria noastra', '/Resurse/Imagini/Pag2/rigla.png', 10, 2, '2021-05-20', '{e,s,a}', false, 'rechizite', 'scoala', 'galben');
INSERT INTO public.produse (id, nume, descriere, imagine, pret, timp_garantie, data_oferta, modalitati_folosire, reducere, categ_mare, categ_mica, culoare) OVERRIDING SYSTEM VALUE VALUES (2, 'Manuale', 'La inceputul fiecarui an scolar avem nevoie de un nou set de manuale de pe care sa invatatm cu placere.', '/Resurse/Imagini/Pag2/carti.png', 120, 25, '2021-07-25', '{e,s}', true, 'articole scoala', 'scoala', 'multicolor');
INSERT INTO public.produse (id, nume, descriere, imagine, pret, timp_garantie, data_oferta, modalitati_folosire, reducere, categ_mare, categ_mica, culoare) OVERRIDING SYSTEM VALUE VALUES (4, 'Carte drama', 'Dramele sunt cele mai indragine genuri', '/Resurse/Imagini/Pag2/carti_drama.png', 75, 5, '2021-05-22', '{a,t,s}', false, 'articole scoala', 'comun', 'multicolor');
INSERT INTO public.produse (id, nume, descriere, imagine, pret, timp_garantie, data_oferta, modalitati_folosire, reducere, categ_mare, categ_mica, culoare) OVERRIDING SYSTEM VALUE VALUES (13, 'Trafalet', 'Ce frumos e sa colorezi', '/Resurse/Imagini/Pag2/trafalet.png', 37, 2, '2020-10-25', '{a}', false, 'arte plastice', 'comun', 'alb');
INSERT INTO public.produse (id, nume, descriere, imagine, pret, timp_garantie, data_oferta, modalitati_folosire, reducere, categ_mare, categ_mica, culoare) OVERRIDING SYSTEM VALUE VALUES (24, 'Echer', 'Cele mai drepte unghiuri numai cu echerul nostru', '/Resurse/Imagini/Pag2/echer.png', 15, 3, '2022-01-28', '{e,s,a}', true, 'rechizite', 'special', 'alb');
INSERT INTO public.produse (id, nume, descriere, imagine, pret, timp_garantie, data_oferta, modalitati_folosire, reducere, categ_mare, categ_mica, culoare) OVERRIDING SYSTEM VALUE VALUES (25, 'Agenda', 'Pentru o memorare mai usoare nu uita de agenda noastra', '/Resurse/Imagini/Pag2/agenda.png', 25, 0, '2022-01-30', '{a,s}', false, 'papetarie', 'petrecere', 'galben');
INSERT INTO public.produse (id, nume, descriere, imagine, pret, timp_garantie, data_oferta, modalitati_folosire, reducere, categ_mare, categ_mica, culoare) OVERRIDING SYSTEM VALUE VALUES (14, 'Mini Tabla', 'Retine noutatile', '/Resurse/Imagini/Pag2/mini_tabla.png', 56, 7, '2022-12-25', '{e,p,s}', false, 'arte plastice', 'comun', 'mov');
INSERT INTO public.produse (id, nume, descriere, imagine, pret, timp_garantie, data_oferta, modalitati_folosire, reducere, categ_mare, categ_mica, culoare) OVERRIDING SYSTEM VALUE VALUES (15, 'Pistol lipici', 'Lipeste mai usor', '/Resurse/Imagini/Pag2/pistol_lipici.png', 115, 25, '2020-03-14', '{a}', true, 'arte plastice', 'comun', 'portocaliu');
INSERT INTO public.produse (id, nume, descriere, imagine, pret, timp_garantie, data_oferta, modalitati_folosire, reducere, categ_mare, categ_mica, culoare) OVERRIDING SYSTEM VALUE VALUES (16, 'Sfoara', 'Impodobeste cadourile', '/Resurse/Imagini/Pag2/sfoara.png', 10, 0, '2020-07-20', '{a,e}', false, 'arte plastice', 'petrecere', 'rosu');
INSERT INTO public.produse (id, nume, descriere, imagine, pret, timp_garantie, data_oferta, modalitati_folosire, reducere, categ_mare, categ_mica, culoare) OVERRIDING SYSTEM VALUE VALUES (17, 'Acuarele', 'Coloreaza fericit', '/Resurse/Imagini/Pag2/acuarele.png', 70, 2, '2021-08-20', '{e,p,j}', true, 'rechizite', 'special', 'multicolor');
INSERT INTO public.produse (id, nume, descriere, imagine, pret, timp_garantie, data_oferta, modalitati_folosire, reducere, categ_mare, categ_mica, culoare) OVERRIDING SYSTEM VALUE VALUES (12, 'Lipici', 'Nimic nu lipeste mai bine decat super-glue!', '/Resurse/Imagini/Pag2/lipici.png', 25, 1, '2020-12-02', '{e,p,d}', true, 'arte plastice', 'comun', 'alb');
INSERT INTO public.produse (id, nume, descriere, imagine, pret, timp_garantie, data_oferta, modalitati_folosire, reducere, categ_mare, categ_mica, culoare) OVERRIDING SYSTEM VALUE VALUES (5, 'Carte istorie', 'Istoria trebuie stiuta pentru a nu repeta greselile', '/Resurse/Imagini/Pag2/carti_istorie.png', 150, 15, '2021-04-05', '{c,a,p}', true, 'articole scoala', 'scoala', 'rosu');
INSERT INTO public.produse (id, nume, descriere, imagine, pret, timp_garantie, data_oferta, modalitati_folosire, reducere, categ_mare, categ_mica, culoare) OVERRIDING SYSTEM VALUE VALUES (26, 'Clipboard', 'E timpul sa iti iei notite!', '/Resurse/Imagini/Pag2/clipboard.png', 15, 30, '2021-02-18', '{a,s,p}', true, 'papetarie', 'petrecere', 'alb');
INSERT INTO public.produse (id, nume, descriere, imagine, pret, timp_garantie, data_oferta, modalitati_folosire, reducere, categ_mare, categ_mica, culoare) OVERRIDING SYSTEM VALUE VALUES (6, 'Carte de stiinte', 'Stiinta este importanta', '/Resurse/Imagini/Pag2/carti_stiinte.png', 84, 10, '2021-02-13', '{e,s,p}', true, 'articole scoala', 'scoala', 'verde');
INSERT INTO public.produse (id, nume, descriere, imagine, pret, timp_garantie, data_oferta, modalitati_folosire, reducere, categ_mare, categ_mica, culoare) OVERRIDING SYSTEM VALUE VALUES (7, 'Culegeri', 'Invata mai mult', '/Resurse/Imagini/Pag2/manuale.png', 52, 2, '2020-04-15', '{e,p,s}', true, 'articole scoala', 'scoala', 'verde');
INSERT INTO public.produse (id, nume, descriere, imagine, pret, timp_garantie, data_oferta, modalitati_folosire, reducere, categ_mare, categ_mica, culoare) OVERRIDING SYSTEM VALUE VALUES (18, 'Paleta', 'Amesteca si compune culori', '/Resurse/Imagini/Pag2/suport.png', 5, 5, '2021-05-15', '{p,e}', true, 'rechizite', 'special', 'galben');
INSERT INTO public.produse (id, nume, descriere, imagine, pret, timp_garantie, data_oferta, modalitati_folosire, reducere, categ_mare, categ_mica, culoare) OVERRIDING SYSTEM VALUE VALUES (19, 'Pensula', 'Pensula moale', '/Resurse/Imagini/Pag2/pensula.png', 30, 15, '2021-04-25', '{e,p}', false, 'rechizite', 'special', 'verde');
INSERT INTO public.produse (id, nume, descriere, imagine, pret, timp_garantie, data_oferta, modalitati_folosire, reducere, categ_mare, categ_mica, culoare) OVERRIDING SYSTEM VALUE VALUES (39, 'Notite', NULL, '/Resurse/Imagini/Pag2/notes.png', 15, 0, '2020-09-15', '{e,s,a}', false, 'birotica', 'special', 'verde');
INSERT INTO public.produse (id, nume, descriere, imagine, pret, timp_garantie, data_oferta, modalitati_folosire, reducere, categ_mare, categ_mica, culoare) OVERRIDING SYSTEM VALUE VALUES (40, 'Capsator', NULL, '/Resurse/Imagini/Pag2/capsator.png', 35, 25, '2021-10-25', '{e,s,a}', true, 'birotica', 'comun', 'rosu');
INSERT INTO public.produse (id, nume, descriere, imagine, pret, timp_garantie, data_oferta, modalitati_folosire, reducere, categ_mare, categ_mica, culoare) OVERRIDING SYSTEM VALUE VALUES (41, 'Scotch', NULL, '/Resurse/Imagini/Pag2/scotch.png', 10, 0, '2020-10-25', '{e,s,a}', true, 'birotica', 'special', 'verde');
INSERT INTO public.produse (id, nume, descriere, imagine, pret, timp_garantie, data_oferta, modalitati_folosire, reducere, categ_mare, categ_mica, culoare) OVERRIDING SYSTEM VALUE VALUES (27, 'Hartie creponata', 'Floricelele vesele pot fi facute acum din hartie creponata', '/Resurse/Imagini/Pag2/creponata.png', 18, 0, '2020-05-25', '{e,p,j}', false, 'papetarie', 'sarbatoare', 'rosu');
INSERT INTO public.produse (id, nume, descriere, imagine, pret, timp_garantie, data_oferta, modalitati_folosire, reducere, categ_mare, categ_mica, culoare) OVERRIDING SYSTEM VALUE VALUES (32, 'Notepad', 'Notitele tale sunt acum in siguranta', '/Resurse/Imagini/Pag2/notepad.png', 12, 0, '2020-05-15', '{e,s,a}', false, 'papetarie', 'comun', 'alb');
INSERT INTO public.produse (id, nume, descriere, imagine, pret, timp_garantie, data_oferta, modalitati_folosire, reducere, categ_mare, categ_mica, culoare) OVERRIDING SYSTEM VALUE VALUES (35, 'Creioane colorate', 'Coloreaza mai usor cu noile modele de creioane colorate', '/Resurse/Imagini/Pag2/creioane_colorate.png', 60, 0, '2021-12-24', '{j,p,e}', true, 'arte plastice', 'special', 'multicolor');
INSERT INTO public.produse (id, nume, descriere, imagine, pret, timp_garantie, data_oferta, modalitati_folosire, reducere, categ_mare, categ_mica, culoare) OVERRIDING SYSTEM VALUE VALUES (37, 'Pin', 'Fixarea pozelor nu a fost niciodata mai simpla!', '/Resurse/Imagini/Pag2/pin.png', 10, 0, '2020-10-16', '{a,e}', false, 'birotica', 'comun', 'rosu');
INSERT INTO public.produse (id, nume, descriere, imagine, pret, timp_garantie, data_oferta, modalitati_folosire, reducere, categ_mare, categ_mica, culoare) OVERRIDING SYSTEM VALUE VALUES (38, 'Agrafa', 'Toate lucrurile vor fi puse impreuna cu noile agrafe de birou', '/Resurse/Imagini/Pag2/agrafa.png', 10, 0, '2021-10-15', '{a,s}', true, 'birotica', 'comun', 'verde');
INSERT INTO public.produse (id, nume, descriere, imagine, pret, timp_garantie, data_oferta, modalitati_folosire, reducere, categ_mare, categ_mica, culoare) OVERRIDING SYSTEM VALUE VALUES (8, 'Foarfeca', 'Decuparea va fi mult mai distractiva.', '/Resurse/Imagini/Pag2/foarfeca.png', 15, 10, '2020-01-15', '{d,a,e}', false, 'arte plastice', 'comun', 'mov');
INSERT INTO public.produse (id, nume, descriere, imagine, pret, timp_garantie, data_oferta, modalitati_folosire, reducere, categ_mare, categ_mica, culoare) OVERRIDING SYSTEM VALUE VALUES (20, 'Carioca', 'Coloreaza vesel', '/Resurse/Imagini/Pag2/carioca.png', 2, 0, '2022-05-15', '{e,j,t}', true, 'rechizite', 'scoala', 'verde');
INSERT INTO public.produse (id, nume, descriere, imagine, pret, timp_garantie, data_oferta, modalitati_folosire, reducere, categ_mare, categ_mica, culoare) OVERRIDING SYSTEM VALUE VALUES (1, 'Carte aventura', 'Cartile de aventura deschid taramul visurilor pentru orice cititor.', '/Resurse/Imagini/Pag2/carti_aventura.png', 100, 15, '2021-02-15', '{e,a}', true, 'articole scoala', 'comun', 'multicolor');
INSERT INTO public.produse (id, nume, descriere, imagine, pret, timp_garantie, data_oferta, modalitati_folosire, reducere, categ_mare, categ_mica, culoare) OVERRIDING SYSTEM VALUE VALUES (21, 'Compas', 'Cercuri perfecte', '/Resurse/Imagini/Pag2/compas.png', 25, 14, '2022-12-02', '{e,s,l}', false, 'rechizite', 'comun', 'galben');
INSERT INTO public.produse (id, nume, descriere, imagine, pret, timp_garantie, data_oferta, modalitati_folosire, reducere, categ_mare, categ_mica, culoare) OVERRIDING SYSTEM VALUE VALUES (3, 'Carte colorat', 'Prima interactiune cu cartile mereu va fi o carte de colorat, asa ca sa o facem speciala.', '/Resurse/Imagini/Pag2/carte_colorat.png', 50, 2, '2022-03-14', '{p}', false, 'articole scoala', 'scoala', 'multicolor');
INSERT INTO public.produse (id, nume, descriere, imagine, pret, timp_garantie, data_oferta, modalitati_folosire, reducere, categ_mare, categ_mica, culoare) OVERRIDING SYSTEM VALUE VALUES (28, 'Etichete', 'Cadoul dragut vine impreuna cu un decor pe cinste.', '/Resurse/Imagini/Pag2/etichete.png', 5, 0, '2021-06-20', '{d,e}', true, 'papetarie', 'sarbatoare', 'galben');
INSERT INTO public.produse (id, nume, descriere, imagine, pret, timp_garantie, data_oferta, modalitati_folosire, reducere, categ_mare, categ_mica, culoare) OVERRIDING SYSTEM VALUE VALUES (29, 'Etichete decorative', 'Impodobirea este unul dintre cele mai frumoase parti', '/Resurse/Imagini/Pag2/etichete2.png', 10, 0, '2020-05-25', '{d,e}', false, 'papetarie', 'petrecere', 'alb');
INSERT INTO public.produse (id, nume, descriere, imagine, pret, timp_garantie, data_oferta, modalitati_folosire, reducere, categ_mare, categ_mica, culoare) OVERRIDING SYSTEM VALUE VALUES (30, 'Cutie cadou', 'Cutie pentru depozitare sau pentru a impacheta cadourl. ', '/Resurse/Imagini/Pag2/cutie.png', 15, 0, '2021-02-15', '{a,e}', true, 'papetarie', 'sarbatoare', 'verde');
INSERT INTO public.produse (id, nume, descriere, imagine, pret, timp_garantie, data_oferta, modalitati_folosire, reducere, categ_mare, categ_mica, culoare) OVERRIDING SYSTEM VALUE VALUES (42, 'Plic', NULL, '/Resurse/Imagini/Pag2/plic.png', 1, 0, '2022-12-03', '{e,s,a}', false, 'birotica', 'sarbatoare', 'alb');
INSERT INTO public.produse (id, nume, descriere, imagine, pret, timp_garantie, data_oferta, modalitati_folosire, reducere, categ_mare, categ_mica, culoare) OVERRIDING SYSTEM VALUE VALUES (31, 'Funda', 'Fundite pentru a decora un cadou.', '/Resurse/Imagini/Pag2/panglica.png', 20, 0, '2022-05-24', '{e,d,a}', false, 'papetarie', 'special', 'mov');
INSERT INTO public.produse (id, nume, descriere, imagine, pret, timp_garantie, data_oferta, modalitati_folosire, reducere, categ_mare, categ_mica, culoare) OVERRIDING SYSTEM VALUE VALUES (36, 'Semn carte', 'Retine unde ai ramas cu cititul', '/Resurse/Imagini/Pag2/semn_carte.png', 7, 25, '2020-09-20', '{e,p,a}', true, 'papetarie', 'scoala', 'alb');


--
-- TOC entry 3321 (class 0 OID 0)
-- Dependencies: 212
-- Name: produse_id_seq; Type: SEQUENCE SET; Schema: public; Owner: raluca
--

SELECT pg_catalog.setval('public.produse_id_seq', 42, true);


--
-- TOC entry 3174 (class 2606 OID 16409)
-- Name: produse produse_pkey; Type: CONSTRAINT; Schema: public; Owner: raluca
--

ALTER TABLE ONLY public.produse
    ADD CONSTRAINT produse_pkey PRIMARY KEY (id);


-- Completed on 2021-12-06 14:08:38

--
-- PostgreSQL database dump complete
--

