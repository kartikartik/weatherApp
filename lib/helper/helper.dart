import 'package:intl/intl.dart';

String formatTime(String tempDate) {
  DateFormat formatter = DateFormat('yyyy-MM-ddThh:mm');
  DateTime dateTime = DateTime.parse(tempDate);
  formatter = DateFormat('hh:mm a'); // 12-hour format with AM/PM
  return formatter.format(dateTime);
}
