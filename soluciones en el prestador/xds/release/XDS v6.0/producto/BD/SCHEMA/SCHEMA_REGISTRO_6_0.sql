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

CREATE DATABASE registro WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE = 'en_US.UTF-8';

ALTER DATABASE registro OWNER TO regxds;

\connect registro

CREATE SEQUENCE public.authorid
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;

ALTER TABLE public.authorid OWNER TO regxds;

SET default_tablespace = '';

CREATE TABLE public.author (
    authorid bigint DEFAULT nextval('public.authorid'::regclass) NOT NULL,
    authorpersonid character varying(100) NOT NULL,
    authorpersonlastname character varying(194),
    authorpersonfirstname character varying(30),
    authorpersonsecfuthergivenname character varying(30),
    authorpersonsuffix character varying(70),
    authorpersonprefix character varying(70),
    authorlocation character varying(200)
);

ALTER TABLE public.author OWNER TO regxds;

CREATE SEQUENCE public.axisid
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;

ALTER TABLE public.axisid OWNER TO regxds;

CREATE TABLE public.axis (
    axisid bigint DEFAULT nextval('public.axisid'::regclass) NOT NULL,
    axisuuid character varying(46) NOT NULL,
    axisname character varying(200) NOT NULL,
    axiscode character varying(200) NOT NULL,
    axiscodingscheme character varying(120) NOT NULL,
    axisdisplayname character varying(200) NOT NULL
);

ALTER TABLE public.axis OWNER TO regxds;

CREATE SEQUENCE public.byorderofid
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;

ALTER TABLE public.byorderofid OWNER TO regxds;

CREATE TABLE public.byorderof (
    byorderofid bigint DEFAULT nextval('public.byorderofid'::regclass) NOT NULL,
    byorderofoid character varying(120) NOT NULL,
    byorderofname character varying(200) DEFAULT NULL::character varying NOT NULL
);

ALTER TABLE public.byorderof OWNER TO regxds;

CREATE TABLE public.documententry (
    docentryentryuuid character varying(120) NOT NULL,
    docentryavailabilitystatus character varying(100),
    docentryclasscodevalue character varying(200),
    docentryclasscodedisplayname character varying(200),
    docentryclasscodecodingscheme character varying(120),
    docentrycomments character varying(200),
    docentryconfidentialitycodeval character varying(200),
    docentryconfidentialitycodedis character varying(200),
    docentryconfidentialitycodecod character varying(120),
    docentrycreationtime timestamp without time zone,
    docentryformatcodevalue character varying(200),
    docentryformatcodedisplayname character varying(200),
    docentryformatcodecodingscheme character varying(120),
    docentryhash character(40),
    docentryhealthfacilityvalue character varying(200),
    docentryhealthfacilitydisplay character varying(200),
    docentryhealthfacilitycodingsc character varying(120),
    docentryhomecommunityid character varying(100),
    docentrylanguagecode character varying(20),
    docentrylaid character varying(15),
    docentrylalastname character varying(194),
    docentrylafirstname character varying(30),
    docentrylasecfuthergivenname character varying(30),
    docentrylasuffix character varying(20),
    docentrylaprefix character varying(20),
    docentrymimetype character varying(200),
    docentrypatientid character varying(200),
    docentrypracticesettingcodeval character varying(200),
    docentrypracticesettingcodedis character varying(200),
    docentrypracticesettingcodecod character varying(120),
    docentryrepositoryuniqueid character varying(120),
    docentryservicestarttime timestamp without time zone,
    docentryservicestoptime timestamp without time zone,
    docentrysize character varying(10),
    docentrysourcepatientid character varying(100),
    docentrysourcepatientinfopid3 character varying(100),
    docentrysourcepatientinfopid5 character varying(100),
    docentrysourcepatientinfopid7 character varying(100),
    docentrysourcepatientinfopid8 character varying(100),
    docentrysourcepatientinfopid11 character varying(100),
    docentrytitle character varying(200),
    docentrytypecodevalue character varying(200),
    docentrytypecodedisplayname character varying(200),
    docentrytypecodecodingscheme character varying(120),
    docentryuniqueid character varying(120),
    docentryuri character varying(100),
    docentryenmienda character(1),
    docentryorganizationid integer NOT NULL,
    docentryinternalcreationtime timestamp without time zone,
    byorderofid bigint,
    funderid bigint
);

ALTER TABLE public.documententry OWNER TO regxds;

CREATE TABLE public.documententryauthor (
    docentryentryuuid character varying(120) NOT NULL,
    authorid bigint NOT NULL
);

