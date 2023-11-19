package edu.spring.domain;

import lombok.Getter;
import lombok.Setter;

import java.awt.geom.Point2D;

@Getter
@Setter
public class Airport {
    private final int id;
    // Название аэропорта
    private final String name;
    // Координаты (широта и долгота)
    private final Point2D coordinates;
    // Двухбуквенный ISO-код страны
    private final String isoCountry;
    // Город, к которому относится аэропорт
    private final String municipality;
    // Трёхбуквенный IATA-код аэропорта
    private final String iataCode;
    // Временная зона, в которой расположен аэропорт
    private final String timeZone;

    public Airport(int id, String name, Point2D coordinates, String isoCountry, String municipality, String iataCode, String timeZone) {
        this.id = id;
        this.name = name;
        this.coordinates = coordinates;
        this.isoCountry = isoCountry;
        this.municipality = municipality;
        this.iataCode = iataCode;
        this.timeZone = timeZone;
    }
}
