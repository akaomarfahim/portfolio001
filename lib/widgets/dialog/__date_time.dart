import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../constants/root.dart';

// Date Picker Dialogue
Future<String> myDatePickerDialog(BuildContext context, String initDate, {String label = 'Select Date'}) async {
  DateTime selectedDate = DateFormat(ROOT.dateFormat).parse(initDate);
  final DateTime? dateTime = await showDatePicker(
      context: context,
      helpText: label,
      confirmText: 'CONFIRM',
      initialDate: selectedDate,
      firstDate: DateTime(DateTime.now().year - 10),
      lastDate: DateTime(DateTime.now().year + 10),
      builder: (context, child) {
        return Center(child: SingleChildScrollView(child: child));
      });

  String formatedDateTime = DateFormat(ROOT.dateFormat).format(dateTime ?? selectedDate);
  return formatedDateTime;
}

// Date Picker Dialogue
myTimePickerDialog(BuildContext context, String initTime, {String label = 'Select Time'}) async {
  TimeOfDay startTime = strintToTimeOfDay(initTime);
  String time = '';
  time = await showTimePicker(
      context: context,
      helpText: label,
      confirmText: 'CONFIRM',
      initialTime: startTime,
      builder: (context, child) {
        return Center(child: SingleChildScrollView(child: child));
      }).then((value) => (value != null) ? value.format(context) : initTime);
  return time;
}

// String to TimeOfDay converter:
strintToTimeOfDay(String initTime) => TimeOfDay(hour: int.parse(initTime.split(":")[0]), minute: int.parse(initTime.split(":")[1].split(" ")[0]));

// Date Difference
dateDifferenceInDays({required String firstDate, required String secondDate}) {
  DateTime date1 = DateFormat(ROOT.dateFormat).parse(firstDate);
  DateTime date2 = DateFormat(ROOT.dateFormat).parse(secondDate);

  int days = date2.difference(date1).inDays;
  return days;
}

// Date Difference
int dateDifferenceInDaysFromToday({required String? date, bool isAbsoluteValue = false}) {
  DateTime date2 = DateTime.now();

  if (date != null && date.isNotEmpty) date2 = DateFormat(ROOT.dateFormat).parse(date);

  int days = DateTime.now().difference(date2).inDays;
  if (isAbsoluteValue) return days.abs();
  return days;
}

dateIsToday({required String date}) {
  String todayString = DateFormat(ROOT.dateFormat).format(DateTime.now());
  DateTime today = DateTime.parse(todayString);
  DateTime getDay = DateTime.parse(date);

  int result = today.compareTo(getDay);
  if (result == 0) {
    return true;
  }
  return false;
}

monthIsCurrent({required String date}) {
  String todayString = DateFormat(ROOT.dateFormat).format(DateTime.now());
  DateTime today = DateTime.parse(todayString);
  DateTime getDay = DateTime.parse(date);

  if (today.month == getDay.month) {
    return true;
  }
  return false;
}

// datesLeft({required String date}) {
//   String todayString = DateFormat("yyyy-MM-dd").format(DateTime.now());
//   DateTime today = DateTime.parse(todayString);
//   DateTime getDay = DateTime.parse(date);

//   int result = today.compareTo(getDay);
//   if (result == 0) {
//     return true;
//   }
//   return false;
// }

int dateCompareeWithToday({required String date}) {
  String todayString = DateFormat(ROOT.dateFormat).format(DateTime.now());
  DateTime today = DateTime.parse(todayString);
  DateTime getDay = DateTime.parse(date);

  return getDay.compareTo(today);
}

Duration dateDifferenceDuration({required String date}) {
  String todayString = DateFormat(ROOT.dateFormat).format(DateTime.now());
  DateTime today = DateTime.parse(todayString);
  DateTime getDay = DateTime.parse(date);

  return getDay.difference(today);
}
