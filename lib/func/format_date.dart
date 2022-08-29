import 'package:intl/intl.dart';

class FormatDate {
  FormatDate(String date, String format);

  static format(date, format) {
    DateTime now = DateTime.parse(date);
    var formattedDate = DateFormat(format).format(now);
    return formattedDate;
  }
}