ALTER TABLE public.documententryauthor OWNER TO regxds;

CREATE TABLE public.documententryauthorinstitution (
    docentryentryuuid character varying(120) NOT NULL,
    authorid bigint NOT NULL,
    docauthorinstitutionname character varying(200) NOT NULL,
    docauthorinstitutionid character varying(200)
);

ALTER TABLE public.documententryauthorinstitution OWNER TO regxds;

CREATE TABLE public.documententryauthorrole (
    docentryentryuuid character varying(120) NOT NULL,
    authorid bigint NOT NULL,
    docauthorrole character varying(200) NOT NULL
);

ALTER TABLE public.documententryauthorrole OWNER TO regxds;

CREATE TABLE public.documententryaxis (
    docentryentryuuid character varying(120) NOT NULL,
    axisid bigint NOT NULL,
    axisamount character varying(200)
);

ALTER TABLE public.documententryaxis OWNER TO regxds;

CREATE TABLE public.documententryeventcode (
    documententryeventcodeid bigint NOT NULL,
    docentryentryuuid character varying(120) NOT NULL,
    docentryeventcodevalue character varying(200),
    docentryeventcodedisplayname character varying(200),
    docentryeventcodecodingscheme character varying(120)
);

ALTER TABLE public.documententryeventcode OWNER TO regxds;

CREATE TABLE public.documententrymotivos (
    docentryentryuuid character varying(120) NOT NULL,
    motivoid character(20) NOT NULL
);

ALTER TABLE public.documententrymotivos OWNER TO regxds;

CREATE TABLE public.folder (
    folderentryuuid character varying(120) NOT NULL,
    folderavailabilitystatus character varying(100),
    foldercomments character varying(200),
    folderhomecommunityid character varying(100),
    folderlastupdatetime timestamp without time zone,
    folderlimitedmetadata character varying(100),
    foldertitle character varying(200),
    folderuniqueid character varying(120),
    folderpatientid character varying(200)
);

ALTER TABLE public.folder OWNER TO regxds;

CREATE TABLE public.foldereventcode (
    foldereventcodeeventcodeid smallint NOT NULL,
    folderentryuuid character varying(120) NOT NULL,
    foldereventcodevalue character varying(200),
    foldereventcodedisplayname character varying(200),
    foldereventcodecodingscheme character varying(120)
);

ALTER TABLE public.foldereventcode OWNER TO regxds;

CREATE SEQUENCE public.funderid
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;

ALTER TABLE public.funderid OWNER TO regxds;

CREATE TABLE public.funder (
    funderid bigint DEFAULT nextval('public.funderid'::regclass) NOT NULL,
    funderoid character varying(120) NOT NULL,
    fundername character varying(200) DEFAULT NULL::character varying NOT NULL
);

ALTER TABLE public.funder OWNER TO regxds;

CREATE SEQUENCE public.institutionid
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;

ALTER TABLE public.institutionid OWNER TO regxds;

CREATE TABLE public.institutionlogicalurl (
    institutionid bigint DEFAULT nextval('public.institutionid'::regclass) NOT NULL,
    institutionname character varying(200) NOT NULL,
    institutionlogicalurl character varying(1000) NOT NULL
);

ALTER TABLE public.institutionlogicalurl OWNER TO regxds;

CREATE TABLE public.institutionlogicalurlinstituti (
    institutionid bigint NOT NULL,
    institutionoid character varying(120) NOT NULL
);

ALTER TABLE public.institutionlogicalurlinstituti OWNER TO regxds;

CREATE SEQUENCE public.notificationid
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;

ALTER TABLE public.notificationid OWNER TO regxds;

CREATE TABLE public.notification (
    notificationid bigint DEFAULT nextval('public.notificationid'::regclass) NOT NULL,
    notificationdocentryuid character varying(120),
    notificationinstitute character varying(200),
    notificationdate timestamp without time zone NOT NULL,
    notificationstatus smallint NOT NULL,
    notificationnotitypeid bigint,
    notificationerrordsc character varying(200)
);

ALTER TABLE public.notification OWNER TO regxds;

CREATE SEQUENCE public.notificationtypeid
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;

ALTER TABLE public.notificationtypeid OWNER TO regxds;

CREATE TABLE public.notificationtype (
    notificationtypeid bigint DEFAULT nextval('public.notificationtypeid'::regclass) NOT NULL,
    notificationtypedsc character varying(200) NOT NULL
);

