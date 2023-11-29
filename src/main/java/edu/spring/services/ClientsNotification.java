package edu.spring.services;

import edu.spring.domain.ClientToNotify;
import edu.spring.domain.Flight;
import edu.spring.repository.ClientToNotifyRepository;
import edu.spring.utils.Utils;
import jakarta.transaction.Transactional;
import lombok.AllArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Random;

@Service
@AllArgsConstructor
public class ClientsNotification {
    // Минимальное кол-во случайных клиентов для уведомления на каждый рейс
    private static final int minClientsToNotify = 0;
    // Максимальное кол-во случайных клиентов для уведомления на каждый рейс
    private static final int maxClientsToNotify = 3;

    private ClientToNotifyRepository clientToNotifyRepository;

    @Transactional
    public void createClientsToNotify(Flight flight) {
        Random rnd = new Random();
        int clientsCount = minClientsToNotify + rnd.nextInt(maxClientsToNotify - minClientsToNotify + 1);
        if (clientsCount > 0) {
            for (int i = 0; i < clientsCount; i++) {
                clientToNotifyRepository.insert(new ClientToNotify(null, flight, getRandomPhoneNum(), null));
            }
        }
    }

    public void notifyClients(Flight flight) {
        List<ClientToNotify> clients = clientToNotifyRepository.getClientsList(flight);
        if (clients.size() > 0) {
            String msg = getMessageByFlightStatus(flight);
            if (msg != null) {
                clients.forEach(client -> {
//                    System.out.println("    SMS for " + client.getPhoneNum() + ": " + msg);
                });
            }
        }
    }

    private String getRandomPhoneNum() {
        String result = "+";
        Random rnd = new Random();
        for (int i = 0; i < 11; i++) {
            result += rnd.nextInt(10);
        }
        return result;
    }

    private String getMessageByFlightStatus(Flight flight) {
        switch (flight.getStatus()) {
            case Landing:
                return flight + " is landing (awaited at " + Utils.formatTime(flight.getActualArrivalTime()) + ")";
            case Landed:
                return flight + " has landed";
            case AwaitingRunway:
                return flight + " is delayed";
            case OnTime:
                return flight + " arrrives on time (" + Utils.formatTime(flight.getActualArrivalTime()) + ")";
            case Delayed:
                return flight + " delayed until " + Utils.formatTime(flight.getActualArrivalTime());
            default:
                return null;
        }
    }
}
