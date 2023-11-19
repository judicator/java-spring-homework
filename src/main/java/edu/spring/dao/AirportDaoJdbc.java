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
import java.util.HashMap;
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
    public Airport getRandomAirport(int maxDistance, Point2D originCoords) {
        Map<String, Object> params = new HashMap<>();
        params.put("minDistance", 50); // минимальное расстояние для поиска аэропорта - 50 морских миль
        params.put("maxDistance", maxDistance);
        params.put("origLat", originCoords.getX());
        params.put("origLon", originCoords.getY());
        List<Airport> airports = namedPJdbcOps.query(
                "select * from airport a where distance_on_earth(:origLat, :origLon, a.coordinates[0], a.coordinates[1]) between :minDistance and :maxDistance order by random() limit 1",
                params,
                new AirportMapper());
        return airports.get(0);
    }

    @Override
    public Airport findByIataCode(String iataCode) {
        Map<String, Object> params = Collections.singletonMap("iataCode", iataCode);
        return namedPJdbcOps.queryForObject(
                "select * from airport where iata_code = :iataCode", params, new AirportMapper()
        );
    }

    @Override
    public int getDistance(Point2D originCoords, Point2D destCoords) {
        Map<String, Object> params = new HashMap<>();
        params.put("origLat", originCoords.getX());
        params.put("origLon", originCoords.getY());
        params.put("destLat", destCoords.getX());
        params.put("destLon", destCoords.getY());
        return namedPJdbcOps.queryForObject(
                "select round(distance_on_earth(:origLat, :origLon, :destLat, :destLon))", params, Integer.class
        );
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
