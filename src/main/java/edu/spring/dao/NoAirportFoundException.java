package edu.spring.dao;

public class NoAirportFoundException extends RuntimeException {
    public NoAirportFoundException(String errorMessage) {
        super(errorMessage);
    }
}
