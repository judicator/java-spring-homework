package edu.spring.repository;

import edu.spring.domain.Flight;
import edu.spring.domain.FlightStatus;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import java.time.LocalDateTime;
import java.util.List;

@Repository
public interface FlightRepository {
    Flight getById(int id);

    String getRandomAirline();

    public void insert(Flight flight);

    public void update(Flight flight);

    public List<Flight> getFlights(FlightStatus status, LocalDateTime localDateTime);

    public List<Flight> getFlightsForDashboard(LocalDateTime localDateTime);

    public Long getActiveFlightsCount(LocalDateTime localDateTime);
}
