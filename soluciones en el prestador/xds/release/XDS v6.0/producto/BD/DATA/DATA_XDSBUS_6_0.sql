-- Insert inicial de BD XDS Producto versión 6.0

\connect xdsbus

-- Cambiar <PATH> , <SEC>, <HOST>, <PORT> ,<OID_Repositorio> y <HOST_APPLIANCE>

INSERT INTO public."User" (userlogin, username, userpassworddigest, useremail, usercambiarpassword) VALUES ('admin', 'admin', '726ee1de4b3568096f6ef3a0471b21117eaa813396614836edc12801f55810f0', NULL, false);
INSERT INTO public."User" (userlogin, username, userpassworddigest, useremail, usercambiarpassword) VALUES ('test', 'test', '0ad2db5f46bce5b37979ba22053db755259ddc32e77fadfaa2e6c4f02a44b269', NULL, true);

INSERT INTO public.transaction (transactionid, transactionname) VALUES (1, 'ITIL-41');
INSERT INTO public.transaction (transactionid, transactionname) VALUES (2, 'ITIL-42');
INSERT INTO public.transaction (transactionid, transactionname) VALUES (3, 'ITIL-43');
INSERT INTO public.transaction (transactionid, transactionname) VALUES (4, 'ITIL-18');
INSERT INTO public.transaction (transactionid, transactionname) VALUES (5, 'ATNA');

INSERT INTO public.entity (entityid, entityname, transactionid, validateentity) VALUES (11, 6, 3, false);
INSERT INTO public.entity (entityid, entityname, transactionid, validateentity) VALUES (1, 1, 2, false);
INSERT INTO public.entity (entityid, entityname, transactionid, validateentity) VALUES (2, 2, 2, false);
INSERT INTO public.entity (entityid, entityname, transactionid, validateentity) VALUES (3, 3, 2, false);
INSERT INTO public.entity (entityid, entityname, transactionid, validateentity) VALUES (4, 4, 2, false);
INSERT INTO public.entity (entityid, entityname, transactionid, validateentity) VALUES (5, 5, 2, false);
INSERT INTO public.entity (entityid, entityname, transactionid, validateentity) VALUES (7, 5, 3, false);
INSERT INTO public.entity (entityid, entityname, transactionid, validateentity) VALUES (6, 5, 4, true);
INSERT INTO public.entity (entityid, entityname, transactionid, validateentity) VALUES (8, 6, 4, true);
INSERT INTO public.entity (entityid, entityname, transactionid, validateentity) VALUES (9, 7, 4, true);
INSERT INTO public.entity (entityid, entityname, transactionid, validateentity) VALUES (10, 8, 4, true);

INSERT INTO public.parametertype (parametertypeid, parametertypedesc, parametertypecod) VALUES (1, 'Parámetros generales del XDSBUS', 'PROXY ');
INSERT INTO public.parametertype (parametertypeid, parametertypedesc, parametertypecod) VALUES (2, 'Parámetros Registro Nacional (appliance)', 'RECNAC');
INSERT INTO public.parametertype (parametertypeid, parametertypedesc, parametertypecod) VALUES (3, 'Parámetros retrieve Appliance-DEPRECADO', 'APPRET');
INSERT INTO public.parametertype (parametertypeid, parametertypedesc, parametertypecod) VALUES (4, 'Parámetros query Registro XDS local', 'REGQRY');
INSERT INTO public.parametertype (parametertypeid, parametertypedesc, parametertypecod) VALUES (6, 'Parámetros update Registro XDS local', 'REGLOC');
INSERT INTO public.parametertype (parametertypeid, parametertypedesc, parametertypecod) VALUES (7, 'Parámetros Modulo Gestion Mensajeria', 'MGM   ');
INSERT INTO public.parametertype (parametertypeid, parametertypedesc, parametertypecod) VALUES (8, 'Parámetros del Syslog', 'SYS   ');
INSERT INTO public.parametertype (parametertypeid, parametertypedesc, parametertypecod) VALUES (9, 'REGXDS', 'REGXDS');
INSERT INTO public.parametertype (parametertypeid, parametertypedesc, parametertypecod) VALUES (10, 'Parámetros para el validador de CDA', 'VALCDA');
INSERT INTO public.parametertype (parametertypeid, parametertypedesc, parametertypecod) VALUES (11, 'Parámetros update Registro Nacional', 'RNACU');
INSERT INTO public.parametertype (parametertypeid, parametertypedesc, parametertypecod) VALUES (12, 'Parámetro para retornar la versión', 'VERS');

