import 'package:intl/intl.dart';

/// Helper class for common date and time operations.
class DateHelper {
  DateHelper._();

  static const String defaultDateFormat = 'dd/MM/yyyy';
  static const String defaultDateTimeFormat = 'dd/MM/yyyy HH:mm';

  /// Formats a [DateTime] to a human-readable string.
  static String format(DateTime date, {String pattern = defaultDateFormat}) {
    return DateFormat(pattern).format(date);
  }

  /// Parses a date string using the given [pattern].
  static DateTime? tryParse(String value, {String pattern = defaultDateFormat}) {
    try {
      return DateFormat(pattern).parseStrict(value);
    } catch (_) {
      return null;
    }
  }

  /// Returns whether a [DateTime] is today.
  static bool isToday(DateTime date) {
    final now = DateTime.now();
    return date.year == now.year &&
        date.month == now.month &&
        date.day == now.day;
  }
}
