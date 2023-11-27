package edu.spring.dao;

public class NoRunwayFoundException extends RuntimeException {
	public NoRunwayFoundException(String errorMessage) {
		super(errorMessage);
	}
}
