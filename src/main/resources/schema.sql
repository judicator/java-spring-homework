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
