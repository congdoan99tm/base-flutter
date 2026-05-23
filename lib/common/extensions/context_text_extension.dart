import 'package:flutter/material.dart';

/// Convenient text style shortcuts on [BuildContext].
extension BuildContextTextExtension on BuildContext {
  TextTheme get textTheme => Theme.of(this).textTheme;

  TextStyle? get displayLarge => textTheme.displayLarge;
  TextStyle? get displayMedium => textTheme.displayMedium;
  TextStyle? get displaySmall => textTheme.displaySmall;
  TextStyle? get headlineLarge => textTheme.headlineLarge;
  TextStyle? get headlineMedium => textTheme.headlineMedium;
  TextStyle? get headlineSmall => textTheme.headlineSmall;
  TextStyle? get titleLarge => textTheme.titleLarge;
  TextStyle? get titleMedium => textTheme.titleMedium;
  TextStyle? get titleSmall => textTheme.titleSmall;
  TextStyle? get bodyLarge => textTheme.bodyLarge;
  TextStyle? get bodyMedium => textTheme.bodyMedium;
  TextStyle? get bodySmall => textTheme.bodySmall;
  TextStyle? get labelLarge => textTheme.labelLarge;
  TextStyle? get labelMedium => textTheme.labelMedium;
  TextStyle? get labelSmall => textTheme.labelSmall;

  TextStyle? get h1 => displayLarge;
  TextStyle? get h2 => displayMedium;
  TextStyle? get h3 => displaySmall;
  TextStyle? get h4 => headlineLarge;
  TextStyle? get h5 => headlineMedium;
  TextStyle? get h6 => headlineSmall;
  TextStyle? get title => titleLarge;
  TextStyle? get subtitle => titleMedium;
  TextStyle? get body => bodyMedium;
  TextStyle? get caption => bodySmall;
  TextStyle? get label => labelLarge;
}
