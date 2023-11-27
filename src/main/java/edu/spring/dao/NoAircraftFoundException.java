package edu.spring.dao;

public class NoAircraftFoundException extends RuntimeException {
    public NoAircraftFoundException(String errorMessage) {
        super(errorMessage);
    }
}
