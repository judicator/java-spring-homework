package edu.spring.dao;

import edu.spring.domain.Aircraft;
import edu.spring.domain.Flight;
import edu.spring.domain.Runway;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.jdbc.core.namedparam.NamedParameterJdbcOperations;
import org.springframework.stereotype.Repository;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDateTime;
import java.util.*;

@SuppressWarnings({"SqlNoDataSourceInspection", "ConstantConditions", "SqlDialectInspection"})
@Repository
public class RunwayDaoJdbc implements RunwayDao {
    private final NamedParameterJdbcOperations namedPJdbcOps;
    private static FlightDao flightDao;

    public RunwayDaoJdbc(NamedParameterJdbcOperations namedPJdbcOps, FlightDao flightDao) {
        this.namedPJdbcOps = namedPJdbcOps;
        RunwayDaoJdbc.flightDao = flightDao;
    }

    @Override
    public Runway getById(int id) {
        Map<String, Object> params = Collections.singletonMap("id", id);
        return namedPJdbcOps.queryForObject(
                "select * from runway where id = :id",
                params,
                new RunwayMapper()
        );
    }

    @Override
    public List<Runway> getAll() {
        return namedPJdbcOps.query(
                "select * from runway order by id",
                Collections.EMPTY_MAP,
                new RunwayMapper()
        );
    }

    @Override
    public int insert(Runway runway) {
        int newId = namedPJdbcOps.queryForObject(
                "select nextval('runway_id')",
                Collections.EMPTY_MAP,
                Integer.class
        );
        Map<String, Object> params = new HashMap<>();
        params.put("id", newId);
        params.put("name_dir1", runway.getNameDir1());
        params.put("name_dir2", runway.getNameDir2());
        params.put("is_main", runway.isMain());
        params.put("length", runway.getLength());
        params.put("allowed_aircraft_mass", runway.getAllowedAircraftMass());
        namedPJdbcOps.update(
                "insert into runway (id, name_dir1, name_dir2, is_main, length, allowed_aircraft_mass, reserved_for, reserved_until) " +
                        "values (:id, :name_dir1, :name_dir2, :is_main, :length, :allowed_aircraft_mass, null, null)",
                params
        );
        return newId;
    }

    @Override
    public void update(Runway runway) {
        Map<String, Object> params = new HashMap<>();
        params.put("id", runway.getId());
        if (runway.getReservedFor() == null) {
            params.put("reserved_for", null);
        } else {
            params.put("reserved_for", runway.getReservedFor().getId());
        }
        if (runway.getReservedUntil() == null) {
            params.put("reserved_until", null);
        } else {
            params.put("reserved_until", runway.getReservedUntil());
        }
        namedPJdbcOps.update(
                "update runway set reserved_for = :reserved_for, reserved_until = :reserved_until where id = :id",
                params
        );
    }

    @Override
    public void checkAndClearReservations(LocalDateTime localDateTime) {
        Map<String, Object> params = Collections.singletonMap("timestamp", localDateTime);
        namedPJdbcOps.update(
                "update runway set reserved_for = null, reserved_until = null " +
                        "where reserved_for in (select id from flight where (status = 'Landed' and reserved_until <= :timestamp) or status = 'Rerouted')",
                params
        );
    }

    @Override
    public Runway getSuitableRunway(Aircraft aircraft) throws NoRunwayFoundException {
        Map<String, Object> params = new HashMap<>();
        params.put("minAllowedMass", aircraft.getMass());
        params.put("minLength", aircraft.getLandingRun());
        List<Runway> runways = namedPJdbcOps.query(
                "select * from runway where reserved_for is null and reserved_until is null " +
                        "and length >= :minLength and allowed_aircraft_mass >= :minAllowedMass order by is_main desc, random()",
                params,
                new RunwayMapper()
        );
        if (runways.size() > 0) {
            return runways.get(0);
        } else {
            throw new NoRunwayFoundException("Подходящая для посадки свободная полоса не найдена");
        }
    }

    private static class RunwayMapper implements RowMapper<Runway> {
        @Override
        public Runway mapRow(ResultSet resultSet, int i) throws SQLException {
            int id = resultSet.getInt("id");
            String nameDir1 = resultSet.getString("name_dir1");
            String nameDir2 = resultSet.getString("name_dir2");
            boolean isMain = resultSet.getBoolean("is_main");
            int length = resultSet.getInt("length");
            int allowedAircraftMass = resultSet.getInt("allowed_aircraft_mass");
            Integer reservedForId = resultSet.getInt("reserved_for");
            Flight reservedFor = null;
            if (reservedForId != 0) {
                reservedFor = flightDao.getById(reservedForId);
            }
            LocalDateTime reservedUntil = resultSet.getObject("reserved_until", LocalDateTime.class);
            Runway result = new Runway(nameDir1, nameDir2, isMain, length, allowedAircraftMass, reservedFor, reservedUntil);
            result.setId(id);
            return result;
        }
    }
}
