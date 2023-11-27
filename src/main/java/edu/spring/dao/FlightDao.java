package edu.spring.dao;

import edu.spring.domain.Flight;
import edu.spring.domain.FlightStatus;

import java.time.LocalDateTime;
import java.util.List;

public interface FlightDao {
    Flight getById(int id);

    String getRandomAirline();

    public int insert(Flight flight);

    public void update(Flight flight);

    public List<Flight> getFlights(FlightStatus status, LocalDateTime localDateTime);

    public List<Flight> getFlightsForDashboard(LocalDateTime localDateTime);

    public int getActiveFlightsCount(LocalDateTime localDateTime);
}
