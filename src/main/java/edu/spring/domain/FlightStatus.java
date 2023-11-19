package edu.spring.domain;

public enum FlightStatus {
    // Прибывает по расписанию
    OnSchedule,
    // Задерживается
    Delayed,
    // Садится
    Landing,
    // Сел
    Landed,
    // Перенаправлен в другой аэропорт
    Rerouted
}
