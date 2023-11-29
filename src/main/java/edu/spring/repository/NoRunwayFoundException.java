package edu.spring.repository;

public class NoRunwayFoundException extends RuntimeException {
	public NoRunwayFoundException(String errorMessage) {
		super(errorMessage);
	}
}
