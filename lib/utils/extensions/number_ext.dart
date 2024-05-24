import 'package:intl/intl.dart';

extension IntExtension on int? {
  String toTimer() {
    final minutesStr = (this! / 60).floor().toString().padLeft(2, '0');
    final secondsStr = (this! % 60).floor().toString().padLeft(2, '0');
    return '$minutesStr:$secondsStr';
  }

  String priceFormat() {
    if (this == null) return '';
    return NumberFormat('#,##0').format(this);
  }
}

extension DoubleExtension on double? {
  String priceFormat() {
    if (this == null) return '';
    return NumberFormat('#,##0').format(this);
  }
}
