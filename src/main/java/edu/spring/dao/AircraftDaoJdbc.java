package edu.spring.dao;

import org.springframework.jdbc.core.RowMapper;
import org.springframework.jdbc.core.namedparam.NamedParameterJdbcOperations;
import org.springframework.stereotype.Repository;
import edu.spring.domain.Aircraft;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Collections;
import java.util.List;
import java.util.Map;

@SuppressWarnings({"SqlNoDataSourceInspection", "ConstantConditions", "SqlDialectInspection"})
@Repository
public class AircraftDaoJdbc implements AircraftDao {
    private final NamedParameterJdbcOperations namedPJdbcOps;

    public AircraftDaoJdbc(NamedParameterJdbcOperations namedPJdbcOps) {
        this.namedPJdbcOps = namedPJdbcOps;
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

    @Override
    public Aircraft getById(int id) {
        Map<String, Object> params = Collections.singletonMap("id", id);
        return namedPJdbcOps.queryForObject(
                "select * from aircraft where id = :id",
                params,
                new AircraftMapper()
        );
    }

    @Override
    public Aircraft getRandomAircraft(int minRange) {
        Map<String, Object> params = Collections.singletonMap("minRange", minRange);
        List<Aircraft> aircrafts = namedPJdbcOps.query(
                "select * from aircraft where range >= :minRange order by random() limit 1",
                params,
                new AircraftMapper()
        );
        if (aircrafts.size() > 0) {
            return aircrafts.get(0);
        }
        else {
            throw new NoAircraftFoundException("Не найдено самолёта с необходимой дальностью полёта");
        }
    }

    private static class AircraftMapper implements RowMapper<Aircraft> {
        @Override
        public Aircraft mapRow(ResultSet resultSet, int i) throws SQLException {
            int id = resultSet.getInt("id");
            String icaoCode = resultSet.getString("icao_code");
            String model = resultSet.getString("model");
            int range = resultSet.getInt("range");
            int speed = resultSet.getInt("speed");
            int mass = resultSet.getInt("mass");
            int landingRun = resultSet.getInt("landing_run");
            int takeoffRun = resultSet.getInt("takeoff_run");
            int passengers = resultSet.getInt("passengers");
            Aircraft result = new Aircraft(icaoCode, model, range, speed, mass, landingRun, takeoffRun, passengers);
            result.setId(id);
            return result;
        }
    }
}
