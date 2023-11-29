package edu.spring.repository;

public class NoAirportFoundException extends RuntimeException {
    public NoAirportFoundException(String errorMessage) {
        super(errorMessage);
    }
}
