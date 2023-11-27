package edu.spring.dao;

import edu.spring.domain.Airport;
import edu.spring.services.HomeAirport;

import java.awt.geom.Point2D;

public interface AirportDao {
    int count();

    Airport getById(int id);

    Airport getRandomHomeAirport();

    Airport getRandomAirport(int maxDistance, Point2D originCoords);

    Airport findByIataCode(String iataCode);

    int getDistance(Point2D originCoords, Point2D destCoords);
}
