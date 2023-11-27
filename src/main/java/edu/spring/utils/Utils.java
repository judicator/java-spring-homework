package edu.spring.utils;

import lombok.experimental.UtilityClass;

import java.time.LocalDateTime;
import java.time.ZoneId;
import java.time.format.DateTimeFormatter;

@UtilityClass
public final class Utils {
    public static String formatFlightTime(int minutes) {
        if (minutes > 59) {
            return (int) Math.floor(minutes / 60) + " hours " + minutes % 60 + " min.";
        }
        else {
            return minutes + " min.";
        }
    }

    public static String formatDateTime(LocalDateTime localDateTime, ZoneId timezone) {
        String offset = timezone.getRules().getOffset(localDateTime).toString();
        if (offset == "Z") {
            offset = "";
        }
        return localDateTime.format(DateTimeFormatter.ofPattern("dd.MM.yyyy HH:mm:ss")) + " (UTC" + offset + ")";
    }

    public static String formatDateTime(LocalDateTime localDateTime) {
        return localDateTime.format(DateTimeFormatter.ofPattern("dd.MM.yyyy HH:mm:ss"));
    }

    public static String formatTime(LocalDateTime localDateTime) {
        return localDateTime.format(DateTimeFormatter.ofPattern("HH:mm"));
    }

    public static String fixedLengthString(String str, int length, char fillWith) {
        if (str.length() > length) {
            return str.substring(0, length);
        }
        if (str.length() < length) {
            int strLen = str.length();
            for (int i = 1; i <= (length - strLen); i++) {
                str += String.valueOf(fillWith);
            }
        }
        return str;
    }

    public static String fixedLengthString(String str, int length) {
        return fixedLengthString(str, length, ' ');
    }
}
