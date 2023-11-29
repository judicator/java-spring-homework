package edu.spring.repository;

import edu.spring.domain.Aircraft;

public interface AircraftRepository {
    int getMaxMass();

    int getMaxTakeoffRun();

    int getMaxRange();

    Aircraft getById(int id);

    Aircraft getRandomAircraft(int minRange);
}
