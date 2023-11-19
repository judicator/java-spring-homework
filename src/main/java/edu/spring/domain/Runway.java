package edu.spring.domain;

import lombok.Getter;
import lombok.Setter;

import java.util.Random;

@Getter
@Setter
public class Runway {
    private static final int minLength = 1500;
    private static final int maxLength = 3600;
    private static final int minAircraftMass = 70;
    private static final int maxAircraftMass = 400;

    // Длина полосы (в метрах)
    private int length;
    // Максимальная допустимая масса садящегося самолёта (в метрических тоннах)
    private int allowedAircraftMass;
    // Рейс, под приём которого зарезервирована полоса
    private Flight reservedFor;

    // Наименование полосы при использовании в основном направлении
    private String nameDir1;
    // Наименование полосы при использовании в обратном направлении
    private String nameDir2;

    public Runway(int runwayNum, char postfixDir1, char postfixDir2) {
        int oppositeDir;
        Random rnd = new Random();
        nameDir1 = String.format("%02d", runwayNum) + postfixDir1;
        if (runwayNum > 18) {
            oppositeDir = runwayNum - 18;
        }
        else {
            oppositeDir = runwayNum + 18;
        }
        nameDir2 = String.format("%02d", oppositeDir) + postfixDir2;
        // Случайная длина полосы и допустимая масса самолёта
        length = rnd.nextInt(maxLength - minLength + 1) + minLength;
        allowedAircraftMass = rnd.nextInt(maxAircraftMass - minAircraftMass + 1) + minAircraftMass;
    }

    public String getFullName() {
        return nameDir1 + "/" + nameDir2;
    }
}
