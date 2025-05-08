--
-- PostgreSQL database dump
--

-- Dumped from database version 11.3
-- Dumped by pg_dump version 13.3

\connect registro

-- Valores parámetros

INSERT INTO parametertype VALUES (2, 'Parámetro para retornar la versión', 'VERS');

INSERT INTO parameter VALUES (2, 'VERS', '6.0', 'Versión del REGISTRO XDS');

INSERT INTO parametertype VALUES (1, 'Parámetro del sistema', 'SYS');

INSERT INTO parameter VALUES (1, 'LOG', '1', '1 = loguea, 0 no');

INSERT INTO organization(organizationid, organizationdesc, organizationenable)	VALUES (1, 'desc', 1);