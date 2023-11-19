package edu.spring.dao;

import edu.spring.domain.Flight;

import java.awt.geom.Point2D;

public interface FlightDao {
    String getRandomAirline();

    Flight createRandomFlight(int maxDistance, Point2D destinationCoords);
}
