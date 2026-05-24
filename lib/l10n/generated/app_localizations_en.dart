// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get emailEmptyInvalid => 'Email cannot be empty';

  @override
  String get emailInvalid => 'Invalid email address';

  @override
  String get passEmptyInvalid => 'Password cannot be empty';

  @override
  String get passLengthInvalid => 'Password must be at least 6 characters';

  @override
  String get passInvalid => 'Invalid password';

  @override
  String get emptyValid => 'This field is required';

  @override
  String get phoneEmptyInvalid => 'Phone number cannot be empty';

  @override
  String get phoneLengthInvalid =>
      'Phone number must be between 9 and 12 digits';

  @override
  String get phoneInvalid => 'Invalid phone number';

  @override
  String get otpEmptyInvalid => 'OTP cannot be empty';

  @override
  String get otpInvalid => 'Invalid OTP';

  @override
  String get otpLengthInvalid => 'OTP must be 4 characters long';
}
