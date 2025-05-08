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

CREATE DATABASE xdsbus WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE = 'en_US.UTF-8';

ALTER DATABASE xdsbus OWNER TO xbus;

\connect xdsbus

CREATE TABLE public."User" (
    userlogin character varying(80) NOT NULL,
    username character varying(80) NOT NULL,
    userpassworddigest character varying(200),
    useremail character varying(100),
    usercambiarpassword boolean
);

ALTER TABLE public."User" OWNER TO xbus;

CREATE SEQUENCE public.entityid
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;

ALTER TABLE public.entityid OWNER TO xbus;

CREATE TABLE public.entity (
    entityid smallint DEFAULT nextval('public.entityid'::regclass) NOT NULL,
    entityname smallint NOT NULL,
    transactionid smallint NOT NULL,
    validateentity boolean NOT NULL
);

ALTER TABLE public.entity OWNER TO xbus;

CREATE TABLE public.parameter (
    parametertypeid smallint NOT NULL,
    parametercod character(6) NOT NULL,
    parametervalue character varying(500) NOT NULL,
    parameterdesc character varying(40) NOT NULL
);


ALTER TABLE public.parameter OWNER TO xbus;

CREATE SEQUENCE public.parametertypeid
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;

ALTER TABLE public.parametertypeid OWNER TO xbus;

CREATE TABLE public.parametertype (
    parametertypeid smallint DEFAULT nextval('public.parametertypeid'::regclass) NOT NULL,
    parametertypedesc character varying(40) NOT NULL,
    parametertypecod character(6) NOT NULL
);

ALTER TABLE public.parametertype OWNER TO xbus;

CREATE TABLE public.process (
    processid smallint NOT NULL,
    processcode character(6) NOT NULL,
    processdescription character(120) NOT NULL,
    processmaxattempts smallint NOT NULL,
    processtypeid smallint NOT NULL
);

ALTER TABLE public.process OWNER TO xbus;

CREATE SEQUENCE public.processtypeid
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;

ALTER TABLE public.processtypeid OWNER TO xbus;

CREATE TABLE public.processtype (
    processtypeid smallint DEFAULT nextval('public.processtypeid'::regclass) NOT NULL,
    processtypecode character(6) NOT NULL,
    processtypedescription character(200) NOT NULL
);

ALTER TABLE public.processtype OWNER TO xbus;

CREATE SEQUENCE public.qmessageid
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;

ALTER TABLE public.qmessageid OWNER TO xbus;

CREATE TABLE public.qmessage (
    qmessageid bigint DEFAULT nextval('public.qmessageid'::regclass) NOT NULL,
    qmessageprocessid smallint NOT NULL,
    qmessagerequest text NOT NULL,
    qmessageresponse text NOT NULL,
    qmessagecreationdate timestamp without time zone NOT NULL,
    qmessagemodificationdate timestamp without time zone NOT NULL,
    qmessagestate smallint NOT NULL,
    qmessageresendqty bigint,
    qmessagedocumentid bigint,
    qmessagepassword character(9999),
    qmessageuser character(255)
);

ALTER TABLE public.qmessage OWNER TO xbus;

CREATE SEQUENCE public.qmessagedocumentid
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;

ALTER TABLE public.qmessagedocumentid OWNER TO xbus;

CREATE TABLE public.qmessagedocument (
    qmessagedocumentid bigint DEFAULT nextval('public.qmessagedocumentid'::regclass) NOT NULL,
    documentuniqueid character(9999),
    qmessagedocumentblob bytea NOT NULL
);

ALTER TABLE public.qmessagedocument OWNER TO xbus;

CREATE TABLE RepositoryData (
  RepositoryDataOID          CHAR(100)    NOT NULL,
  RepositoryDataURL          VARCHAR(1000)    NOT NULL,
  RepositoryDataWsdl         VARCHAR(250)    NOT NULL,
  RepositoryDataAvailable    BOOLEAN    NOT NULL,
  RepositoryDataVersion      CHAR(6)    NOT NULL,
  RepositoryDataSendToHCEN   BOOLEAN    NOT NULL,
  RepositoryDataHost         VARCHAR(100),
  RepositoryDataPort         INTEGER,
  RepositoryDataBaseUrl      VARCHAR(100),
  RepositoryDataResourceName VARCHAR(100),
  RepositoryDataSecure       SMALLINT
--     PRIMARY KEY ( RepositoryDataOID )
);
	 
