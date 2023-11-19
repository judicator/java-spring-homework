CREATE SEQUENCE IF NOT EXISTS aircraft_id
    INCREMENT 1
    START 1
    MINVALUE 1
    MAXVALUE 9223372036854775807
    CACHE 1;

CREATE TABLE IF NOT EXISTS aircraft
(
    id integer NOT NULL,
    icao_code char(4) COLLATE pg_catalog."default" NOT NULL,
    model varchar(100) COLLATE pg_catalog."default" NOT NULL,
    range int NOT NULL,
    speed int NOT NULL,
    mass int NOT NULL,
    landing_run int NOT NULL,
    takeoff_run int NOT NULL,
    passengers int NOT NULL,
    CONSTRAINT aircraft_pkey PRIMARY KEY (id)
)
TABLESPACE pg_default;

CREATE SEQUENCE IF NOT EXISTS airport_id
    INCREMENT 1
    START 1
    MINVALUE 1
    MAXVALUE 9223372036854775807
    CACHE 1;

CREATE TABLE IF NOT EXISTS airport
(
    id integer NOT NULL,
    iata_code char(3) COLLATE pg_catalog."default" NOT NULL,
    iso_country char(2) COLLATE pg_catalog."default" NOT NULL,
    coordinates point NOT NULL,
    name varchar(500) COLLATE pg_catalog."default" NOT NULL,
    municipality varchar(500) COLLATE pg_catalog."default" NOT NULL,
    timezone varchar(100) COLLATE pg_catalog."default" NOT NULL,
    CONSTRAINT airport_pkey PRIMARY KEY (id)
)
TABLESPACE pg_default;

CREATE TABLE IF NOT EXISTS airline
(
    name varchar(100)
)
TABLESPACE pg_default;
