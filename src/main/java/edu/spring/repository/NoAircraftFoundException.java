package edu.spring.repository;

public class NoAircraftFoundException extends RuntimeException {
    public NoAircraftFoundException(String errorMessage) {
        super(errorMessage);
    }
}
