package edu.spring.repository;

import jakarta.persistence.EntityManager;
import jakarta.persistence.PersistenceContext;
import jakarta.persistence.TypedQuery;
import org.springframework.stereotype.Repository;
import edu.spring.domain.Aircraft;

import java.util.List;

@Repository
public class AircraftRepositoryJpa implements AircraftRepository {
    @PersistenceContext
    private EntityManager em;

    @Override
    public int getMaxMass() {
        TypedQuery<Integer> query = em.createQuery(
                "select max(a.mass) from Aircraft a",
                Integer.class
        );
        return query.getSingleResult();
    }

    @Override
    public int getMaxTakeoffRun() {
        TypedQuery<Integer> query = em.createQuery(
                "select max(a.takeoffRun) from Aircraft a",
                Integer.class
        );
        return query.getSingleResult();
    }

    @Override
    public int getMaxRange() {
        TypedQuery<Integer> query = em.createQuery(
                "select max(a.range) from Aircraft a",
                Integer.class
        );
        return query.getSingleResult();
    }

    @Override
    public Aircraft getById(int id) {
        return em.find(Aircraft.class, id);
    }

    @Override
    public Aircraft getRandomAircraft(int minRange) {
        TypedQuery<Aircraft> query = em.createQuery(
                "select a from Aircraft a where a.range >= :minRange order by random()",
                Aircraft.class
        );
        List<Aircraft> aircrafts = query
                .setParameter("minRange", minRange)
                .setMaxResults(1)
                .getResultList();
        if (aircrafts.size() > 0) {
                return aircrafts.get(0);
        }
        else {
            throw new NoAircraftFoundException("Не найдено самолёта с необходимой дальностью полёта");
        }
    }
}