INSERT INTO public.parameter (parametertypeid, parametercod, parametervalue, parameterdesc) VALUES (1, 'MCA', '0', 'Pertenece a MCA');
INSERT INTO public.parameter (parametertypeid, parametercod, parametervalue, parameterdesc) VALUES (1, 'LOG', '1', 'Habilitar/Deshabilitar LOG');
INSERT INTO public.parameter (parametertypeid, parametercod, parametervalue, parameterdesc) VALUES (1, 'CTRDAT', '1', 'Enable control de datos');
INSERT INTO public.parameter (parametertypeid, parametercod, parametervalue, parameterdesc) VALUES (1, 'CTIME', '3000000', 'CONNECTION TIMEOUT WS');
INSERT INTO public.parameter (parametertypeid, parametercod, parametervalue, parameterdesc) VALUES (1, 'RTIME', '1000000', 'RECEIVE TIMEOUT WS');

-- Parameter para usar location

-- RECNAC
INSERT INTO parameter VALUES (2, 'WSDL', 'https://<HOST_APPLIANCE>/AppliancePS/adocumentregistry_services?wsdl', 'WSDL REC NACIONAL');
INSERT INTO parameter VALUES (2, 'PORT', '443', 'PORT REC NACIONAL');
INSERT INTO parameter VALUES (2, 'HOST', '<HOST_APPLIANCE>', 'URL REC NACIONAL');
INSERT INTO parameter VALUES (2, 'BURL', '/AppliancePS/', 'URL REC NACIONAL');
INSERT INTO parameter VALUES (2, 'RNAME', 'adocumentregistry_services', 'URL REC NACIONAL');
INSERT INTO parameter VALUES (2, 'URL', 'https://<HOST_APPLIANCE>/AppliancePS/adocumentregistry_services', 'URL REC NACIONAL');
INSERT INTO parameter VALUES (2, 'SECURE', '1', 'SECURE REC NACIONAL');

-- APPRET
INSERT INTO parameter VALUES (3, 'WSDL', 'https://<HOST_APPLIANCE>/AppliancePS/adocumentrepository_services?wsdl', 'WSDL RETR NACIONAL - DEPR');
INSERT INTO parameter VALUES (3, 'HOST', '<HOST_APPLIANCE>', 'URL RETR NACIONAL - DEPR');
INSERT INTO parameter VALUES (3, 'PORT', '443', 'PORT RETR NACIONAL - DEPR');
INSERT INTO parameter VALUES (3, 'BURL', '/AppliancePS/', 'URL RETR NACIONAL - DEPR');
INSERT INTO parameter VALUES (3, 'RNAME', 'adocumentrepository_services', 'URL RETR NACIONAL - DEPR');
INSERT INTO parameter VALUES (3, 'URL', 'https://<HOST_APPLIANCE>/AppliancePS/adocumentrepository_services', 'URL RETR NACIONAL - DEPR');
INSERT INTO parameter VALUES (3, 'SECURE', '1', 'SECURE RETR NACIONAL - DEPR');

-- REGQRY
INSERT INTO parameter VALUES (4, 'WSDL', 'file://<PATH>/aqueryregistry_services.xml', 'WSDL QUERY LOCAL');
INSERT INTO parameter VALUES (4, 'HOST', '<HOST>', 'URL QUERY LOCAL');
INSERT INTO parameter VALUES (4, 'PORT', '<PORT>', 'PORT QUERY LOCAL');
INSERT INTO parameter VALUES (4, 'BURL', '/RegistroXDS/', 'URL QUERY LOCAL');
INSERT INTO parameter VALUES (4, 'RNAME', 'aqueryregistry_services', 'URL QUERY LOCAL');
INSERT INTO parameter VALUES (4, 'URL', 'http://<HOST>:<PORT>/RegistroXDS/aqueryregistry_services', 'URL QUERY LOCAL');
INSERT INTO parameter VALUES (4, 'SECURE', '<SEC>', 'SECURE QUERY LOCAL');

