package edu.spring;

import edu.spring.services.FlightGenerator;
import edu.spring.services.HomeAirport;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.ApplicationContext;
import org.springframework.context.annotation.Bean;
import org.springframework.scheduling.annotation.EnableScheduling;

import java.time.Clock;

@SpringBootApplication
@EnableScheduling
public class Main {
	@Bean
	public Clock clock() {
		return Clock.systemDefaultZone();
	}

	public static void main(String[] args) {
		ApplicationContext context = SpringApplication.run(Main.class, args);
		HomeAirport homeAirport = context.getBean(HomeAirport.class);
		homeAirport.greeting();
		FlightGenerator flightGenerator = context.getBean(FlightGenerator.class);
		flightGenerator.CreateRandomFlight();
		flightGenerator.CreateRandomFlight();
		flightGenerator.CreateRandomFlight();
		flightGenerator.CreateRandomFlight();
		flightGenerator.CreateRandomFlight();
		while (true) {}
	}
}
