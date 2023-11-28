package edu.spring.dao;

import edu.spring.domain.*;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.jdbc.core.namedparam.NamedParameterJdbcOperations;
import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Repository
public class ClientToNotifyDaoJdbc implements ClientToNotifyDao {
    private final NamedParameterJdbcOperations namedPJdbcOps;
    private static FlightDao flightDao;

    public ClientToNotifyDaoJdbc(NamedParameterJdbcOperations namedPJdbcOps, FlightDao flightDao) {
        this.namedPJdbcOps = namedPJdbcOps;
        ClientToNotifyDaoJdbc.flightDao = flightDao;
    }

    @Override
    public int insert(ClientToNotify client) {
        int newId = namedPJdbcOps.queryForObject("select nextval('client_to_notify_id')", Collections.EMPTY_MAP, Integer.class);
        Map<String, Object> params = new HashMap<>();
        params.put("id", newId);
        params.put("flight_id", client.getFlight().getId());
        params.put("phone_num", client.getPhoneNum());
        params.put("email", client.getEmail());
        namedPJdbcOps.update(
                "insert into client_to_notify(id, flight_id, phone_num, email) " +
                        "values (:id, :flight_id, :phone_num, :email)",
                params
        );
        return newId;
    }

    @Override
    public void update(ClientToNotify client) {
        Map<String, Object> params = new HashMap<>();
        params.put("id", client.getId());
        params.put("flight_id", client.getFlight().getId());
        params.put("phone_num", client.getPhoneNum());
        params.put("email", client.getEmail());
        namedPJdbcOps.update(
                "update client_to_notify set flight_id = :flight_id, phone_num = :phone_num, email = :email where id = :id",
                params
        );
    }

    @Override
    public List<ClientToNotify> getClientsList(Flight flight) {
        Map<String, Object> params = Collections.singletonMap("flight_id", flight.getId());
        return namedPJdbcOps.query(
                "select * from client_to_notify where flight_id = :flight_id",
                params,
                new ClientToNotifyDaoJdbc.ClientToNotifyMapper()
        );
    }

    private static class ClientToNotifyMapper implements RowMapper<ClientToNotify> {
        @Override
        public ClientToNotify mapRow(ResultSet resultSet, int i) throws SQLException {
            int id = resultSet.getInt("id");
            String phoneNum = resultSet.getString("phone_num");
            String email = resultSet.getString("email");
            Flight flight = flightDao.getById(resultSet.getInt("flight_id"));
            ClientToNotify result = new ClientToNotify(flight, phoneNum, email);
            result.setId(id);
            return result;
        }
    }
}
