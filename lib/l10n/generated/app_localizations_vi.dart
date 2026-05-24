// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Vietnamese (`vi`).
class AppLocalizationsVi extends AppLocalizations {
  AppLocalizationsVi([String locale = 'vi']) : super(locale);

  @override
  String get emailEmptyInvalid => 'Email không được để trống';

  @override
  String get emailInvalid => 'Email không hợp lệ';

  @override
  String get passEmptyInvalid => 'Mật khẩu không được để trống';

  @override
  String get passLengthInvalid => 'Mật khẩu phải có ít nhất 6 ký tự';

  @override
  String get passInvalid => 'Mật khẩu không hợp lệ';

  @override
  String get emptyValid => 'Trường này không được để trống';

  @override
  String get phoneEmptyInvalid => 'Số điện thoại không được để trống';

  @override
  String get phoneLengthInvalid => 'Số điện thoại phải có từ 9 đến 12 chữ số';

  @override
  String get phoneInvalid => 'Số điện thoại không hợp lệ';

  @override
  String get otpEmptyInvalid => 'Mã OTP không được để trống';

  @override
  String get otpInvalid => 'Mã OTP không hợp lệ';

  @override
  String get otpLengthInvalid => 'Mã OTP có độ dài 4 ký tự';
}
