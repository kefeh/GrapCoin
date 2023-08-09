import 'package:intl/intl.dart';

class DateFormatter {
  DateFormatter();

  String getVerboseDateTimeRepresentation(DateTime dateTime) {
    final now = DateTime.now();

    final justNow = now.subtract(const Duration(minutes: 1));

    final localDateTime = dateTime.toLocal();

    if (!localDateTime.difference(justNow).isNegative) {
      return 'Just now';
    }

    final roughTimeString = DateFormat('jm').format(dateTime);

    if (localDateTime.day == now.day &&
        localDateTime.month == now.month &&
        localDateTime.year == now.year) {
      return roughTimeString;
    }

    final yesterday = now.subtract(const Duration(days: 1));

    if (localDateTime.day == yesterday.day &&
        localDateTime.month == now.month &&
        localDateTime.year == now.year) {
      return 'Yesterday';
    }

    if (now.difference(localDateTime).inDays < 6) {
      final weekday = DateFormat('EEEE').format(localDateTime);

      return '$weekday, $roughTimeString';
    }

    return DateFormat('yMd').format(dateTime).replaceAll('/', '-');
  }

  String getDateRepresentation(DateTime dateTime) {
    final now = DateTime.now();

    final localDateTime = dateTime.toLocal();

    final yesterday = now.subtract(const Duration(days: 1));
    if (localDateTime.day == now.day &&
        localDateTime.month == now.month &&
        localDateTime.year == now.year) {
      return 'Today';
    }

    if (localDateTime.day == yesterday.day &&
        localDateTime.month == now.month &&
        localDateTime.year == now.year) {
      return 'Yesterday';
    }

    if (now.difference(localDateTime).inDays < 4) {
      final weekday = DateFormat('EEEE').format(localDateTime);

      return weekday;
    }

    return DateFormat('d MMMM yyyy').format(localDateTime);
  }

  String getTimeRepresentation(DateTime dateTime) {
    return DateFormat('Hm').format(dateTime);
  }
}
