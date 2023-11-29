package edu.spring.repository;

import edu.spring.domain.Airport;
import jakarta.persistence.*;
import org.springframework.stereotype.Repository;

import java.awt.geom.Point2D;
import java.util.List;

@Repository
public class AirportRepositoryJpa implements AirportRepository {
    @PersistenceContext
    private EntityManager em;

    @Override
    public int count() {
        TypedQuery<Integer> query = em.createQuery(
                "select count(a) from Airport a",
                Integer.class
        );
        return query.getSingleResult();
    }

    @Override
    public Airport getById(int id) {
        return em.find(Airport.class, id);
    }

    @Override
    public Airport getRandomHomeAirport() {
        TypedQuery<Airport> query = em.createQuery(
                "select a from Airport a order by random()",
                Airport.class
        );
        return query
                .setMaxResults(1)
                .getResultList()
                .get(0);
    }

    @Override
    public Airport getRandomAirport(int maxDistance, Point2D originCoords) {
        TypedQuery<Airport> query = em.createQuery(
                "select a from Airport a where distance_on_earth(:origLat, :origLon, a.latitude, a.longitude) " +
                        "between :minDistance and :maxDistance order by random()",
                Airport.class
        );
        List<Airport> airports = query
                .setMaxResults(1)
                .setParameter("minDistance", 50) // минимальное расстояние для поиска аэропорта - 50 морских миль
                .setParameter("maxDistance", maxDistance)
                .setParameter("origLat", originCoords.getX())
                .setParameter("origLon", originCoords.getY())
                .getResultList();
        if (airports.size() > 0) {
            return airports.get(0);
        }
        else {
            throw new NoAirportFoundException("Не найдено подходящего аэропорта вылета");
        }
    }

    @Override
    public Airport findByIataCode(String iataCode) {
        TypedQuery<Airport> query = em.createQuery(
                "select a from Airport a where a.iataCode = :iataCode",
                Airport.class
        );
        return query
                .setMaxResults(1)
                .setParameter("iataCode", iataCode)
                .getSingleResult();
    }

    @Override
    public int getDistance(Point2D originCoords, Point2D destCoords) {
        Double dist = (Double) em
                .createNativeQuery("SELECT distance_on_earth(:lat1, :lon1, :lat2, :lon2)")
                .setParameter("lat1", originCoords.getX())
                .setParameter("lon1", originCoords.getY())
                .setParameter("lat2", destCoords.getX())
                .setParameter("lon2", destCoords.getY())
                .getSingleResult();
        return (int) Math.round(dist);
    }
}
