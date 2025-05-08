-- Reorganización XDS Producto versión 6.0

-- Cambiar <PATH> , <SEC>, <HOST>, <PORT> y <HOST_APPLIANCE>

ALTER TABLE QMessage
DROP QMessageUser,
DROP QMessagePassword;


UPDATE QMessageDocument
SET    DocumentUniqueId = Substr(DocumentUniqueId,1,255);

ALTER TABLE QMessageDocument ALTER COLUMN DocumentUniqueId TYPE VARCHAR(255);

ALTER TABLE qmessagedocument ALTER COLUMN qmessagedocumentid TYPE BIGINT;

ALTER TABLE QMessage ALTER COLUMN qmessagedocumentid TYPE BIGINT;

ALTER TABLE QMessage DROP CONSTRAINT IQMESSAGE1;
ALTER TABLE QMessage ALTER COLUMN QMessageDocumentId DROP NOT NULL;
ALTER TABLE QMessage ADD CONSTRAINT IQMESSAGE1 FOREIGN KEY ( QMessageDocumentId ) REFERENCES QMessageDocument(QMessageDocumentId);
 
DROP TABLE ServiceAuth CASCADE;

UPDATE public.parametertype SET parametertypedesc = 'Parámetros generales del XDSBUS' WHERE parametertypeid = 1;
UPDATE public.parametertype SET parametertypedesc = 'Parámetros Registro Nacional (appliance)' WHERE parametertypeid = 2;
UPDATE public.parametertype SET parametertypedesc = 'Parámetros retrieve Appliance-DEPRECADO' WHERE parametertypeid = 3;
UPDATE public.parametertype SET parametertypedesc = 'Parámetros query Registro XDS local' WHERE parametertypeid = 4;
UPDATE public.parametertype SET parametertypedesc = 'Parámetros update Registro XDS local' WHERE parametertypeid = 6;
UPDATE public.parametertype SET parametertypedesc = 'Parámetros Modulo Gestion Mensajeria' WHERE parametertypeid = 7;
UPDATE public.parametertype SET parametertypedesc = 'Parámetros del Syslog' WHERE parametertypeid = 8;
UPDATE public.parametertype SET parametertypedesc = 'REGXDS' WHERE parametertypeid = 9;
UPDATE public.parametertype SET parametertypedesc = 'Parámetros para el validador de CDA' WHERE parametertypeid = 10;
UPDATE public.parametertype SET parametertypedesc = 'Parámetros update Registro Nacional' WHERE parametertypeid = 11;
UPDATE public.parametertype SET parametertypedesc = 'Parámetro para retornar la versión' WHERE parametertypeid = 12;

UPDATE public.parameter SET parametervalue = '6.0' WHERE parametertypeid = 13 AND parametercod = 'VERS';

ALTER TABLE RepositoryData
ADD RepositoryDataHost VARCHAR(100),
ADD RepositoryDataPort INTEGER,
ADD RepositoryDataBaseUrl VARCHAR(100),
ADD RepositoryDataResourceName VARCHAR(100),
ADD RepositoryDataSecure SMALLINT;


-- Parameter para usar location

-- RECNAC
UPDATE public.parameter SET parametervalue = 'https://<HOST_APPLIANCE>/AppliancePS/adocumentregistry_services?wsdl', parameterdesc = 'WSDL REC NACIONAL' WHERE parametertypeid = 2 AND parametercod = 'WSDL';
UPDATE public.parameter SET parametervalue = '443', parameterdesc = 'PORT REC NACIONAL' WHERE parametertypeid = 2 AND parametercod = 'PORT';
UPDATE public.parameter SET parameterdesc = 'URL REC NACIONAL' WHERE parametertypeid = 2 AND parametercod = 'URL';
INSERT INTO parameter VALUES (2, 'HOST', '<HOST_APPLIANCE>', 'URL REC NACIONAL');
INSERT INTO parameter VALUES (2, 'BURL', '/AppliancePS/', 'URL REC NACIONAL');
INSERT INTO parameter VALUES (2, 'RNAME', 'adocumentregistry_services', 'URL REC NACIONAL');
INSERT INTO parameter VALUES (2, 'SECURE', '1', 'SECURE REC NACIONAL');

-- APPRET
UPDATE public.parameter SET parametervalue = 'https://<HOST_APPLIANCE>/AppliancePS/adocumentrepository_services?wsdl', parameterdesc = 'WSDL RETR NACIONAL - DEPR' WHERE parametertypeid = 3 AND parametercod = 'WSDL';
UPDATE public.parameter SET parametervalue = '443', parameterdesc = 'PORT RETR NACIONAL - DEPR' WHERE parametertypeid = 3 AND parametercod = 'PORT';
UPDATE public.parameter SET parameterdesc = 'URL RETR NACIONAL - DEPR' WHERE parametertypeid = 3 AND parametercod = 'URL';
INSERT INTO parameter VALUES (3, 'HOST', '<HOST_APPLIANCE>', 'URL RETR NACIONAL - DEPR');
INSERT INTO parameter VALUES (3, 'BURL', '/AppliancePS/', 'URL RETR NACIONAL - DEPR');
INSERT INTO parameter VALUES (3, 'RNAME', 'adocumentrepository_services', 'URL RETR NACIONAL - DEPR');
INSERT INTO parameter VALUES (3, 'SECURE', '1', 'SECURE RETR NACIONAL - DEPR');

