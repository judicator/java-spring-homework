package edu.spring.dao;

import edu.spring.domain.Flight;
import org.springframework.jdbc.core.namedparam.NamedParameterJdbcOperations;
import org.springframework.stereotype.Service;

import java.awt.geom.Point2D;
import java.util.Collections;

@Service
public class FlightDaoJdbc implements FlightDao {
    private final NamedParameterJdbcOperations namedPJdbcOps;

    public FlightDaoJdbc(NamedParameterJdbcOperations namedParameterJdbcOperation) {
        this.namedPJdbcOps = namedParameterJdbcOperation;
    }

    @Override
    public String getRandomAirline() {
        return namedPJdbcOps.queryForObject("select name from airline order by random() limit 1", Collections.EMPTY_MAP, String.class);
    }

    @Override
    public Flight createRandomFlight(int maxDistance, Point2D destinationCoords) {
        return null;
    }
}
