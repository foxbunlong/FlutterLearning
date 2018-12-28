import 'package:intl/intl.dart';

String dateFormatted() {
  var now = DateTime.now();
  var formatter = new DateFormat("EEE, MM d, ''yy");
  return formatter.format(now);
}