-- REGLOC
INSERT INTO parameter VALUES (6, 'WSDL', 'file://<PATH>/adocumentregistry_services_local.xml', 'WSDL UPDATE LOCAL');
INSERT INTO parameter VALUES (6, 'HOST', '<HOST>', 'URL UPDATE LOCAL');
INSERT INTO parameter VALUES (6, 'PORT', '<PORT>', 'PORT UPDATE LOCAL');
INSERT INTO parameter VALUES (6, 'BURL', '/RegistroXDS/', 'URL UPDATE LOCAL');
INSERT INTO parameter VALUES (6, 'RNAME', 'adocumentregistry_services', 'URL UPDATE LOCAL');
INSERT INTO parameter VALUES (6, 'URL', 'http://<HOST>:<PORT>/RegistroXDS/adocumentregistry_services', 'URL UPDATE LOCAL');
INSERT INTO parameter VALUES (6, 'SECURE', '<SEC>', 'SECURE UPDATE LOCAL');


INSERT INTO public.parameter (parametertypeid, parametercod, parametervalue, parameterdesc) VALUES (7, 'PATHS', '/opt/wildfly/configuration/log4j.xml', 'File path Syslog');
INSERT INTO public.parameter (parametertypeid, parametercod, parametervalue, parameterdesc) VALUES (7, 'SINC', '1', 'Envio de mensajes Sincrono o Asincrono');
INSERT INTO public.parameter (parametertypeid, parametercod, parametervalue, parameterdesc) VALUES (7, 'MAXINT', '20', 'Cantidad maxima de reintentos');
INSERT INTO public.parameter (parametertypeid, parametercod, parametervalue, parameterdesc) VALUES (7, 'MAXREG', '500', 'Cantidad maxima de registros a procesar');

INSERT INTO public.parameter (parametertypeid, parametercod, parametervalue, parameterdesc) VALUES (8, 'REGNAC', 'Registro Nacional', 'Registro Nacional');
INSERT INTO public.parameter (parametertypeid, parametercod, parametervalue, parameterdesc) VALUES (8, 'INUS', 'INUS', 'INUS');
INSERT INTO public.parameter (parametertypeid, parametercod, parametervalue, parameterdesc) VALUES (8, 'REPO', 'Repositorio', 'Repositorio');
INSERT INTO public.parameter (parametertypeid, parametercod, parametervalue, parameterdesc) VALUES (8, 'FAC', '13', 'Valor del Facility');
INSERT INTO public.parameter (parametertypeid, parametercod, parametervalue, parameterdesc) VALUES (8, 'SEV', '6', 'Valor del Severity');
INSERT INTO public.parameter (parametertypeid, parametercod, parametervalue, parameterdesc) VALUES (8, 'PATHS', '/opt/wildfly/domain/configuration/log4j.xml', 'File path Syslog');
INSERT INTO public.parameter (parametertypeid, parametercod, parametervalue, parameterdesc) VALUES (8, 'WSAUTH', '0', 'Enable WS Authentication');
INSERT INTO public.parameter (parametertypeid, parametercod, parametervalue, parameterdesc) VALUES (8, 'ID', '1', 'Identificador del mensaje Syslog');


-- REGXDS
INSERT INTO parameter VALUES (9, 'WSDL', 'file://<PATH>/awspixmerge_services.xml', 'WSDL MERGE/UNMERGE - DEPR');
INSERT INTO parameter VALUES (9, 'HOST', '<HOST>', 'URL MERGE/UNMERGE - DEPR');
INSERT INTO parameter VALUES (9, 'PORT', '<PORT>', 'PORT MERGE/UNMERGE - DEPR');
INSERT INTO parameter VALUES (9, 'BURL', '/RegistroXDS/', 'URL MERGE/UNMERGE - DEPR');
INSERT INTO parameter VALUES (9, 'RNAME', 'awspixmerge_services', 'URL MERGE/UNMERGE - DEPR');
INSERT INTO parameter VALUES (9, 'URL', 'http://<HOST>:<PORT>/RegistroXDS/awspixmerge_services', 'URL MERGE/UNMERGE - DEPR');
INSERT INTO parameter VALUES (9, 'SECURE', '<SEC>', 'SECURE MERGE/UNMERGE - DEPR');

