package edu.spring.repository;

import edu.spring.domain.ClientToNotify;
import edu.spring.domain.Flight;
import jakarta.persistence.EntityManager;
import jakarta.persistence.PersistenceContext;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class ClientToNotifyRepositoryJpa implements ClientToNotifyRepository {

    @PersistenceContext
    private EntityManager em;


    @Override
    public void insert(ClientToNotify client) {
        em.persist(client);
    }

    @Override
    public void update(ClientToNotify client) {
        em.merge(client);
    }

    @Override
    public List<ClientToNotify> getClientsList(Flight flight) {
        return em.createQuery(
                "select c from ClientToNotify c where c.flight = :flight",
                ClientToNotify.class
        )
                .setParameter("flight", flight)
                .getResultList();
    }
}
