import 'package:intl/intl.dart';

/// function to get today's date
String getTodayDate() {
  return DateFormat.yMMMMd().format(
    DateTime.now(),
  );
}
