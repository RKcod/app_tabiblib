extension DateExtension on DateTime {
  String get toTime {
    return "${stringNumberWithZero(hour)}:${stringNumberWithZero(minute)}";
  }

  DateTime get toDate {
    return DateTime(year, month, day);
  }
}

String stringNumberWithZero(int number) {
  return number < 10 ? "0$number" : number.toString();
}
