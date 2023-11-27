package edu.spring.dao;

import edu.spring.domain.Aircraft;

public interface AircraftDao {
    int getMaxMass();

    int getMaxTakeoffRun();

    int getMaxRange();

    Aircraft getById(int id);

    Aircraft getRandomAircraft(int minRange);
}
