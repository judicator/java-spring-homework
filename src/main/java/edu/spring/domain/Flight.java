package edu.spring.domain;

import edu.spring.utils.Utils;
import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.time.LocalDateTime;

@Getter
@Setter
@Entity
@NoArgsConstructor
@AllArgsConstructor
@Table(name = "flight")
public class Flight {
    @Id
    @GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "flight_id")
    @SequenceGenerator(name = "flight_id", sequenceName = "flight_id", allocationSize = 1)
    private Integer id;

    // Код рейса
    @Column(nullable = false)
    private String code;

    // Название авиакомпании
    @Column(nullable = false)
    private String company;

    // Самолёт
    @OneToOne(optional = false)
    @JoinColumn(name = "aircraft", referencedColumnName = "id")
    private Aircraft aircraft;

    // Состояние рейса
    @Enumerated(EnumType.STRING)
    private FlightStatus status;

    // Аэропорт вылета
    @OneToOne(optional = false)
    @JoinColumn(name = "origin", referencedColumnName = "id")
    private Airport origin;

    // Дата/время прибытия по расписанию
    @Column(name = "scheduled_arrival_time", nullable = false)
    private LocalDateTime scheduledArrivalTime;

    // Реальные дата/время прибытия
    @Column(name = "actual_arrival_time", nullable = false)
    private LocalDateTime actualArrivalTime;

    // Номер полосы для посадки
    @Column(name = "runway_num")
    private String runwayNum;

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
