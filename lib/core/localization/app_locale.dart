import 'package:flutter/material.dart';

/// Supported application locales.
///
/// Add new languages by creating the corresponding ARB file under
/// `lib/l10n/` and registering the locale here.
abstract class AppLocale {
  static const String english = 'en';
  static const String vietnamese = 'vi';

  static const List<String> supportedLocales = [english, vietnamese];
  static const List<Locale> supportedLocaleList = [
    Locale(english),
    Locale(vietnamese),
  ];

  static const String defaultLocale = vietnamese;
}
