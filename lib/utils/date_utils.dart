DateTime findNextSunday(DateTime dateTime) {
  return dateTime.add(Duration(days: 7 - dateTime.weekday));
}

DateTime findFirstDateOfTheWeek(DateTime dateTime) {
  return dateTime.subtract(Duration(days: dateTime.weekday % 7));
}
