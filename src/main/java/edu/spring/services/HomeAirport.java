package edu.spring.services;

import edu.spring.dao.AircraftDao;
import edu.spring.dao.AirportDao;
import edu.spring.domain.Airport;
import edu.spring.domain.Runway;
import org.springframework.stereotype.Service;

import java.time.LocalDateTime;
import java.time.ZoneId;
import java.time.format.DateTimeFormatter;
import java.util.Random;

@Service
public class HomeAirport {
    private static final int minRunwaysCount = 2;
    private static final int maxRunwaysCount = 7;

    private final Airport airport;

    private final int maxAircraftMass;
    private final int maxAircraftTakeoffRun;

    private Runway[] runways;

    public HomeAirport(AirportDao airportDao, AircraftDao aircraftDao) {
        this.airport = airportDao.getRandomHomeAirport();
        this.maxAircraftMass = aircraftDao.getMaxMass();
        this.maxAircraftTakeoffRun = aircraftDao.getMaxTakeoffRun();
        this.generateRunways();
    }

    // Вывод приветствия "от лица" домашнего аэропорта
    public void greeting() {
        int runwaysCount = runways.length;
        System.out.println("Welcome to " + this.airport.getName() + " (" + this.airport.getMunicipality() + ", " + this.airport.getIsoCountry() + ") [" + this.airport.getIataCode() + "]");
        ZoneId tzId = ZoneId.of(this.airport.getTimeZone());
        LocalDateTime airportDateTime = LocalDateTime.now(tzId);
        String offset = tzId.getRules().getOffset(airportDateTime).toString();
        if (offset == "Z") {
            offset = "";
        }
        System.out.println("Local date/time is " + airportDateTime.format(DateTimeFormatter.ofPattern("dd.MM.yyyy HH:mm:ss")) +
                " (UTC" + offset + ")");
        System.out.println("Airport has " + runwaysCount + " runways:");
        for (int i = 0; i < runwaysCount; i++) {
            System.out.println("    " + runways[i].getFullName() + " (" + runways[i].getLength() + " meters long, max allowed aircraft mass is " +
                    runways[i].getAllowedAircraftMass() + " t)");
        }
    }

    // Генерация взлётно-посадочных полос для домашнего аэропорта
    private void generateRunways() {
        String prefixes1 = "ABCDEFG";
        String prefixes2 = "ZYXWVUT";
        Random rnd = new Random();
        int n = rnd.nextInt(maxRunwaysCount - minRunwaysCount + 1) + minRunwaysCount;
        runways = new Runway[n];
        for (int i = 0; i < n; i++) {
            int num = rnd.nextInt(36) + 1;
            runways[i] = new Runway(num, prefixes1.charAt(i), prefixes2.charAt(i));
        }
        // Первая ВВП аэропорта всегда может принять самый большой борт
        runways[0].setLength(maxAircraftTakeoffRun);
        runways[0].setAllowedAircraftMass(maxAircraftMass);
    }

    public Airport getAirport() {
        return this.airport;
    }
}
