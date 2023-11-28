package edu.spring.dao;

import edu.spring.domain.ClientToNotify;
import edu.spring.domain.Flight;

import java.util.List;

public interface ClientToNotifyDao {

    public int insert(ClientToNotify client);

    public void update(ClientToNotify client);

    public List<ClientToNotify> getClientsList(Flight flight);
}
