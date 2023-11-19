package edu.spring.dao;

import edu.spring.domain.Airport;
import org.postgresql.geometric.PGpoint;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.jdbc.core.namedparam.NamedParameterJdbcOperations;
import org.springframework.stereotype.Repository;

import java.awt.geom.Point2D;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Collections;
import java.util.List;
import java.util.Map;

@SuppressWarnings({"SqlNoDataSourceInspection", "ConstantConditions", "SqlDialectInspection"})
@Repository
public class AirportDaoJdbc implements AirportDao {
    private final NamedParameterJdbcOperations namedPJdbcOps;

    public AirportDaoJdbc(NamedParameterJdbcOperations namedParameterJdbcOperations) {
        this.namedPJdbcOps = namedParameterJdbcOperations;
    }

    @Override
    public int count() {
        return namedPJdbcOps.queryForObject("select count(*) from airport", Collections.EMPTY_MAP, Integer.class);
    }

    @Override
    public Airport getRandomHomeAirport() {
        List<Airport> origins = namedPJdbcOps.query("select * from airport order by random() limit 1", Collections.EMPTY_MAP, new AirportMapper());
        return origins.get(0);
    }

    @Override
    public Airport getRandomAirport(String exceptMunicipality) {
        Map<String, Object> params = Collections.singletonMap("exceptMunicipality", exceptMunicipality);
        List<Airport> origins = namedPJdbcOps.query("select * from airport where municipality <> :exceptMunicipality order by random() limit 1", params, new AirportMapper());
        return origins.get(0);
    }

    private static class AirportMapper implements RowMapper<Airport> {
        @Override
        public Airport mapRow(ResultSet resultSet, int i) throws SQLException {
            int id = resultSet.getInt("id");
            String name = resultSet.getString("name");
            PGpoint coordsPG = resultSet.getObject("coordinates", PGpoint.class);
            Point2D coordinates = new Point2D.Double(coordsPG.x, coordsPG.y);
            String isoCountry = resultSet.getString("iso_country");
            String municipality = resultSet.getString("municipality");
            String iataCode = resultSet.getString("iata_code");
            String timeZone = resultSet.getString("timezone");
            return new Airport(id, name, coordinates, isoCountry, municipality, iataCode, timeZone);
        }
    }
}
