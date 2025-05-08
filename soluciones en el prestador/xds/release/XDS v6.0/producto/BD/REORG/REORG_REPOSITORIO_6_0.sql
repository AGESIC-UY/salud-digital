
\connect repositorio

-- Cambiar <SEC>, <HOST>, <PORT> y <PATH>

UPDATE public.parametro SET parametroval = '6.0' WHERE parametrocod = 'VERSION';

-- Insert parametros registro local
UPDATE public.parametro SET parametroval = '<PORT>' WHERE parametrocod = 'XDSPORT';
UPDATE public.parametro SET parametroval = 'file://<PATH>/adocumentregistry_services_local.xml' WHERE parametrocod = 'XDSWSDL';
INSERT INTO public.parametro (parametrocod, parametroval, parametrodesc) VALUES ('XDSHOST', '<HOST>', 'HOST Registro XDS Service');
INSERT INTO public.parametro (parametrocod, parametroval, parametrodesc) VALUES ('XDSBURL', '/RegistroXDS/', 'BASE URL Registro XDS Service');
INSERT INTO public.parametro (parametrocod, parametroval, parametrodesc) VALUES ('XDSRNAME', 'adocumentregistry_services', 'RNAME Registro XDS Service');
INSERT INTO public.parametro (parametrocod, parametroval, parametrodesc) VALUES ('XDSSECU', '<SEC>', 'SECURE Registro XDS Service');
