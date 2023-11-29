package edu.spring.domain;

import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Entity
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Table(name = "aircraft")
public class Aircraft {
    @Id
    @GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "aircraft_id")
    @SequenceGenerator(name = "aircraft_id", sequenceName = "aircraft_id", allocationSize = 1)
    private Integer id;

    // ICAO designator (код модели) (4 символа)
    @Column(name = "icao_code", nullable = false, unique = true)
    private String icaoCode;

    // Название модели
    @Column(nullable = false, unique = true)
    private String model;

    // Дальность полёта (в морских милях)
    @Column(nullable = false)
    private int range;

    // Скорость на эшелоне (в узлах)
    @Column(nullable = false)
    private int speed;

    // MTOW (максимальная взлётная масса) (в метрических тоннах)
    @Column(nullable = false)
    private int mass;

    // Пробег при посадке (в метрах)
    @Column(name = "landing_run", nullable = false)
    private int landingRun;

    // Пробег при взлёте (в метрах)
    @Column(name = "takeoff_run", nullable = false)
    private int takeoffRun;

    // Максимальное кол-во пассажиров
    private int passengers;

    public String toString() {
        return "[" + getIcaoCode() + "] " + getModel();
    }
}
