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
    latitude double precision  NOT NULL,
    longitude double precision NOT NULL,
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

CREATE SEQUENCE IF NOT EXISTS runway_id
    INCREMENT 1
    START 1
    MINVALUE 1
    MAXVALUE 9223372036854775807
    CACHE 1;

CREATE TABLE IF NOT EXISTS runway
(
    id integer NOT NULL,
	name_dir1 char(3) COLLATE pg_catalog."default" NOT NULL,
	name_dir2 char(3) COLLATE pg_catalog."default" NOT NULL,
    is_main boolean NOT NULL,
	length int NOT NULL,
	allowed_aircraft_mass int NOT NULL,
    reserved_for int NULL,
    reserved_until timestamp NULL,
    CONSTRAINT runway_pkey PRIMARY KEY (id)
)
TABLESPACE pg_default;

CREATE SEQUENCE IF NOT EXISTS flight_id
    INCREMENT 1
    START 1
    MINVALUE 1
    MAXVALUE 9223372036854775807
    CACHE 1;

CREATE TABLE IF NOT EXISTS flight
(
    id integer NOT NULL,
	code varchar(6) COLLATE pg_catalog."default" NOT NULL,
	company varchar(100) COLLATE pg_catalog."default" NOT NULL,
    aircraft int NOT NULL,
    status varchar(20) COLLATE pg_catalog."default" NOT NULL,
    origin int NOT NULL,
    scheduled_arrival_time timestamp NOT NULL,
    actual_arrival_time timestamp NOT NULL,
    runway_num char(3) COLLATE pg_catalog."default" NULL,
    CONSTRAINT flight_pkey PRIMARY KEY (id)
)
TABLESPACE pg_default;

CREATE SEQUENCE IF NOT EXISTS client_to_notify_id
    INCREMENT 1
    START 1
    MINVALUE 1
    MAXVALUE 9223372036854775807
    CACHE 1;

CREATE TABLE IF NOT EXISTS client_to_notify
(
    id integer NOT NULL,
	flight_id int NOT NULL,
	phone_num varchar(12) COLLATE pg_catalog."default" NULL,
    email varchar(255) COLLATE pg_catalog."default" NULL,
    CONSTRAINT client_to_notify_pkey PRIMARY KEY (id)
)
TABLESPACE pg_default;

-- Функция считает расстояние между двумя точками на поверхности Земли, результат в морских милях
CREATE OR REPLACE FUNCTION distance_on_earth(lat1 float, lon1 float, lat2 float, lon2 float)
RETURNS float
AS '
DECLARE
    dist float = 0;
    radlat1 float;
    radlat2 float;
    theta float;
    radtheta float;
BEGIN
    IF lat1 = lat2 AND lon1 = lon2 THEN
        RETURN dist;
    ELSE
        radlat1 = pi() * lat1 / 180;
        radlat2 = pi() * lat2 / 180;
        theta = lon1 - lon2;
        radtheta = pi() * theta / 180;
        dist = sin(radlat1) * sin(radlat2) + cos(radlat1) * cos(radlat2) * cos(radtheta);

        IF dist > 1 THEN dist = 1; END IF;

        dist = acos(dist);
        dist = dist * 180 / pi();
        dist = dist * 60 * 1.1515;

        dist = dist * 0.8684;
        RETURN dist;
    END IF;
END;
' LANGUAGE plpgsql;
