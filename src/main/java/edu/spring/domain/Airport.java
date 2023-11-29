package edu.spring.domain;

import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.awt.geom.Point2D;

@Getter
@Setter
@Entity
@NoArgsConstructor
@AllArgsConstructor
@Table(name = "airport")
public class Airport {
    @Id
    @GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "airport_id")
    @SequenceGenerator(name = "airport_id", sequenceName = "airport_id", allocationSize = 1)
    private Integer id;

    // Название аэропорта
    @Column(nullable = false)
    private String name;

    // Координаты (широта и долгота)
    @Column(nullable = false)
    private Double latitude;
    @Column(nullable = false)
    private Double longitude;

    // Двухбуквенный ISO-код страны
    @Column(name = "iso_country", nullable = false)
    private String isoCountry;

    // Город, к которому относится аэропорт
    @Column(nullable = false)
    private String municipality;

    // Трёхбуквенный IATA-код аэропорта
    @Column(name = "iata_code", nullable = false, unique = true)
    private String iataCode;

    // Временная зона, в которой расположен аэропорт
    @Column(nullable = false)
    private String timezone;

    public String toString() {
        return getMunicipality() + ", " + getIsoCountry() + " (" + getIataCode() + ")";
    }

    public Point2D getCoordinates() {
        return new Point2D.Double(latitude, longitude);
    }
}
