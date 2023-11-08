package edu.spring.dao;

import edu.spring.domain.Airport;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.jdbc.core.namedparam.NamedParameterJdbcOperations;
import org.springframework.stereotype.Repository;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Collections;
import java.util.List;
import java.util.Map;

@Repository
public class AirportDaoJdbs implements AirportDao {
    private final NamedParameterJdbcOperations namedParameterJdbcOperations;

    public AirportDaoJdbs(NamedParameterJdbcOperations namedParameterJdbcOperations) {
        this.namedParameterJdbcOperations = namedParameterJdbcOperations;
    }

    @Override
    public int count() {
        return namedParameterJdbcOperations.queryForObject("select count(*) from airport", Collections.EMPTY_MAP, Integer.class);
    }

    @Override
    public Airport getRandomHomeAirport() {
        List<Airport> origins = namedParameterJdbcOperations.query("select * from airport order by random() limit 1", Collections.EMPTY_MAP, new AirportMapper());
        return origins.get(0);
    }

    @Override
    public Airport getFlightRandomOrigin(Airport home) {
        Map<String, Object> params = Collections.singletonMap("homeMunicipality", home.getMunicipality());
        List<Airport> origins = namedParameterJdbcOperations.query("select * from airport where municipality <> :homeMunicipality order by random() limit 1", params, new AirportMapper());
        return origins.get(0);
    }

    private static class AirportMapper implements RowMapper<Airport> {
        @Override
        public Airport mapRow(ResultSet resultSet, int i) throws SQLException {
            int id = resultSet.getInt("id");
            String name = resultSet.getString("name");
            String isoCountry = resultSet.getString("iso_country");
            String municipality = resultSet.getString("municipality");
            String iataCode = resultSet.getString("iata_code");
            return new Airport(id, name, isoCountry, municipality, iataCode);
        }
    }
}
