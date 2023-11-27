package edu.spring.domain;

public enum FlightStatus {
    // Летит (по расписанию или задерживается)
    InFlight,
    // Прибывает по расписанию
    OnTime,
    // Задерживается
    Delayed,
    // Ожидает полосу
    AwaitingRunway,
    // Садится
    Landing,
    // Сел
    Landed,
    // Перенаправлен в другой аэропорт
    Rerouted;
}
