package edu.spring.services;

import ch.qos.logback.core.net.server.Client;
import edu.spring.dao.*;
import edu.spring.domain.Aircraft;
import edu.spring.domain.Airport;
import edu.spring.domain.Flight;
import edu.spring.domain.FlightStatus;
import edu.spring.utils.Utils;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Service;

import java.awt.geom.Point2D;
import java.time.LocalDateTime;
import java.util.Date;
import java.util.Random;

@Service
public class FlightGenerator {
    // Запас времени в минутах до приземления (по расписанию) для создаваемого рейса
    private static final int minutesBeforeLanding = 40;
    // Возможная дельта (+- случайное число минут в пределах дельты) к запасу времени до приземления
    private static final int minutesBeforeLandingDelta = 10;
    // Минимальное расстояние полёта для генерируемых рейсов (в морских милях)
    private static final int minFlightDistance = 50;
    // Примерное время в минутах с момента взлёта до выхода на эшелон
    private static final int minutesUntilCruise = 20;
    // Примерное время в минутах с момента начала снижения до посадки
    private static final int minutesUntilLanding = 20;
    // Примерное время в минутах на посадку/дозаправку/смену экипажа/взлёт в промежуточном аэропорту
    private static final int minutesForRefueling = 80;
    // Вероятность задержки рейса (в процентах)
    private static final int flightDelayProbability = 30;
    // Минимальная задержка рейса (в минутах)
    private static final int minFlightDelay = 20;
    // Максимальная задержка рейса (в минутах)
    private static final int maxFlightDelay = 90;
    // Максимальное кол-во активных рейсов
    private static final int maxActiveFlights = 12;


    private final Point2D homeCoordinates;

    private final HomeAirport homeAirport;

    private final FlightDao flightDao;

    private final AircraftDao aircraftDao;

    private final AirportDao airportDao;

    private final ClientsNotification clientsNotification;

    public FlightGenerator(HomeAirport homeAirport, AircraftDao aircraftDao, FlightDao flightDao, AirportDao airportDao, ClientsNotification clientsNotification) {
        this.homeAirport = homeAirport;
        homeCoordinates = homeAirport.getAirport().getCoordinates();
        this.aircraftDao = aircraftDao;
        this.flightDao = flightDao;
        this.airportDao = airportDao;
        this.clientsNotification = clientsNotification;
    }

    @Scheduled(initialDelay = 3000, fixedRate = 5000)
    public void CreateRandomFlight() {
        LocalDateTime homeAirportLocalDateTime = homeAirport.getLocalDateTime();
        if (flightDao.getActiveFlightsCount(homeAirportLocalDateTime) > maxActiveFlights) {
            return;
        }
        Random rnd = new Random();
        int delay = 0;
        // Рейс задерживается?
        if (rnd.nextInt(101) <= flightDelayProbability) {
            delay = rnd.nextInt(maxFlightDelay - minFlightDelay + 1) + minFlightDelay;
        }
        LocalDateTime scheduledArrival = homeAirportLocalDateTime.
                plusMinutes(minutesBeforeLanding).
                plusMinutes(rnd.nextInt(minutesBeforeLandingDelta * 2 + 1) - minutesBeforeLandingDelta);
        LocalDateTime realArrival = scheduledArrival.plusMinutes(delay);
        FlightStatus status = FlightStatus.OnTime;
        if (delay > 0) {
            status = FlightStatus.Delayed;
        }
        int maxRange = aircraftDao.getMaxRange();
        // Случайным образом выбираем длину перелёта (от минимальной до максимальной, которую имеют самолёты в БД)
        int range = rnd.nextInt(maxRange - minFlightDistance + 1) + minFlightDistance;

        // Выбираем случайный аэропорт в радиусе 1.9 * range (т.е. с учётом того, что в рамках рейса возможна одна промежуточная посадка)
        Airport originAirport;
        try {
            originAirport = airportDao.getRandomAirport((int) Math.round(range * 1.9), homeCoordinates);
        }
        catch (NoAirportFoundException e) {
            // System.out.println(e.getMessage());
            return;
        }
        // Реальное расстояние между домашним аэропортом и аэропортом вылета в морских милях
        int actualRange = airportDao.getDistance(homeCoordinates, originAirport.getCoordinates());
        int actualAircraftRange = ((int) Math.round(actualRange / 1.9));

        // Подбираем самолёт, который может пролететь необходимое расстояние
        Aircraft aircraft;
        try {
            aircraft = aircraftDao.getRandomAircraft(actualAircraftRange);
        }
        catch (NoAircraftFoundException e) {
//            System.out.println(e.getMessage());
            return;
        }

        // Определяем длительность полёта в минутах
        int baseFlightDuration = Math.round(60 * actualRange / aircraft.getSpeed())  + minutesUntilCruise + minutesUntilLanding;
        if (actualRange > aircraft.getRange()) {
            // Рейс с промежуточной посадкой
            baseFlightDuration += minutesForRefueling;
        }
        // Создание рейса
        Flight flight = new Flight(getRandomFlightCode(), flightDao.getRandomAirline(), aircraft, originAirport, status, scheduledArrival, realArrival, null);
        int id = flightDao.insert(flight);
        flight.setId(id);
        // Создаём случайных клиентов для уведомления об изменения состояния рейса и сразу рассылаем первоначальные уведомления
        clientsNotification.createClientsToNotify(flight);
        clientsNotification.notifyClients(flight);;
//        System.out.println(flight + " " + flight.getStatus().toString() + " (" + Utils.formatTime(flight.getActualArrivalTime()) + "): " + flight.getAircraft() + ", " +
//              "flight time: " + Utils.formatFlightTime(baseFlightDuration) + ", distance: " + actualRange + " nmi");
    }

    private String getRandomFlightCode() {
        String letters = "QWERTYUIOPASDFGHJKLZXCVBNM";
        Random rnd = new Random();
        String result = String.valueOf(letters.charAt(rnd.nextInt(letters.length())));
        result += letters.charAt(rnd.nextInt(letters.length()));
        return result + " " + (rnd.nextInt(989) + 11);
    }
}
