package edu.spring.repository;

import edu.spring.domain.Aircraft;
import edu.spring.domain.Runway;
import jakarta.persistence.EntityManager;
import jakarta.persistence.PersistenceContext;
import jakarta.transaction.Transactional;
import org.springframework.stereotype.Repository;

import java.time.LocalDateTime;
import java.util.List;

@Repository
public class RunwayRepositoryJpa implements RunwayRepository {
    @PersistenceContext
    private EntityManager em;

    @Override
    public Runway getById(int id) {
        return em.find(Runway.class, id);
    }

    @Override
    public List<Runway> getAll() {
        return em.createQuery(
                "select r from Runway r order by r.id",
                Runway.class
        ).getResultList();
    }

    @Override
    @Transactional
    public void insert(Runway runway) {
        em.persist(runway);
    }

    @Override
    @Transactional
    public void update(Runway runway) {
        em.merge(runway);
    }

    @Override
    public Runway getSuitableRunway(Aircraft aircraft) throws NoRunwayFoundException {
        List<Runway> runways = em.createQuery(
                "select r from Runway r where r.reservedFor is null and r.reservedUntil is null and " +
                        "r.length >= :minLength and r.allowedAircraftMass >= :minAllowedMass order by r.isMain desc, random()",
                Runway.class
        )
                .setParameter("minAllowedMass", aircraft.getMass())
                .setParameter("minLength", aircraft.getLandingRun())
                .setMaxResults(1)
                .getResultList();
        if (runways.size() > 0) {
            return runways.get(0);
        } else {
            throw new NoRunwayFoundException("Подходящая для посадки свободная полоса не найдена");
        }
    }

    @Override
    public void checkAndClearReservations(LocalDateTime localDateTime) {
        List<Runway> runways = em.createQuery(
                "select r from Runway r where r.reservedFor in " +
                        "(select f from Flight f where f.status = 'Rerouted' or (f.status = 'Landed' and r.reservedUntil <= :timestamp))",
                Runway.class
                )
                .setParameter("timestamp", localDateTime)
                .getResultList();
        if (runways.size() > 0) {
            runways.forEach(runway -> {
                runway.clearReservation();
                em.merge(runway);
            });
        }
    }
}
