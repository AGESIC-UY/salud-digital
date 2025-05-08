-- XDS

UPDATE public.parameter SET parametervalue = '5.0' WHERE parametertypeid = 13 AND parametercod = 'VERS';


ALTER TABLE RepositoryData ADD RepositoryDataSendToHCEN BOOLEAN NOT NULL DEFAULT TRUE;

ALTER TABLE RepositoryData ALTER COLUMN RepositoryDataSendToHCEN DROP DEFAULT;

INSERT INTO public.parameter (parametertypeid, parametercod, parametervalue, parameterdesc) VALUES (1, 'MCA', '0', 'Pertenece a MCA');
INSERT INTO public.parameter (parametertypeid, parametercod, parametervalue, parameterdesc) VALUES (1, 'CTIME', '3000000', 'CONNECTION TIMEOUT WS');
INSERT INTO public.parameter (parametertypeid, parametercod, parametervalue, parameterdesc) VALUES (1, 'RTIME', '1000000', 'RECEIVE TIMEOUT WS');

INSERT INTO public.parameter (parametertypeid, parametercod, parametervalue, parameterdesc) VALUES (7, 'MAXINT', '20', 'Cantidad maxima de reintentos');
INSERT INTO public.parameter (parametertypeid, parametercod, parametervalue, parameterdesc) VALUES (7, 'MAXREG', '500', 'Cantidad maxima de registros a procesar');

INSERT INTO public.parameter (parametertypeid, parametercod, parametervalue, parameterdesc) VALUES (8, 'WSAUTH', '0', 'Enable WS Authentication');
