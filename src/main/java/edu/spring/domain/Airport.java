package edu.spring.domain;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.Setter;

import java.awt.geom.Point2D;

@Getter
@Setter
public class Airport {
    private Integer id;
    // Название аэропорта
    private String name;
    // Координаты (широта и долгота)
    private Point2D coordinates;
    // Двухбуквенный ISO-код страны
    private String isoCountry;
    // Город, к которому относится аэропорт
    private String municipality;
    // Трёхбуквенный IATA-код аэропорта
    private String iataCode;
    // Временная зона, в которой расположен аэропорт
    private String timeZone;

    public Airport(String name, Point2D coordinates, String isoCountry, String municipality, String iataCode, String timeZone) {
        this.id = null;
        this.name = name;
        this.coordinates = coordinates;
        this.isoCountry = isoCountry;
        this.municipality = municipality;
        this.iataCode = iataCode;
        this.timeZone = timeZone;
    }

    public String toString() {
        return getMunicipality() + ", " + getIsoCountry() + " (" + getIataCode() + ")";
    }
}
