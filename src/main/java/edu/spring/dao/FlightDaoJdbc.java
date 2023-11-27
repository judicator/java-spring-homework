package edu.spring.dao;

import edu.spring.domain.Airport;
import edu.spring.domain.Aircraft;
import edu.spring.domain.Flight;
import edu.spring.domain.FlightStatus;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.jdbc.core.namedparam.NamedParameterJdbcOperations;
import org.springframework.stereotype.Service;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDateTime;
import java.util.*;

@SuppressWarnings({"SqlNoDataSourceInspection", "ConstantConditions", "SqlDialectInspection"})
@Service
public class FlightDaoJdbc implements FlightDao {
    // Разница в минутах между текущим временем и временем прибытия рейса по расписанию,
    // в течение которой рейс считается прибывающим, и под него ищется полоса
    private static final int arrivesInMinutes = 15;

    private final NamedParameterJdbcOperations namedPJdbcOps;
    static AircraftDao aircraftDao;
    static AirportDao airportDao;

    public FlightDaoJdbc(NamedParameterJdbcOperations namedPJdbcOps, AircraftDao aircraftDao, AirportDao airportDao) {
        this.namedPJdbcOps = namedPJdbcOps;
        FlightDaoJdbc.aircraftDao = aircraftDao;
        FlightDaoJdbc.airportDao = airportDao;
    }

    @Override
    public Flight getById(int id) {
        Map<String, Object> params = Collections.singletonMap("id", id);
        return namedPJdbcOps.queryForObject("select * from flight where id = :id", params, new FlightMapper());
    }

    @Override
    public String getRandomAirline() {
        return namedPJdbcOps.queryForObject(
            "select name from airline order by random() limit 1",
            Collections.EMPTY_MAP,
            String.class
        );
    }

    @Override
    public int insert(Flight flight) {
        int newId = namedPJdbcOps.queryForObject("select nextval('flight_id')", Collections.EMPTY_MAP, Integer.class);
        Map<String, Object> params = new HashMap<>();
        params.put("id", newId);
        params.put("code", flight.getCode());
        params.put("company", flight.getCompany());
        params.put("aircraft", flight.getAircraft().getId());
        params.put("status", flight.getStatus().toString());
        params.put("origin", flight.getOrigin().getId());
        params.put("scheduled_arrival_time", flight.getScheduledArrivalTime());
        params.put("actual_arrival_time", flight.getActualArrivalTime());
        params.put("runway_num", null);
        namedPJdbcOps.update(
            "insert into flight(id, code, company, aircraft, status, origin, scheduled_arrival_time, actual_arrival_time, runway_num) " +
            "values (:id, :code, :company, :aircraft, :status, :origin, :scheduled_arrival_time, :actual_arrival_time, :runway_num)",
            params
        );
        return newId;
    }

    @Override
    public void update(Flight flight) {
        Map<String, Object> params = new HashMap<>();
        params.put("id", flight.getId());
        params.put("scheduled_arrival_time", flight.getScheduledArrivalTime());
        params.put("actual_arrival_time", flight.getActualArrivalTime());
        params.put("status", flight.getStatus().toString());
        params.put("runway_num", flight.getRunwayNum());
        namedPJdbcOps.update(
            "update flight set status = :status, scheduled_arrival_time = :scheduled_arrival_time, " +
                    "actual_arrival_time = :actual_arrival_time, runway_num = :runway_num where id = :id",
            params
        );
    }

    @Override
    public List<Flight> getFlights(FlightStatus status, LocalDateTime localDateTime) {
        Map<String, Object> params = new HashMap<>();
        params.put("status", status.toString());
        switch (status) {
            case Landing:
                // Поиск садящихся рейсов, которые должны сесть на момент localDateTime
                params.put("timestamp", localDateTime);
                return namedPJdbcOps.query(
                        "select * from flight where status = :status and actual_arrival_time <= :timestamp",
                        params,
                        new FlightMapper()
                );
            case InFlight:
                // Список прибывающих рейсов, которые нужно отправлять на посадку
                LocalDateTime arrivesAfter = localDateTime.plusMinutes(arrivesInMinutes);
                params.put("timestamp1", localDateTime);
                params.put("timestamp2", arrivesAfter);
                return namedPJdbcOps.query(
                        "select * from flight where status in ('OnTime', 'Delayed') and " +
                                "actual_arrival_time between :timestamp1 and :timestamp2 order by scheduled_arrival_time",
                        params,
                        new FlightMapper()
                );
            default:
                return namedPJdbcOps.query(
                        "select * from flight where status = :status order by scheduled_arrival_time",
                        params,
                        new FlightMapper()
                );
        }
    }

    public List<Flight> getFlightsForDashboard(LocalDateTime localDateTime) {
        LocalDateTime oldLandedAfter = localDateTime.plusMinutes(-20);
        Map<String, Object> params = Collections.singletonMap("timestamp", oldLandedAfter);
        return namedPJdbcOps.query(
            "select * from flight where status not in ('Landed', 'Rerouted') union " +
            "select * from flight where status = 'Landed' and actual_arrival_time >= :timestamp order by scheduled_arrival_time",
            params,
            new FlightMapper()
        );
    }

    @Override
    public int getActiveFlightsCount(LocalDateTime localDateTime) {
        LocalDateTime oldLandedAfter = localDateTime.plusMinutes(-5);
        Map<String, Object> params = Collections.singletonMap("timestamp", oldLandedAfter);
        return namedPJdbcOps.queryForObject(
                "select count(id) from (select * from flight where status not in ('Landed', 'Rerouted') union " +
                        "select * from flight where status = 'Landed' and actual_arrival_time >= :timestamp)",
                params,
                Integer.class
        );
    }

    private static class FlightMapper implements RowMapper<Flight> {
        @Override
        public Flight mapRow(ResultSet resultSet, int i) throws SQLException {
            int id = resultSet.getInt("id");
            String code = resultSet.getString("code");
            String company = resultSet.getString("company");
            Aircraft aircraft = aircraftDao.getById(resultSet.getInt("aircraft"));
            Airport origin = airportDao.getById(resultSet.getInt("origin"));
            FlightStatus status;
            try {
                status = FlightStatus.valueOf(resultSet.getString("status"));
            }
            catch (Exception e) {
                status = FlightStatus.OnTime;
            }
            LocalDateTime scheduledArrivalTime = resultSet.getObject("scheduled_arrival_time", LocalDateTime.class);
            LocalDateTime actualArrivalTime = resultSet.getObject("actual_arrival_time", LocalDateTime.class);
            String runwayNum = resultSet.getString("runway_num");
            Flight result = new Flight(code, company, aircraft, origin, status, scheduledArrivalTime, actualArrivalTime, runwayNum);
            result.setId(id);
            return result;
        }
    }
}
