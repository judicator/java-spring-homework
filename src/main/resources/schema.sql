CREATE SEQUENCE IF NOT EXISTS airport_id
    INCREMENT 1
    START 1
    MINVALUE 1
    MAXVALUE 9223372036854775807
    CACHE 1;

CREATE TABLE IF NOT EXISTS airport
(
    id integer NOT NULL,
    name character varying(500) COLLATE pg_catalog."default" NOT NULL,
    iso_country character varying(2) COLLATE pg_catalog."default" NOT NULL,
    municipality character varying(500) COLLATE pg_catalog."default" NOT NULL,
    iata_code character varying(3) COLLATE pg_catalog."default" NOT NULL,
    CONSTRAINT airport_pkey PRIMARY KEY (id)
    )
    TABLESPACE pg_default;
