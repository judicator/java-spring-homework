package edu.spring.dao;

import edu.spring.domain.Airport;
import edu.spring.services.HomeAirport;

public interface AirportDao {
    int count();

    Airport getRandomHomeAirport();

    Airport getRandomAirport(String exceptMunicipality);
}
