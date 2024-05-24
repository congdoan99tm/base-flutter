// import 'package:intl/intl.dart';

class DateTimeUtil {
  static DateTimeUtil? _instance;

  DateTimeUtil._();

  static DateTimeUtil get instance => _instance ??= DateTimeUtil._();

  static String toBEFormat(DateTime d) {
    final String day = '${d.day}'.length < 2 ? '0${d.day}' : '${d.day}';
    final String month = '${d.month}'.length < 2 ? '0${d.month}' : '${d.month}';
    return '${d.year}-$month-$day';
  }

  static String toInvoiceTime(DateTime? d) {
    if (d == null) return '';
    final m = d.month.toString().length < 2 ? '0${d.month}' : d.month;
    final day = d.day.toString().length < 2 ? '0${d.day}' : d.day;

    return '${d.year}/$m/$day - ${d.hour}:${d.minute}:${d.second}';
  }

  static DateTime? fromMillisecondsSinceEpoch(String? d) {
    if (d == null) return null;
    final int epochTime = int.parse(d);

    return DateTime.fromMillisecondsSinceEpoch(epochTime * 1000);
  }

  static String getWeekDay(DateTime d) {
    final int dayOfWeek = d.weekday;
    switch (dayOfWeek) {
      case 1:
        return 'Thứ Hai';
      case 2:
        return 'Thứ Ba';
      case 3:
        return 'Thứ Tư';
      case 4:
        return 'Thứ Năm';
      case 5:
        return 'Thứ Sáu';
      case 6:
        return 'Thứ Bảy';
      case 7:
        return 'Chủ Nhật';
      default:
        return 'Không xác định';
    }
  }

  static String getDateNow() {
    final date = DateTime.now().toLocal();
    // final weekDayFormat = DateFormat('EEEE').format(date);
    final month =
        date.month.toString().length < 2 ? '0${date.month}' : date.month;
    return 'Thứ ${date.weekday + 1}, ngày ${date.day}/$month/${date.year}';
  }
}

final dateUtil = DateTimeUtil.instance;
