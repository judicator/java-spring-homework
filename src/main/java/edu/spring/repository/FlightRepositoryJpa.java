package edu.spring.repository;

import edu.spring.domain.Flight;
import edu.spring.domain.FlightStatus;
import jakarta.persistence.EntityManager;
import jakarta.persistence.PersistenceContext;
import jakarta.persistence.TypedQuery;
import org.springframework.stereotype.Repository;

import java.time.LocalDateTime;
import java.util.List;

@Repository
public class FlightRepositoryJpa implements FlightRepository {
    // Разница в минутах между текущим временем и временем прибытия рейса по расписанию,
    // в течение которой рейс считается прибывающим, и под него ищется полоса
    private static final int arrivesInMinutes = 15;

    @PersistenceContext
    private EntityManager em;

    @Override
    public Flight getById(int id) {
        return em.find(Flight.class, id);
    }

    @Override
    public String getRandomAirline() {
        return (String) em.createNativeQuery("select a.name from airline a order by random() limit 1", String.class).getSingleResult();
    }

    @Override
    public void insert(Flight flight) {
        em.persist(flight);
    }

    @Override
    public void update(Flight flight) {
        em.merge(flight);
    }

    @Override
    public List<Flight> getFlights(FlightStatus status, LocalDateTime localDateTime) {
        TypedQuery<Flight> query;
        switch (status) {
            case Landing:
                // Поиск садящихся рейсов, которые должны сесть на момент localDateTime
                query = em.createQuery(
                        "select f from Flight f where f.status = :status and f.actualArrivalTime <= :timestamp order by f.scheduledArrivalTime",
                        Flight.class);
                return query
                        .setParameter("status", status)
                        .setParameter("timestamp", localDateTime)
                        .getResultList();
            case InFlight:
                // Список прибывающих рейсов, которые нужно отправлять на посадку
                LocalDateTime arrivesAfter = localDateTime.plusMinutes(arrivesInMinutes);
                query = em.createQuery(
                        "select f from Flight f where (f.status = 'OnTime' or f.status = 'Delayed') and " +
                                "f.actualArrivalTime between :timestamp1 and :timestamp2 order by f.scheduledArrivalTime",
                        Flight.class);
                return query
                        .setParameter("timestamp1", localDateTime)
                        .setParameter("timestamp2", arrivesAfter)
                        .getResultList();
            default:
                query = em.createQuery(
                        "select f from Flight f where f.status = :status order by f.scheduledArrivalTime",
                        Flight.class);
                return query
                        .setParameter("status", status)
                        .getResultList();
        }
    }

    @Override
    public List<Flight> getFlightsForDashboard(LocalDateTime localDateTime) {
        LocalDateTime oldLandedAfter = localDateTime.plusMinutes(-20);
        TypedQuery<Flight> query = em.createQuery(
                "select f from Flight f where f.id in (select f.id from Flight f where (f.status <> 'Landed' and f.status <> 'Rerouted') or " +
                "(f.status = 'Landed' and f.actualArrivalTime >= :timestamp)) order by f.scheduledArrivalTime",
                Flight.class
        );
        return query
                .setParameter("timestamp", oldLandedAfter)
                .getResultList();
    }

    @Override
    public Long getActiveFlightsCount(LocalDateTime localDateTime) {
        TypedQuery<Long> query = em.createQuery(
                "select count(f) from Flight f where f.id in (select f.id from Flight f where (f.status <> 'Landed' and f.status <> 'Rerouted') or " +
                        "(f.status = 'Landed' and f.actualArrivalTime >= :timestamp))",
                Long.class
        );
        return query
                .setParameter("timestamp", localDateTime)
                .getSingleResult();
    }
}