-- REGQRY
UPDATE public.parameter SET parametervalue = 'file://<PATH>/aqueryregistry_services.xml', parameterdesc = 'WSDL QUERY LOCAL' WHERE parametertypeid = 4 AND parametercod = 'WSDL';
UPDATE public.parameter SET parametervalue = '<PORT>', parameterdesc = 'PORT QUERY LOCAL' WHERE parametertypeid = 4 AND parametercod = 'PORT';
UPDATE public.parameter SET parameterdesc = 'URL QUERY LOCAL' WHERE parametertypeid = 4 AND parametercod = 'URL';
INSERT INTO parameter VALUES (4, 'HOST', '<HOST>', 'URL QUERY LOCAL');
INSERT INTO parameter VALUES (4, 'BURL', '/RegistroXDS/', 'URL QUERY LOCAL');
INSERT INTO parameter VALUES (4, 'RNAME', 'aqueryregistry_services', 'URL QUERY LOCAL');
INSERT INTO parameter VALUES (4, 'SECURE', '<SEC>', 'SECURE QUERY LOCAL');

-- REGLOC
UPDATE public.parameter SET parametervalue = 'file://<PATH>/adocumentregistry_services_local.xml', parameterdesc = 'WSDL UPDATE LOCAL' WHERE parametertypeid = 6 AND parametercod = 'WSDL';
UPDATE public.parameter SET parametervalue = '<PORT>', parameterdesc = 'PORT UPDATE LOCAL' WHERE parametertypeid = 6 AND parametercod = 'PORT';
UPDATE public.parameter SET parameterdesc = 'URL UPDATE LOCAL' WHERE parametertypeid = 6 AND parametercod = 'URL';
INSERT INTO parameter VALUES (6, 'HOST', '<HOST>', 'URL UPDATE LOCAL');
INSERT INTO parameter VALUES (6, 'BURL', '/RegistroXDS/', 'URL UPDATE LOCAL');
INSERT INTO parameter VALUES (6, 'RNAME', 'adocumentregistry_services', 'URL UPDATE LOCAL');
INSERT INTO parameter VALUES (6, 'SECURE', '<SEC>', 'SECURE UPDATE LOCAL');

-- REGXDS
UPDATE public.parameter SET parametervalue = 'file://<PATH>/awspixmerge_services.xml', parameterdesc = 'WSDL MERGE/UNMERGE - DEPR' WHERE parametertypeid = 9 AND parametercod = 'WSDL';
UPDATE public.parameter SET parametervalue = '<PORT>', parameterdesc = 'PORT MERGE/UNMERGE - DEPR' WHERE parametertypeid = 9 AND parametercod = 'PORT';
UPDATE public.parameter SET parameterdesc = 'URL MERGE/UNMERGE - DEPR' WHERE parametertypeid = 9 AND parametercod = 'URL';
INSERT INTO parameter VALUES (9, 'HOST', '<HOST>', 'URL MERGE/UNMERGE - DEPR');
INSERT INTO parameter VALUES (9, 'BURL', '/RegistroXDS/', 'URL MERGE/UNMERGE - DEPR');
INSERT INTO parameter VALUES (9, 'RNAME', 'awspixmerge_services', 'URL MERGE/UNMERGE - DEPR');
INSERT INTO parameter VALUES (9, 'SECURE', '<SEC>', 'SECURE MERGE/UNMERGE - DEPR');

-- VALCDA
UPDATE public.parameter SET parametervalue = 'https://<HOST_APPLIANCE>/AppliancePS/adocumentrepository_services?wsdl' WHERE parametertypeid = 10 AND parametercod = 'WSDL';
UPDATE public.parameter SET parametervalue = '443' WHERE parametertypeid = 10 AND parametercod = 'PORT';
INSERT INTO parameter VALUES (10, 'HOST', '<HOST_APPLIANCE>', 'URL consumo Validador CDA Appliance');
INSERT INTO parameter VALUES (10, 'BURL', '/AppliancePS/', 'URL consumo Validador CDA Appliance');
INSERT INTO parameter VALUES (10, 'RNAME', 'adocumentrepository_services', 'URL consumo Validador CDA Appliance');
INSERT INTO parameter VALUES (10, 'SECURE', '1', 'SECURE consumo Validador CDA Appliance');

-- RNACU
UPDATE public.parameter SET parametervalue = 'https://<HOST_APPLIANCE>/AppliancePS/adocumentregistry_services?wsdl', parameterdesc = 'WSDL UPDATE NACIONAL' WHERE parametertypeid = 11 AND parametercod = 'WSDL';
UPDATE public.parameter SET parametervalue = '443', parameterdesc = 'PORT UPDATE NACIONAL' WHERE parametertypeid = 11 AND parametercod = 'PORT';
UPDATE public.parameter SET parameterdesc = 'URL UPDATE NACIONAL' WHERE parametertypeid = 11 AND parametercod = 'URL';
INSERT INTO parameter VALUES (11, 'HOST', '<HOST_APPLIANCE>', 'URL UPDATE NACIONAL');
INSERT INTO parameter VALUES (11, 'BURL', '/AppliancePS/', 'URL UPDATE NACIONAL');
INSERT INTO parameter VALUES (11, 'RNAME', 'adocumentregistry_services', 'URL UPDATE NACIONAL');
INSERT INTO parameter VALUES (11, 'SECURE', '1', 'SECURE UPDATE NACIONAL');
