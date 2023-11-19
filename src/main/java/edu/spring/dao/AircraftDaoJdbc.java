package edu.spring.dao;

import org.springframework.jdbc.core.namedparam.NamedParameterJdbcOperations;
import org.springframework.stereotype.Repository;

import java.awt.geom.Point2D;
import java.util.Collections;

@Repository
public class AircraftDaoJdbc implements AircraftDao {
    private final NamedParameterJdbcOperations namedPJdbcOps;

    public AircraftDaoJdbc(NamedParameterJdbcOperations namedParameterJdbcOperations) {
        this.namedPJdbcOps = namedParameterJdbcOperations;
    }

    @Override
    public int getMaxMass() {
        return namedPJdbcOps.queryForObject("select max(mass) from aircraft", Collections.EMPTY_MAP, Integer.class);
    }

    @Override
    public int getMaxTakeoffRun() {
        return namedPJdbcOps.queryForObject("select max(takeoff_run) from aircraft", Collections.EMPTY_MAP, Integer.class);
    }

    @Override
    public int getMaxRange() {
        return namedPJdbcOps.queryForObject("select max(range) from aircraft", Collections.EMPTY_MAP, Integer.class);
    }
}
