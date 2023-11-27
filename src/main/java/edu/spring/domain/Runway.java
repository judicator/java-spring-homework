package edu.spring.domain;

import lombok.Getter;
import lombok.Setter;

import java.time.LocalDateTime;
import java.util.Random;

@Getter
public class Runway {
    private static final int minLength = 1500;
    private static final int maxLength = 3600;
    private static final int minAircraftMass = 70;
    private static final int maxAircraftMass = 400;

    @Setter
    private Integer id;
    // Наименование полосы при использовании в основном направлении
    private String nameDir1;
    // Наименование полосы при использовании в обратном направлении
    private String nameDir2;
    // Является ли ВВП главной (главная полоса способна принять любой борт)
    private boolean isMain;
    // Длина полосы (в метрах)
    private int length;
    // Максимальная допустимая масса садящегося самолёта (в метрических тоннах)
    private int allowedAircraftMass;
    // Рейс, под приём которого зарезервирована полоса
    private Flight reservedFor;
    // Время, до которого зарезервирована полоса
    private LocalDateTime reservedUntil;

    public Runway(String nameDir1, String nameDir2, boolean isMain, int length, int allowedAircraftMass, Flight reservedFor, LocalDateTime reservedUntil) {
        this.id = null;
        this.nameDir1 = nameDir1;
        this.nameDir2 = nameDir2;
        this.isMain = isMain;
        this.length = length;
        this.allowedAircraftMass = allowedAircraftMass;
        this.reservedFor = reservedFor;
        this.reservedUntil = reservedUntil;
    }

    public Runway(String nameDir1, String nameDir2, boolean isMain, int length, int allowedAircraftMass) {
        this(nameDir1, nameDir2, isMain, length, allowedAircraftMass, null, null);
    }

    public static Runway factory(char postfixDir1, char postfixDir2, boolean isMain) {
        int oppositeDir;
        Random rnd = new Random();
        int num = rnd.nextInt(36) + 1;
        String nameDir1 = String.format("%02d", num) + postfixDir1;
        if (num > 18) {
            oppositeDir = num - 18;
        }
        else {
            oppositeDir = num + 18;
        }
        String nameDir2 = String.format("%02d", oppositeDir) + postfixDir2;
        int length = 0;
        int allowedAircraftMass = 0;
        if (isMain) {
            // Основная полоса может принять любой борт
            length = maxLength;
            allowedAircraftMass = maxAircraftMass;
        }
        else {
            // Случайная длина полосы и допустимая масса самолёта
            length = rnd.nextInt(maxLength - minLength + 1) + minLength;
            allowedAircraftMass = rnd.nextInt(maxAircraftMass - minAircraftMass + 1) + minAircraftMass;
        }
        return new Runway(nameDir1, nameDir2, isMain, length, allowedAircraftMass);
    }

    public String getFullName() {
        return nameDir1 + "/" + nameDir2;
    }

    public boolean isReserved() {
        if (reservedUntil != null) {
            return true;
        }
        return false;
    }

    public boolean isReservedForFlight(Flight flight) {
        if (reservedFor != null) {
            return (reservedFor.getId() == flight.getId());
        }
        return false;
    }

    public void reserve(Flight flight, LocalDateTime reserveUntil) {
        reservedFor = flight;
        reservedUntil = reserveUntil;
    }

    public void clearReservation() {
        reservedFor = null;
        reservedUntil = null;
    }

    public String getRandomDirName() {
        Random rnd = new Random();
        if (rnd.nextInt(2) < 1) {
            return nameDir1;
        }
        return nameDir2;
    }

    public String toString() {
        return getFullName() + " (length: " + getLength() + " m, max allowed aircraft mass: " + getAllowedAircraftMass() + " t)";
    }
}
