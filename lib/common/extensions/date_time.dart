import 'package:intl/intl.dart';

extension DateTimeExtension on DateTime? {
  String yyyyMMdd() {
    if (this == null) return '';
    // yyyy-MM-dd for call API, don't change.
    return DateFormat('yyyy-MM-dd').format(this!);
  }

  String ddMMyyyy() {
    if (this == null) return '';
    return DateFormat('dd/MM/yyyy').format(this!);
  }

  String hhMm() {
    return DateFormat('HH:mm').format(this!);
  }

  String toInvoiceTime() {
    if (this == null) return '';
    final String format = DateFormat('yy/MM/dd').format(this!);
    return '$format - ${this!.hour}:${this!.minute}:${this!.second}';
  }

  String getWeekDay() {
    final int dayOfWeek = this?.weekday ?? -1;
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

  String getWeekDayEn() {
    final int dayOfWeek = this?.weekday ?? -1;
    switch (dayOfWeek) {
      case 1:
        return 'Monday';
      case 2:
        return 'Tuesday';
      case 3:
        return 'Wednesday';
      case 4:
        return 'Thursday';
      case 5:
        return 'Friday';
      case 6:
        return 'Saturday';
      case 7:
        return 'Sunday';
      default:
        return 'Unknown';
    }
  }

  String ddmmyy() {
    if (this == null) return '';
    return DateFormat('dd/MM/yy').format(this!);
  }
}
