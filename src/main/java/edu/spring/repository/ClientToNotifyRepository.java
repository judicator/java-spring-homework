package edu.spring.repository;

import edu.spring.domain.ClientToNotify;
import edu.spring.domain.Flight;

import java.util.List;

public interface ClientToNotifyRepository {
    public void insert(ClientToNotify client);

    public void update(ClientToNotify client);

    public List<ClientToNotify> getClientsList(Flight flight);
}
