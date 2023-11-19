package edu.spring.services;

import edu.spring.dao.AircraftDao;
import edu.spring.dao.AirportDao;
import edu.spring.dao.FlightDao;
import edu.spring.domain.Airport;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Service;

import java.awt.geom.Point2D;

@Service
public class FlightGenerator {
    // Примерное время в минутах с момента взлёта до выхода на эшелон
    private static final int minutesUntilCruise = 20;
    // Примерное время в минутах с момента начала снижения до посадки
    private static final int minutesUntilLandings = 20;
    // Примерное время в минутах на посадку/дозаправку/смену экипажа/взлёт в промежуточном аэропорту
    private static final int minutesForRefueling = 80;

    private final Point2D homeCoordinates;

    private final int maxAircraftRange;

    private FlightDao flightDao;

    private AirportDao airportDao;

    public FlightGenerator(HomeAirport homeAirport, AircraftDao aircraftDao, FlightDao flightDao, AirportDao airportDao) {
        homeCoordinates = homeAirport.getAirport().getCoordinates();
        maxAircraftRange = ((int) Math.round(aircraftDao.getMaxRange() * 1.9)) ;
        this.flightDao = flightDao;
        this.airportDao = airportDao;
    }

    @Scheduled(initialDelay = 4000, fixedDelay = 2000)
    public void CreateRandomFlight() {
        Airport airport = airportDao.getRandomAirport(maxAircraftRange, homeCoordinates);
        System.out.println("Random flight of " + flightDao.getRandomAirline() + " from " +
                airport.getName() + " (" + airport.getMunicipality() + ", " + airport.getIsoCountry() + ") [" + airport.getIataCode() + "]");
        System.out.println("Distance : " + airportDao.getDistance(homeCoordinates, airport.getCoordinates()) + " nmi");
    }
}
