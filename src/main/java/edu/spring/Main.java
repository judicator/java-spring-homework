package edu.spring;

import edu.spring.services.HomeAirport;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.ApplicationContext;

@SpringBootApplication
public class Main {
	public static void main(String[] args) {
		ApplicationContext context = SpringApplication.run(Main.class, args);
		HomeAirport homeAirport = context.getBean(HomeAirport.class);
		homeAirport.greeting();
	}
}
