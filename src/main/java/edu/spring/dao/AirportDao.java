package edu.spring.dao;

import edu.spring.domain.Airport;

public interface AirportDao {
    int count();

    Airport getRandomHomeAirport();

    Airport getFlightRandomOrigin(Airport home);
}
