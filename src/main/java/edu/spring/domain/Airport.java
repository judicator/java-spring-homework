package edu.spring.domain;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class Airport {
    private final int id;
    private final String name;
    private final String isoCountry;
    private final String municipality;
    private final String iataCode;

    public Airport(int id, String name, String isoCountry, String municipality, String iataCode) {
        this.id = id;
        this.name = name;
        this.isoCountry = isoCountry;
        this.municipality = municipality;
        this.iataCode = iataCode;
    }
}
