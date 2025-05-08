--
-- PostgreSQL database dump
--

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

CREATE DATABASE repositorio WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE = 'en_US.UTF-8';

ALTER DATABASE repositorio OWNER TO repxds;

\connect repositorio

CREATE SEQUENCE public.documentcontentid
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;

ALTER TABLE public.documentcontentid OWNER TO repxds;

SET default_tablespace = '';

CREATE TABLE public.documentcontent (
    documentcontentid bigint DEFAULT nextval('public.documentcontentid'::regclass) NOT NULL,
    documentcontentuuid character varying(120) NOT NULL,
    documentcontentdata bytea
);

ALTER TABLE public.documentcontent OWNER TO repxds;

CREATE SEQUENCE public.documentrepositorymetadataid
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;

ALTER TABLE public.documentrepositorymetadataid OWNER TO repxds;

CREATE TABLE public.documentrepositorymetadata (
    documentrepositorymetadataid bigint DEFAULT nextval('public.documentrepositorymetadataid'::regclass) NOT NULL,
    documententryuuid character varying(120) NOT NULL,
    documententryuri character varying(100),
    documententryhash character(40) NOT NULL,
    documententrysize character varying(10) NOT NULL,
    documententryminetype character varying(200),
    documententryname character varying(200),
    documentcontentid bigint NOT NULL,
    documententryuniqueid character varying(120) NOT NULL
);

ALTER TABLE public.documentrepositorymetadata OWNER TO repxds;

CREATE TABLE public.parametro (
    parametrocod character(10) NOT NULL,
    parametroval character(120) NOT NULL,
    parametrodesc character(30) NOT NULL
);

ALTER TABLE public.parametro OWNER TO repxds;

ALTER TABLE ONLY public.documentcontent
    ADD CONSTRAINT documentcontent_pkey PRIMARY KEY (documentcontentid);

ALTER TABLE ONLY public.documentrepositorymetadata
    ADD CONSTRAINT documentrepositorymetadata_pkey PRIMARY KEY (documentrepositorymetadataid);

ALTER TABLE ONLY public.parametro
    ADD CONSTRAINT parametro_pkey PRIMARY KEY (parametrocod);

CREATE INDEX idocumentrepositorymetadata1 ON public.documentrepositorymetadata USING btree (documentcontentid);

CREATE UNIQUE INDEX udocumentcontent ON public.documentcontent USING btree (documentcontentuuid);

CREATE INDEX udocumentrepositorymetadata ON public.documentrepositorymetadata USING btree (documententryuniqueid);

ALTER TABLE ONLY public.documentrepositorymetadata
    ADD CONSTRAINT idocumentrepositorymetadata1 FOREIGN KEY (documentcontentid) REFERENCES public.documentcontent(documentcontentid);
