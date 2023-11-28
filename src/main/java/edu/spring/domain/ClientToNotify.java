package edu.spring.domain;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class ClientToNotify {
    private Integer id;
    private Flight flight;
    private String phoneNum;
    private String email;

    public ClientToNotify(Flight flight, String phoneNum, String email) {
        this.id = null;
        this.flight = flight;
        this.phoneNum = phoneNum;
        this.email = email;
    }
}
