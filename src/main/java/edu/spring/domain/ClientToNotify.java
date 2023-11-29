package edu.spring.domain;

import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@Entity
@NoArgsConstructor
@AllArgsConstructor
@Table(name = "client_to_notify")
public class ClientToNotify {
    @Id
    @GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "client_to_notify_id")
    @SequenceGenerator(name = "client_to_notify_id", sequenceName = "client_to_notify_id", allocationSize = 1)
    private Integer id;

    @OneToOne(optional = false)
    private Flight flight;

    @Column(name = "phone_num")
    private String phoneNum;

    private String email;
}
