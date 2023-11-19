package edu.spring.services;

import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Service;

@Service
public class FlightGenerator {
    // Примерное время в минутах с момента взлёта до выхода на эшелон
    private static final int minutesUntilCruise = 20;
    // Примерное время в минутах с момента начала снижения до посадки
    private static final int minutesUntilLandings = 20;
    // Примерное время в минутах на посадку/дозаправку/смену экипажа/взлёт в промежуточном аэропорту
    private static final int minutesForRefueling = 80;

    public FlightGenerator(HomeAirport homeAirport) {

    }

    @Scheduled(fixedRate = 1000)
    public void CreateRandomFlight() {

    }
}
