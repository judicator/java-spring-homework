package edu.spring.domain;

import edu.spring.utils.Utils;
import lombok.Getter;
import lombok.Setter;

import java.time.LocalDateTime;

@Getter
@Setter
public class Flight {
    private Integer id;
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
    // Дата/время прибытия по расписанию
    private LocalDateTime scheduledArrivalTime;
    // Реальные дата/время прибытия
    private LocalDateTime actualArrivalTime;
    // Номер полосы для посадки
    private String runwayNum;

    public Flight(String code, String company, Aircraft aircraft, Airport origin, FlightStatus status, LocalDateTime scheduledArrivalTime, LocalDateTime actualArrivalTime, String runwayNum) {
        this.id = null;
        this.code = code;
        this.company = company;
        this.aircraft = aircraft;
        this.origin = origin;
        this.status = status;
        this.scheduledArrivalTime = scheduledArrivalTime;
        this.actualArrivalTime = actualArrivalTime;
        this.runwayNum = runwayNum;
    }

    public String toString() {
        return getCode() + " (" + getCompany() + ") from " + getOrigin();
    }

    public String arrivalTimeForDashboard() {
        switch (status) {
            case Delayed:
                return "Delayed until " + Utils.formatTime(actualArrivalTime);
            default:
                return Utils.formatTime(actualArrivalTime);
        }
    }

    public String statusForDashboard() {
        switch (status) {
            case Landed:
                return "Landed at " + Utils.formatTime(actualArrivalTime) + " (runway " + runwayNum + ")";
            case Landing:
                return "Landing (runway " + runwayNum + ")";
            case AwaitingRunway:
                return "Delayed";
            default:
                return "";
        }
    }
}
