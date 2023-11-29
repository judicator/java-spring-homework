package edu.spring.domain;

import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.time.LocalDateTime;
import java.util.Random;

@Getter
@Entity
@Table(name = "runway")
@NoArgsConstructor
@AllArgsConstructor
public class Runway {
    private static final int minLength = 1500;
    private static final int maxLength = 3600;
    private static final int minAircraftMass = 70;
    private static final int maxAircraftMass = 400;

    @Setter
    @Id
    @GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "runway_id")
    @SequenceGenerator(name = "runway_id", sequenceName = "runway_id", allocationSize = 1)
    @OrderBy
    private Integer id;

    // Наименование полосы при использовании в основном направлении
    @Column(name = "name_dir1", nullable = false)
    private String nameDir1;

    // Наименование полосы при использовании в обратном направлении
    @Column(name = "name_dir2", nullable = false)
    private String nameDir2;

    // Является ли ВВП главной (главная полоса способна принять любой борт)
    @Column(name = "is_main", nullable = false)
    private boolean isMain;

    // Длина полосы (в метрах)
    @Column(nullable = false)
    private int length;

    // Максимальная допустимая масса садящегося самолёта (в метрических тоннах)
    @Column(name = "allowed_aircraft_mass", nullable = false)
    private int allowedAircraftMass;

    // Рейс, под приём которого зарезервирована полоса
    @OneToOne
    @JoinColumn(name = "reserved_for", referencedColumnName = "id")
    private Flight reservedFor;

    // Время, до которого зарезервирована полоса
    @Column(name = "reserved_until")
    private LocalDateTime reservedUntil;

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
        return new Runway(null, nameDir1, nameDir2, isMain, length, allowedAircraftMass, null, null);
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
