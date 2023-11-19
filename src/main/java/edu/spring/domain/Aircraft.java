package edu.spring.domain;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class Aircraft {
    private final int id;
    // ICAO designator (код модели) (4 символа)
    private final String icaoCode;
    // Название модели
    private final String model;
    // Дальность полёта (в морских милях)
    private final int range;
    // Скорость на эшелоне (в узлах)
    private final int speed;
    // MTOW (максимальная взлётная масса) (в метрических тоннах)
    private final int mass;
    // Пробег при посадке (в метрах)
    private final int landingRun;
    // Пробег при взлёте (в метрах)
    private final int takeoffRun;

    public Aircraft(int id, String icaoCode, String model, int range, int speed, int mass, int landingRun, int takeoffRun) {
        this.id = id;
        this.icaoCode = icaoCode;
        this.model = model;
        this.range = range;
        this.speed = speed;
        this.mass = mass;
        this.landingRun = landingRun;
        this.takeoffRun = takeoffRun;
    }
}
