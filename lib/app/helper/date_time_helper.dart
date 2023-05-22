import 'package:intl/intl.dart';

class DateTimeHelper {
  static String fromDateStringToString({required String date, required DateFormat dateFormat}) {
    final now = DateTime.parse(date);
    final formatter = dateFormat;
    return formatter.format(now).toString();
  }

  static String fromDateToString({required DateTime date, required DateFormat dateFormat}) {
    final formatter = dateFormat;
    return formatter.format(date).toString();
  }

  static String? validatorCalendarDate({required String? date}) {
    if (date == null || date.isEmpty) {
      return null;
    }

    final components = date.split('/');
    if (components.length == 3) {
      final day = int.tryParse(components[0]);
      final month = int.tryParse(components[1]);
      final year = int.tryParse(components[2]);

      if (day != null && month != null && year != null) {
        final date = DateTime(year, month, day);

        if (date.isBefore(DateTime(1995, 6, 16))) {
          return 'Invalid date';
        }

        if (date.year == year && date.month == month && date.day == day) {
          return null;
        }
      }
    }

    return 'Invalid date';
  }

  static String? converterDate({required String? date}) {
    if (date == null || date.isEmpty) {
      return null;
    }

    final components = date.split('/');
    if (components.length == 3) {
      final day = int.tryParse(components[0]);
      final month = int.tryParse(components[1]);
      final year = int.tryParse(components[2]);

      if (day != null && month != null && year != null) {
        final date = DateTime(year, month, day);

        if (date.isBefore(DateTime(1995, 6, 16)) || date.isAfter(DateTime.now())) {
          return 'Invalid date';
        }

        if (date.year == year && date.month == month && date.day == day) {
          return date.toString();
        }
      }
    }

    return 'Invalid date';
  }
}
