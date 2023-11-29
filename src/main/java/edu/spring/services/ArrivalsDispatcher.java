package edu.spring.services;

import edu.spring.repository.FlightRepository;
import edu.spring.repository.NoRunwayFoundException;
import edu.spring.domain.Flight;
import edu.spring.domain.FlightStatus;
import edu.spring.domain.Runway;
import edu.spring.repository.RunwayRepository;
import jakarta.transaction.Transactional;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Service;

import java.time.LocalDateTime;
import java.util.List;

@Service
public class ArrivalsDispatcher {
    // Время (в минутах), необходимое для посадки рейса
    private static final int timeToLand = 10;
    // Время, необходимое на освобождение посадочной полосы посаженным рейсом
    private static final int timeUntilFreeRunway = 5;

    private final HomeAirport homeAirport;
    private final FlightRepository flightRepository;
    private final RunwayRepository runwayRepository;
    private final ClientsNotification clientsNotification;

	public ArrivalsDispatcher(HomeAirport homeAirport, FlightRepository flightRepository, RunwayRepository runwayRepository, ClientsNotification clientsNotification) {
        this.homeAirport = homeAirport;
		this.flightRepository = flightRepository;
        this.runwayRepository = runwayRepository;
        this.clientsNotification = clientsNotification;
	}

    @Scheduled(initialDelay = 3000, fixedRate = 500)
    @Transactional
    public void Dispatch() {
        LocalDateTime localDateTime = homeAirport.getLocalDateTime();
        // Проверим, освободились ли полосы, занятые посаженными рейсами (и освободим их, если можно)
        runwayRepository.checkAndClearReservations(localDateTime);
        // Проверим, закончили ли садящиеся рейсы посадку
        List<Flight> flights = flightRepository.getFlights(FlightStatus.Landing, localDateTime);
        if (flights.size() > 0) {
            flights.forEach(flight -> {
                flight.setStatus(FlightStatus.Landed);
//                flight.setActualArrivalTime(localDateTime);
                flightRepository.update(flight);
                // Уведомляем клиентов
                clientsNotification.notifyClients(flight);
//                System.out.println(Utils.formatDateTime(localDateTime) + ": " + flight + " has landed!");
            });
        }
        // Найдём все рейсы, ожидающие свободной полосы, попробуем направить их на свободные полосы
        flights = flightRepository.getFlights(FlightStatus.AwaitingRunway, localDateTime);
        if (flights.size() > 0) {
            flights.forEach(flight -> {
                Runway runway = null;
                try {
                    runway = runwayRepository.getSuitableRunway(flight.getAircraft());
                }
                catch (NoRunwayFoundException e) {
                    // Не получилось найти полосу для борта... штош, пусть ждёт дальше
                }
                if (runway != null) {
                    // Нашли полосу
                    // Резервируем её
                    LocalDateTime reserveUntil = localDateTime.plusMinutes(timeToLand + timeUntilFreeRunway);
                    runway.reserve(flight, reserveUntil);
                    runwayRepository.update(runway);
                    // И переводим рейс в состояние "Landing" с установкой точного времени посадки
                    LocalDateTime landingAt = localDateTime.plusMinutes(timeToLand);
                    flight.setActualArrivalTime(landingAt);
                    flight.setStatus(FlightStatus.Landing);
                    flight.setRunwayNum(runway.getRandomDirName());
                    flightRepository.update(flight);
                    // Уведомляем клиентов
                    clientsNotification.notifyClients(flight);
//                    System.out.println(Utils.formatDateTime(localDateTime) + ": " + flight + " has finished waiting and is landing at " + runway.getFullName());
                }
            });
        }
        // Попытаемся направить на посадку подходящие подлетающие рейсы
        flights = flightRepository.getFlights(FlightStatus.InFlight, localDateTime);
        if (flights.size() > 0) {
            flights.forEach(flight -> {
                Runway runway = null;
                try {
                    runway = runwayRepository.getSuitableRunway(flight.getAircraft());
                }
                catch (NoRunwayFoundException e) {
                    // Не получилось найти полосу для борта... переводим его в состояние "AwaitingRunway"
                    flight.setStatus(FlightStatus.AwaitingRunway);
                    flightRepository.update(flight);
                    // Уведомляем клиентов
                    clientsNotification.notifyClients(flight);
//                    System.out.println(Utils.formatDateTime(localDateTime) + ": " + flight + " is delayed");
                }
                if (runway != null) {
                    // Нашли полосу
                    // Резервируем её
                    LocalDateTime reserveUntil = localDateTime.plusMinutes(timeUntilFreeRunway);
                    runway.reserve(flight, reserveUntil);
                    runwayRepository.update(runway);
                    // И переводим рейс в состояние "Landing"
                    flight.setStatus(FlightStatus.Landing);
                    flight.setRunwayNum(runway.getRandomDirName());
                    flightRepository.update(flight);
                    // Уведомляем клиентов
                    clientsNotification.notifyClients(flight);
//                    System.out.println(Utils.formatDateTime(localDateTime) + ": " + flight + " is landing at " + runway.getFullName());
                }
            });
        }
    }
}