ALTER TABLE public.notificationtype OWNER TO regxds;

CREATE TABLE public.objectintance (
    studyinstanceuid character varying(120) NOT NULL,
    seriesinstanceuid character varying(120) NOT NULL,
    objectintanceuid character varying(120) NOT NULL,
    objectintancedocentryuid character varying(120)
);

ALTER TABLE public.objectintance OWNER TO regxds;

CREATE TABLE public.organization (
    organizationid integer NOT NULL,
    organizationdesc character(40) NOT NULL,
    organizationenable smallint NOT NULL
);

ALTER TABLE public.organization OWNER TO regxds;

CREATE TABLE public.parameter (
    parametertypeid smallint NOT NULL,
    parametercod character(6) NOT NULL,
    parametervalue character varying(500) NOT NULL,
    parameterdesc character varying(40) NOT NULL
);

ALTER TABLE public.parameter OWNER TO regxds;

CREATE SEQUENCE public.parametertypeid
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;

ALTER TABLE public.parametertypeid OWNER TO regxds;

CREATE TABLE public.parametertype (
    parametertypeid smallint DEFAULT nextval('public.parametertypeid'::regclass) NOT NULL,
    parametertypedesc character varying(40) NOT NULL,
    parametertypecod character(6) NOT NULL
);

ALTER TABLE public.parametertype OWNER TO regxds;

CREATE TABLE public.patient (
    patientid character varying(200) NOT NULL
);

ALTER TABLE public.patient OWNER TO regxds;

CREATE TABLE public.pixmerge (
    docentryentryuuid character varying(120) NOT NULL,
    pixmergedate timestamp without time zone NOT NULL,
    docentrypatientidnew character varying(200) NOT NULL,
    docentrypatientidold character varying(200) NOT NULL
);

ALTER TABLE public.pixmerge OWNER TO regxds;

CREATE TABLE public.referenceidlist (
    docentryentryuuid character varying(120) NOT NULL,
    referenceidlistid character varying(120) NOT NULL,
    referenceidlisttype character varying(200) NOT NULL
);

ALTER TABLE public.referenceidlist OWNER TO regxds;

CREATE TABLE public.seriesinstance (
    studyinstanceuid character varying(120) NOT NULL,
    seriesinstanceuid character varying(120) NOT NULL,
    seriesinstancedocentryuid character varying(120)
);

ALTER TABLE public.seriesinstance OWNER TO regxds;

CREATE TABLE public.studyinstance (
    studyinstanceuid character varying(120) NOT NULL,
    docentryentryuuid character varying(120) NOT NULL
);

ALTER TABLE public.studyinstance OWNER TO regxds;

CREATE TABLE public.submissionset (
    submissionsetentryuuid character varying(120) NOT NULL,
    submissionsetavailabilitystatu character varying(100),
    submissionsetcomments character varying(200),
    submissionsetcontenttypecodeva character varying(200),
    submissionsetcontenttypecodedi character varying(200),
    submissionsetcontenttypecodeco character varying(120) NOT NULL,
    submissionsethomecommunityid character varying(200),
    submissionsetsourceid character varying(120),
    submissionsetsubmissiontime timestamp without time zone,
    subsetpatientid character varying(200),
    submissionsettitle character varying(200),
    submissionsetuniqueid character varying(120)
);

ALTER TABLE public.submissionset OWNER TO regxds;

CREATE TABLE public.submissionsetauthor (
    submissionsetentryuuid character varying(120) NOT NULL,
    authorid bigint NOT NULL
);

ALTER TABLE public.submissionsetauthor OWNER TO regxds;

CREATE TABLE public.submissionsetauthorinstitution (
    submissionsetentryuuid character varying(120) NOT NULL,
    authorid bigint NOT NULL,
    subsetauthorinstitutionname character varying(200) NOT NULL,
    subsetauthorinstitutionid character varying(200)
);

ALTER TABLE public.submissionsetauthorinstitution OWNER TO regxds;

CREATE TABLE public.submissionsetauthorrole (
    submissionsetentryuuid character varying(120) NOT NULL,
    authorid bigint NOT NULL,
    subsetauthorrole character varying(200) NOT NULL
);

ALTER TABLE public.submissionsetauthorrole OWNER TO regxds;

CREATE SEQUENCE public.submissionsetdocumentfolderid
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;

ALTER TABLE public.submissionsetdocumentfolderid OWNER TO regxds;

