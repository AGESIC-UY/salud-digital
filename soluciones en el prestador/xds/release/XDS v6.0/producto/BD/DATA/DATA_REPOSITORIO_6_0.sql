
\connect repositorio

-- Cambiar <SEC>, <HOST>, <PORT> y <PATH>

INSERT INTO public.parametro (parametrocod, parametroval, parametrodesc) VALUES ('LOCAL', 'S', 'Historia clinica nacional');
INSERT INTO public.parametro (parametrocod, parametroval, parametrodesc) VALUES ('INFILE', '0', 'Documento se guarda en archivo');
INSERT INTO public.parametro (parametrocod, parametroval, parametrodesc) VALUES ('LOG', '1', 'Log de repositorio');
INSERT INTO public.parametro (parametrocod, parametroval, parametrodesc) VALUES ('VERSION', '6.0', 'Versión del REPOSITORIO XDS');

-- Insert parametros registro local
INSERT INTO public.parametro (parametrocod, parametroval, parametrodesc) VALUES ('XDSPORT', '<PORT>', 'Puerto Registro XDS');
INSERT INTO public.parametro (parametrocod, parametroval, parametrodesc) VALUES ('XDSWSDL', 'file://<PATH>/adocumentregistry_services_local.xml', 'WSDL Registro XDS');
INSERT INTO public.parametro (parametrocod, parametroval, parametrodesc) VALUES ('XDSURL', 'http://<HOST>:<PORT>/RegistroXDS/adocumentregistry_services', 'URL Registro XDS Service');
INSERT INTO public.parametro (parametrocod, parametroval, parametrodesc) VALUES ('XDSHOST', '<HOST>', 'HOST Registro XDS Service');
INSERT INTO public.parametro (parametrocod, parametroval, parametrodesc) VALUES ('XDSBURL', '/RegistroXDS/', 'BASE URL Registro XDS Service');
INSERT INTO public.parametro (parametrocod, parametroval, parametrodesc) VALUES ('XDSRNAME', 'adocumentregistry_services', 'RNAME Registro XDS Service');
INSERT INTO public.parametro (parametrocod, parametroval, parametrodesc) VALUES ('XDSSECU', '<SEC>', 'SECURE Registro XDS Service');
