package edu.spring.dao;

import edu.spring.domain.Aircraft;
import edu.spring.domain.Runway;

import java.time.LocalDateTime;
import java.util.List;

public interface RunwayDao {
    Runway getById(int id);

	List<Runway> getAll();

    int insert(Runway runway);

    void update(Runway runway);

    Runway getSuitableRunway(Aircraft aircraft) throws NoRunwayFoundException;

    void checkAndClearReservations(LocalDateTime localDateTime);
}