CREATE TABLE public.submissionsetdocumentfolder (
    submissionsetdocumentfolderid bigint DEFAULT nextval('public.submissionsetdocumentfolderid'::regclass) NOT NULL,
    documententryuuidoriginal character varying(120),
    docentryentryuuid character varying(120),
    folderentryuuid character varying(120),
    submissionsetentryuuid character varying(120),
    status character varying(100),
    associationtype character varying(100) NOT NULL,
    sourceobject character varying(120) NOT NULL,
    targetobject character varying(120) NOT NULL
);

ALTER TABLE public.submissionsetdocumentfolder OWNER TO regxds;

ALTER TABLE ONLY public.author
    ADD CONSTRAINT author_pkey PRIMARY KEY (authorid);

ALTER TABLE ONLY public.axis
    ADD CONSTRAINT axis_pkey PRIMARY KEY (axisid);

ALTER TABLE ONLY public.byorderof
    ADD CONSTRAINT byorderof_pkey PRIMARY KEY (byorderofid);

ALTER TABLE ONLY public.documententry
    ADD CONSTRAINT documententry_pkey PRIMARY KEY (docentryentryuuid);

ALTER TABLE ONLY public.documententryauthor
    ADD CONSTRAINT documententryauthor_pkey PRIMARY KEY (docentryentryuuid, authorid);

ALTER TABLE ONLY public.documententryauthorinstitution
    ADD CONSTRAINT documententryauthorinstitution_pkey PRIMARY KEY (docentryentryuuid, authorid, docauthorinstitutionname);

ALTER TABLE ONLY public.documententryauthorrole
    ADD CONSTRAINT documententryauthorrole_pkey PRIMARY KEY (docentryentryuuid, authorid, docauthorrole);

ALTER TABLE ONLY public.documententryaxis
    ADD CONSTRAINT documententryaxis_pkey PRIMARY KEY (docentryentryuuid, axisid);

ALTER TABLE ONLY public.documententryeventcode
    ADD CONSTRAINT documententryeventcode_pkey PRIMARY KEY (documententryeventcodeid, docentryentryuuid);

ALTER TABLE ONLY public.documententrymotivos
    ADD CONSTRAINT documententrymotivos_pkey PRIMARY KEY (docentryentryuuid, motivoid);

ALTER TABLE ONLY public.folder
    ADD CONSTRAINT folder_pkey PRIMARY KEY (folderentryuuid);

ALTER TABLE ONLY public.foldereventcode
    ADD CONSTRAINT foldereventcode_pkey PRIMARY KEY (foldereventcodeeventcodeid, folderentryuuid);

ALTER TABLE ONLY public.funder
    ADD CONSTRAINT funder_pkey PRIMARY KEY (funderid);

ALTER TABLE ONLY public.institutionlogicalurl
    ADD CONSTRAINT institutionlogicalurl_pkey PRIMARY KEY (institutionid);

ALTER TABLE ONLY public.institutionlogicalurlinstituti
    ADD CONSTRAINT institutionlogicalurlinstituti_pkey PRIMARY KEY (institutionid, institutionoid);

ALTER TABLE ONLY public.notification
    ADD CONSTRAINT notification_pkey PRIMARY KEY (notificationid);

ALTER TABLE ONLY public.notificationtype
    ADD CONSTRAINT notificationtype_pkey PRIMARY KEY (notificationtypeid);

ALTER TABLE ONLY public.objectintance
    ADD CONSTRAINT objectintance_pkey PRIMARY KEY (studyinstanceuid, seriesinstanceuid, objectintanceuid);

ALTER TABLE ONLY public.organization
    ADD CONSTRAINT organization_pkey PRIMARY KEY (organizationid);

ALTER TABLE ONLY public.parameter
    ADD CONSTRAINT parameter_pkey PRIMARY KEY (parametertypeid, parametercod);

ALTER TABLE ONLY public.parametertype
    ADD CONSTRAINT parametertype_pkey PRIMARY KEY (parametertypeid);

ALTER TABLE ONLY public.patient
    ADD CONSTRAINT patient_pkey PRIMARY KEY (patientid);

ALTER TABLE ONLY public.referenceidlist
    ADD CONSTRAINT referenceidlist_pkey PRIMARY KEY (docentryentryuuid, referenceidlistid);

ALTER TABLE ONLY public.seriesinstance
    ADD CONSTRAINT seriesinstance_pkey PRIMARY KEY (studyinstanceuid, seriesinstanceuid);

ALTER TABLE ONLY public.studyinstance
    ADD CONSTRAINT studyinstance_pkey PRIMARY KEY (studyinstanceuid);

