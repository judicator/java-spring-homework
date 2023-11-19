package edu.spring.domain;

import lombok.Getter;
import lombok.Setter;

import java.time.LocalDateTime;
import java.time.ZoneId;

@Getter
@Setter
public class Flight {
    private int id;
    // Код рейса
    private String code;
    // Название авиакомпании
    private String company;
    // Самолёт
    private Aircraft aircraft;
    // Состояние рейса
    private FlightStatus status;
    // Аэропорт вылета
    private Airport origin;
    // Дата/время вылета
    private LocalDateTime departedAt;
    // Дата/время прибытия по расписанию
    private LocalDateTime scheduledArrivalTime;
    // Реальные дата/время прибытия
    private LocalDateTime actualArrivalTime;

    public Flight(int id, String code, String company, Aircraft aircraft, Airport origin, LocalDateTime departedAt) {
        this.id = id;
        this.code = code;
        this.company = company;
        this.aircraft = aircraft;
        this.origin = origin;
        this.departedAt = departedAt;
        this.status = FlightStatus.OnSchedule;
    }

    public Flight(int id, String code, String company, Aircraft aircraft, Airport origin) {
        this(id, code, company, aircraft, origin, LocalDateTime.now(ZoneId.of(origin.getTimeZone())));
    }
}
