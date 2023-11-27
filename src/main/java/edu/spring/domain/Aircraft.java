package edu.spring.domain;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class Aircraft {
    private Integer id;
    // ICAO designator (код модели) (4 символа)
    private String icaoCode;
    // Название модели
    private String model;
    // Дальность полёта (в морских милях)
    private int range;
    // Скорость на эшелоне (в узлах)
    private int speed;
    // MTOW (максимальная взлётная масса) (в метрических тоннах)
    private int mass;
    // Пробег при посадке (в метрах)
    private int landingRun;
    // Пробег при взлёте (в метрах)
    private int takeoffRun;
    // Максимальное кол-во пассажиров
    private int passengers;

    public Aircraft(String icaoCode, String model, int range, int speed, int mass, int landingRun, int takeoffRun, int passengers) {
        this.id = null;
        this.icaoCode = icaoCode;
        this.model = model;
        this.range = range;
        this.speed = speed;
        this.mass = mass;
        this.landingRun = landingRun;
        this.takeoffRun = takeoffRun;
        this.passengers = passengers;
    }

    public String toString() {
        return "[" + getIcaoCode() + "] " + getModel();
    }
}