ALTER TABLE ONLY public.submissionset
    ADD CONSTRAINT submissionset_pkey PRIMARY KEY (submissionsetentryuuid);

ALTER TABLE ONLY public.submissionsetauthor
    ADD CONSTRAINT submissionsetauthor_pkey PRIMARY KEY (submissionsetentryuuid, authorid);

ALTER TABLE ONLY public.submissionsetauthorinstitution
    ADD CONSTRAINT submissionsetauthorinstitution_pkey PRIMARY KEY (submissionsetentryuuid, authorid, subsetauthorinstitutionname);

ALTER TABLE ONLY public.submissionsetauthorrole
    ADD CONSTRAINT submissionsetauthorrole_pkey PRIMARY KEY (submissionsetentryuuid, authorid, subsetauthorrole);

ALTER TABLE ONLY public.submissionsetdocumentfolder
    ADD CONSTRAINT submissionsetdocumentfolder_pkey PRIMARY KEY (submissionsetdocumentfolderid);

CREATE INDEX find ON public.documententry USING btree (docentryavailabilitystatus, docentrypatientid, docentryservicestarttime DESC);

CREATE INDEX idocumententry1 ON public.documententry USING btree (docentrypatientid);

CREATE INDEX idocumententry2 ON public.documententry USING btree (docentryorganizationid);

CREATE INDEX idocumententry3 ON public.documententry USING btree (funderid);

CREATE INDEX idocumententry4 ON public.documententry USING btree (byorderofid);

CREATE INDEX idocumententryauthor1 ON public.documententryauthor USING btree (authorid);

CREATE INDEX idocumententryaxis1 ON public.documententryaxis USING btree (axisid);

CREATE INDEX idocumententryeventcode1 ON public.documententryeventcode USING btree (docentryentryuuid);

CREATE INDEX ifolder1 ON public.folder USING btree (folderpatientid);

CREATE INDEX ifoldereventcode1 ON public.foldereventcode USING btree (folderentryuuid);

CREATE INDEX inotification1 ON public.notification USING btree (notificationdocentryuid);

CREATE INDEX inotification2 ON public.notification USING btree (notificationnotitypeid);

CREATE INDEX istudyinstance1 ON public.studyinstance USING btree (docentryentryuuid);

CREATE INDEX isubmissionset1 ON public.submissionset USING btree (subsetpatientid);

CREATE INDEX isubmissionset2 ON public.submissionset USING btree (submissionsetuniqueid, submissionsetentryuuid);

CREATE INDEX isubmissionsetauthor1 ON public.submissionsetauthor USING btree (authorid);

CREATE INDEX isubmissionsetdocumentfolder1 ON public.submissionsetdocumentfolder USING btree (submissionsetentryuuid);

CREATE INDEX isubmissionsetdocumentfolder2 ON public.submissionsetdocumentfolder USING btree (folderentryuuid);

CREATE INDEX isubmissionsetdocumentfolder3 ON public.submissionsetdocumentfolder USING btree (docentryentryuuid);

CREATE INDEX isubmissionsetdocumentfolder4 ON public.submissionsetdocumentfolder USING btree (documententryuuidoriginal);

CREATE UNIQUE INDEX udocumententry ON public.documententry USING btree (docentryuniqueid);

CREATE INDEX uobjectintance1 ON public.objectintance USING btree (objectintancedocentryuid);

CREATE INDEX useriesinstance1 ON public.seriesinstance USING btree (seriesinstancedocentryuid);

ALTER TABLE ONLY public.documententryaxis
    ADD CONSTRAINT idocumententryaxis1 FOREIGN KEY (axisid) REFERENCES public.axis(axisid);

ALTER TABLE ONLY public.documententryaxis
    ADD CONSTRAINT idocumententryaxis2 FOREIGN KEY (docentryentryuuid) REFERENCES public.documententry(docentryentryuuid);

ALTER TABLE ONLY public.institutionlogicalurlinstituti
    ADD CONSTRAINT iinstitutionlogicalurlinstitu1 FOREIGN KEY (institutionid) REFERENCES public.institutionlogicalurl(institutionid);

ALTER TABLE ONLY public.notification
    ADD CONSTRAINT inotification2 FOREIGN KEY (notificationnotitypeid) REFERENCES public.notificationtype(notificationtypeid);

ALTER TABLE ONLY public.parameter
    ADD CONSTRAINT iparameter1 FOREIGN KEY (parametertypeid) REFERENCES public.parametertype(parametertypeid);
