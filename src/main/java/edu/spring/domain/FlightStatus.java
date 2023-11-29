package edu.spring.domain;

public enum FlightStatus {
    // В пути (по расписанию или задерживается)
    InFlight,

    // Прибывает по расписанию
    OnTime,

    // Задерживается
    Delayed,

    // Готов к посадке, ожидает свободную полосу
    AwaitingRunway,

    // Садится
    Landing,

    // Сел
    Landed,

    // Перенаправлен в другой аэропорт (не используется)
    Rerouted;
}
