package edu.spring;

import edu.spring.dao.AirportDao;
import edu.spring.domain.Airport;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.ApplicationContext;

@SpringBootApplication
public class Main {
	public static void main(String[] args) {
		ApplicationContext context = SpringApplication.run(Main.class, args);

		AirportDao airportDao = context.getBean(AirportDao.class);
		Airport homeAirport = airportDao.getRandomHomeAirport();
		System.out.println("Welcome to " + homeAirport.getName() + " (" + homeAirport.getIsoCountry() + ") [" + homeAirport.getIataCode() + "]");
	}
}
