package edu.spring.repository;

import edu.spring.domain.Aircraft;
import edu.spring.domain.Runway;

import java.time.LocalDateTime;
import java.util.List;

public interface RunwayRepository {
    public Runway getById(int id);

    public List<Runway> getAll();

    public void insert(Runway runway);

    public void update(Runway runway);

    Runway getSuitableRunway(Aircraft aircraft) throws NoRunwayFoundException;

    void checkAndClearReservations(LocalDateTime localDateTime);
}
