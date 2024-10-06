import 'package:intl/intl.dart';

extension StringExtension on String {
  String get capitalize =>
      '${this[0].toUpperCase()}${substring(1).toLowerCase()}';
}

extension DateTimeExtensions on DateTime {
  bool isSameDate(DateTime other) {
    if (year == other.year && month == other.month && day == other.day) {
      return true;
    }
    return false;
  }
}

abstract class DateTimeFormatter {
  DateTimeFormatter._();

  static DateTime toLocalDate(DateTime date) {
    if (date.minute == 0 && date.hour == 0 && date.second == 0) {
      return date;
    }
    Duration localTimeZone = DateTime.now().timeZoneOffset;
    DateTime dateLocal = date.add(localTimeZone);
    return dateLocal;
  }

  /// Returns age
  static int calculateAge(DateTime date) {
    DateTime today = DateTime.now();
    if (today.isAfter(date)) {
      return today.year - date.year;
    }
    return 0;
  }

  /// Returns name of month by language
  /// Agosto
  /// August
  static String getMonthName(DateTime date, {String locale = 'es'}) =>
      DateFormat.MMMM(locale).format(date);

  /// Return date with month and/or time
  /// Example: 20 mar. 2022
  /// Example: 22 may. 2022, 12:37
  static String getDateWithMonthAndTime(DateTime date,
      {bool toLocal = true, String? locale = 'es', bool showTime = true}) {
    DateTime dateTime = toLocal ? toLocalDate(date) : date;
    DateFormat formatter = DateFormat.yMMMd(locale);
    String _date = formatter.format(dateTime);
    return showTime
        ? '$_date, ${fillNumber(dateTime.hour)}:${fillNumber(dateTime.minute)}'
        : _date;
  }

  /// Return date with month and year by language
  /// Example: Agosto de 2022
  /// Example: August 2022
  static String getDateWithMonthAndYear(DateTime date,
      {String locale = 'es', bool capitalize = true, bool toLocal = true}) {
    DateTime dateTime = toLocal ? toLocalDate(date) : date;
    String dateString = DateFormat.yMMMM(locale).format(dateTime);
    return capitalize ? dateString.capitalize : dateString;
  }

  ///Returns a formatted month date with year separated by coma
  /// MMMM dd yyyy
  /// Example: 02 Marzo 2021
  static String formattedDayMMMMY(DateTime date, {bool toLocal = true}) {
    DateTime dateTime = toLocal ? toLocalDate(date) : date;
    DateFormat formatter = DateFormat('dd MMMM yyyy');
    String formatted = formatter.format(dateTime);

    return formatted;
  }

  /// Example: 21 feb. 2024
  static String formattedMinDate(
    DateTime date, {
    bool month = true,
    bool year = true,
  }) {
    DateFormat formatter = DateFormat('d');
    String formatted = formatter.format(date);

    DateFormat formatterY = DateFormat('yyyy');
    String formattedY = formatterY.format(date);

    DateFormat formatterM = DateFormat('MMM');
    String formattedM = formatterM.format(date);
    String formattedString = '$formatted';

    if (month) {
      formattedString = '$formattedString $formattedM';
    }

    if (year) {
      formattedString = '$formattedString del $formattedY';
    }

    return formattedString;
  }
}

String fillNumber(int value) {
  if (value >= 0 && value <= 9) {
    return '0$value';
  }
  return '$value';
}