ALTER TABLE public.repositorydata OWNER TO xbus;

CREATE TABLE public.serviceauth (
    serviceauthcod character(128) NOT NULL,
    servicewsauthtype character(6) NOT NULL,
    serviceauthusername character(255),
    serviceauthuserpassword character(255),
    serviceauthcn character(255),
    serviceauthnonrepudiation boolean,
    serviceauthsignature boolean
);

ALTER TABLE public.serviceauth OWNER TO xbus;

CREATE SEQUENCE public.stateid
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;

ALTER TABLE public.stateid OWNER TO xbus;

CREATE TABLE public.state (
    stateid smallint DEFAULT nextval('public.stateid'::regclass) NOT NULL,
    statecode character(6) NOT NULL,
    statedescription character(120) NOT NULL
);

ALTER TABLE public.state OWNER TO xbus;

CREATE SEQUENCE public.transactionid
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;

ALTER TABLE public.transactionid OWNER TO xbus;

CREATE TABLE public.transaction (
    transactionid smallint DEFAULT nextval('public.transactionid'::regclass) NOT NULL,
    transactionname character varying(200) NOT NULL
);

ALTER TABLE public.transaction OWNER TO xbus;

ALTER TABLE ONLY public."User"
    ADD CONSTRAINT "User_pkey" PRIMARY KEY (userlogin);

ALTER TABLE ONLY public.entity
    ADD CONSTRAINT entity_pkey PRIMARY KEY (entityid);

ALTER TABLE ONLY public.parameter
    ADD CONSTRAINT parameter_pkey PRIMARY KEY (parametertypeid, parametercod);

ALTER TABLE ONLY public.parametertype
    ADD CONSTRAINT parametertype_pkey PRIMARY KEY (parametertypeid);

ALTER TABLE ONLY public.process
    ADD CONSTRAINT process_pkey PRIMARY KEY (processid);

ALTER TABLE ONLY public.processtype
    ADD CONSTRAINT processtype_pkey PRIMARY KEY (processtypeid);

ALTER TABLE ONLY public.qmessage
    ADD CONSTRAINT qmessage_pkey PRIMARY KEY (qmessageid);

ALTER TABLE ONLY public.qmessagedocument
    ADD CONSTRAINT qmessagedocument_pkey PRIMARY KEY (qmessagedocumentid);

ALTER TABLE ONLY public.repositorydata
    ADD CONSTRAINT repositorydata_pkey PRIMARY KEY (repositorydataoid);

ALTER TABLE ONLY public.serviceauth
    ADD CONSTRAINT serviceauth_pkey PRIMARY KEY (serviceauthcod, servicewsauthtype);

ALTER TABLE ONLY public.state
    ADD CONSTRAINT state_pkey PRIMARY KEY (stateid);

ALTER TABLE ONLY public.transaction
    ADD CONSTRAINT transaction_pkey PRIMARY KEY (transactionid);

CREATE INDEX ientity1 ON public.entity USING btree (transactionid);

CREATE INDEX iprocess1 ON public.process USING btree (processtypeid);

CREATE INDEX iqmessage1 ON public.qmessage USING btree (qmessagedocumentid);

CREATE INDEX uentity ON public.entity USING btree (entityname);

ALTER TABLE ONLY public.entity
    ADD CONSTRAINT ientity1 FOREIGN KEY (transactionid) REFERENCES public.transaction(transactionid);

ALTER TABLE ONLY public.parameter
    ADD CONSTRAINT iparameter1 FOREIGN KEY (parametertypeid) REFERENCES public.parametertype(parametertypeid);

ALTER TABLE ONLY public.process
    ADD CONSTRAINT iprocess1 FOREIGN KEY (processtypeid) REFERENCES public.processtype(processtypeid);

ALTER TABLE ONLY public.qmessage
    ADD CONSTRAINT iqmessage1 FOREIGN KEY (qmessagedocumentid) REFERENCES public.qmessagedocument(qmessagedocumentid);
