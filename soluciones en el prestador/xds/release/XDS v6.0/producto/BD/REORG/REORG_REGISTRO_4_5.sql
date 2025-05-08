-- REGISTRO

-- Parámetros

CREATE SEQUENCE public.parametertypeid
  INCREMENT 1
  MINVALUE 1
  MAXVALUE 9223372036854775807
  START 1
  CACHE 1;
  
CREATE TABLE ParameterType (
  ParameterTypeId   SMALLINT     NOT NULL     DEFAULT Nextval('ParameterTypeId'),
  ParameterTypeDesc VARCHAR(40)     NOT NULL,
  ParameterTypeCod  CHAR(6)     NOT NULL,
      PRIMARY KEY ( ParameterTypeId ));
	  
CREATE TABLE Parameter (
  ParameterTypeId SMALLINT     NOT NULL,
  ParameterCod    CHAR(6)     NOT NULL,
  ParameterValue  VARCHAR(500)     NOT NULL,
  ParameterDesc   VARCHAR(40)     NOT NULL,
      PRIMARY KEY ( ParameterTypeId,ParameterCod ));
	  

-- Imágenes

CREATE TABLE ObjectIntance (StudyInstanceUID VARCHAR(120) NOT NULL , SeriesInstanceUID VARCHAR(120) NOT NULL , ObjectIntanceUID VARCHAR(120) NOT NULL , PRIMARY KEY(StudyInstanceUID, SeriesInstanceUID, ObjectIntanceUID));

CREATE TABLE SeriesInstance (StudyInstanceUID VARCHAR(120) NOT NULL , SeriesInstanceUID VARCHAR(120) NOT NULL , PRIMARY KEY(StudyInstanceUID, SeriesInstanceUID));

CREATE TABLE StudyInstance (StudyInstanceUID VARCHAR(120) NOT NULL , docEntryEntryUUID VARCHAR(120) NOT NULL , PRIMARY KEY(StudyInstanceUID));
CREATE INDEX ISTUDYINSTANCE1 ON StudyInstance (docEntryEntryUUID );

ALTER TABLE SeriesInstance
ADD SeriesInstanceDocEntryUID VARCHAR(120);

CREATE INDEX USERIESINSTANCE1 ON SeriesInstance (SeriesInstanceDocEntryUID);

ALTER TABLE ObjectIntance
ADD ObjectIntanceDocEntryUID VARCHAR(120);

CREATE INDEX UOBJECTINTANCE1 ON ObjectIntance (ObjectIntanceDocEntryUID);


-- Valores parámetros

INSERT INTO parametertype VALUES (2, 'Parámetro para retornar la versión', 'VERS');

INSERT INTO parameter VALUES (2, 'VERS', '4.5', 'Versión del REGISTRO XDS');

INSERT INTO parametertype VALUES (1, 'Parámetro del sistema', 'SYS');

INSERT INTO parameter VALUES (1, 'LOG', '1', '1 = loguea, 0 no');
