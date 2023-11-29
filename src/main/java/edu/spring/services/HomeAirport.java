package edu.spring.services;

import edu.spring.domain.Airport;
import edu.spring.domain.Flight;
import edu.spring.domain.Runway;
import edu.spring.repository.AirportRepository;
import edu.spring.repository.FlightRepository;
import edu.spring.repository.RunwayRepository;
import edu.spring.utils.Utils;
import jakarta.transaction.Transactional;
import lombok.Getter;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Service;

import java.time.*;
import java.util.List;
import java.util.Random;

@Service
@Transactional
public class HomeAirport {
    // Минимальное кол-во ВПП
    private static final int minRunwaysCount = 2;
    // Максимальное кол-во ВПП
    private static final int maxRunwaysCount = 5;

    // Множитель для скорости, с которой "идут" часы аэропорта
    private static final int clockSpeedMultiplier = 30;

    @Getter
    private final Airport airport;

    @Getter
    private int runwaysCount;

    private final RunwayRepository runwayRepository;

    private final FlightRepository flightRepository;

    @Getter
    private final ZoneId timezone;

    private final long startEpochMilli;

    public HomeAirport(AirportRepository airportRepository, RunwayRepository runwayRepository, FlightRepository flightRepository) {
        airport = airportRepository.getRandomHomeAirport();
//        airport = airportRepository.findByIataCode("VKO");
        timezone = ZoneId.of(airport.getTimezone());
        startEpochMilli = Clock.system(timezone).instant().toEpochMilli();
        this.runwayRepository = runwayRepository;
        this.flightRepository = flightRepository;
        generateRunways();
    }

    // Вывод приветствия домашнего аэропорта
    public void greeting() {
        System.out.println("Welcome to " + airport.getName() + " (" + airport.getMunicipality() + ", " + airport.getIsoCountry() + ") [" + airport.getIataCode() + "]");
        System.out.println("Local date/time is " + Utils.formatDateTime(getLocalDateTime(), timezone));
        System.out.println("Airport has " + runwaysCount + " runways:");
        List<Runway> runways = runwayRepository.getAll();
        runways.forEach(runway -> System.out.println("    " + runway));
    }

    // Генерация взлётно-посадочных полос для домашнего аэропорта
    @Transactional
    private void generateRunways() {
        String prefixes1 = "ABCDEFG";
        String prefixes2 = "ZYXWVUT";
        Random rnd = new Random();
        runwaysCount = rnd.nextInt(maxRunwaysCount - minRunwaysCount + 1) + minRunwaysCount;
        for (int i = 0; i < runwaysCount; i++) {
            runwayRepository.insert(Runway.factory(prefixes1.charAt(i), prefixes2.charAt(i), i == 0));
        }
    }

    @Scheduled(initialDelay = 5000, fixedRate = 5000)
    public void arrivalsDashboard() {
        List<Flight> flights = flightRepository.getFlightsForDashboard(getLocalDateTime());
        System.out.println("");
        System.out.println("Local date/time: " + Utils.formatDateTime(getLocalDateTime(), getTimezone()));
        System.out.println("==========================================================================================================================================");
        System.out.println("Arrival time           Destination                               Flight number Airline                        Status");
        System.out.println("==========================================================================================================================================");
        flights.forEach(flight -> {
            String flightInfo = Utils.fixedLengthString(flight.arrivalTimeForDashboard(), 22) + " ";
            flightInfo += Utils.fixedLengthString(flight.getOrigin().toString(), 41) + " ";
            flightInfo += Utils.fixedLengthString(flight.getCode(), 13) + " ";
            flightInfo += Utils.fixedLengthString(flight.getCompany(), 30) + " ";
            flightInfo += flight.statusForDashboard();
            System.out.println(flightInfo);
        });
    }

    public LocalDateTime getLocalDateTime() {
        long msNow = Clock.system(timezone).instant().toEpochMilli();
        long msPassed = msNow - startEpochMilli;
        return Instant.ofEpochMilli(msNow + msPassed * clockSpeedMultiplier).atZone(timezone).toLocalDateTime();
    }
}
