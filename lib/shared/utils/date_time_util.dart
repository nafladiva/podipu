import 'package:intl/intl.dart';

class DateTimeUtil {
  static String millisecondsToDateTime(int ms) {
    final datetime = DateTime.fromMillisecondsSinceEpoch(ms);

    return DateFormat('MMMM dd, yyyy').format(datetime);
  }
}