-- VALCDA
INSERT INTO parameter VALUES (10, 'WSDL', 'https://<HOST_APPLIANCE>/AppliancePS/adocumentrepository_services?wsdl', 'WSDL consumo Validador CDA Appliance');
INSERT INTO parameter VALUES (10, 'HOST', '<HOST_APPLIANCE>', 'URL consumo Validador CDA Appliance');
INSERT INTO parameter VALUES (10, 'PORT', '443', 'PORT consumo Validador CDA Appliance');
INSERT INTO parameter VALUES (10, 'BURL', '/AppliancePS/', 'URL consumo Validador CDA Appliance');
INSERT INTO parameter VALUES (10, 'RNAME', 'adocumentrepository_services', 'URL consumo Validador CDA Appliance');
INSERT INTO parameter VALUES (10, 'URL', 'https://<HOST_APPLIANCE>/AppliancePS/adocumentrepository_services', 'URL consumo Validador CDA Appliance');
INSERT INTO parameter VALUES (10, 'ITI41', '0', '1 es que hay que llamar al ITI41');
INSERT INTO parameter VALUES (10, 'SECURE', '1', 'SECURE consumo Validador CDA Appliance');

-- RNACU
INSERT INTO parameter VALUES (11, 'WSDL', 'https://<HOST_APPLIANCE>/AppliancePS/adocumentregistry_services?wsdl', 'WSDL UPDATE NACIONAL');
INSERT INTO parameter VALUES (11, 'HOST', '<HOST_APPLIANCE>', 'URL UPDATE NACIONAL');
INSERT INTO parameter VALUES (11, 'PORT', '443', 'PORT UPDATE NACIONAL');
INSERT INTO parameter VALUES (11, 'BURL', '/AppliancePS/', 'URL UPDATE NACIONAL');
INSERT INTO parameter VALUES (11, 'RNAME', 'adocumentregistry_services', 'URL UPDATE NACIONAL');
INSERT INTO parameter VALUES (11, 'URL', 'https://<HOST_APPLIANCE>/AppliancePS/adocumentregistry_services', 'URL UPDATE NACIONAL');
INSERT INTO parameter VALUES (11, 'SECURE', '1', 'SECURE UPDATE NACIONAL');


INSERT INTO public.parameter (parametertypeid, parametercod, parametervalue, parameterdesc) VALUES (12, 'VERS', '6.0', 'Versión del XDS');


INSERT INTO public.processtype (processtypeid, processtypecode, processtypedescription) VALUES (1, 'BATCH', 'Reenvío de MensajeríaReenvío de Mensajería');


INSERT INTO public.process (processid, processcode, processdescription, processmaxattempts, processtypeid) VALUES (1, 'ITI-41', 'ITI-41', 5, 1);
INSERT INTO public.process (processid, processcode, processdescription, processmaxattempts, processtypeid) VALUES (2, 'ITI-42', 'ITI-42', 5, 1);
INSERT INTO public.process (processid, processcode, processdescription, processmaxattempts, processtypeid) VALUES (3, 'ITI-57', 'ITI-57', 5, 1);


INSERT INTO public.state (stateid, statecode, statedescription) VALUES (1, 'PEND', 'Mensaje Pendiente');
INSERT INTO public.state (stateid, statecode, statedescription) VALUES (2, 'PROCSE', 'Procesado sin error');
INSERT INTO public.state (stateid, statecode, statedescription) VALUES (3, 'PROCCE', 'Procesado con error');
INSERT INTO public.state (stateid, statecode, statedescription) VALUES (4, 'CANUSU', 'Cancelado por usuario');
INSERT INTO public.state (stateid, statecode, statedescription) VALUES (5, 'CANPRO', 'Cancelado por proceso');


INSERT INTO public.repositorydata (repositorydataoid, repositorydataurl, repositorydatawsdl, repositorydataavailable, repositorydataversion, repositorydatasendtohcen, repositorydatahost, repositorydataport, repositorydatabaseurl, repositorydataresourcename, repositorydatasecure) 
VALUES ('<OID_REPOSITORIO>', 'http://<HOST>:<PORT>/RepositorioXDS/adocumentrepository_services', 'file://<PATH>/adocumentrepository_services.xml', true, '2.x', true, '<HOST>', <PORT>, '/RepositorioXDS/', 'adocumentrepository_services', <SEC>);
