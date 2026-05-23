export 'context_color_extension.dart';
export 'context_text_extension.dart';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

/// Convenient extension methods on [BuildContext] for navigation and layout.
extension BuildContextExtension on BuildContext {
  /// Use only when you need the full [MediaQueryData] object.
  MediaQueryData get mediaQuery => MediaQuery.of(this);

  Size get size => MediaQuery.sizeOf(this);
  double get screenWidth => size.width;
  double get screenHeight => size.height;
  double get shortestSide => size.shortestSide;
  double get longestSide => size.longestSide;
  Orientation get orientation => MediaQuery.orientationOf(this);
  bool get isLandscape => orientation == Orientation.landscape;
  bool get isPortrait => !isLandscape;
  EdgeInsets get padding => MediaQuery.paddingOf(this);
  EdgeInsets get viewPadding => MediaQuery.viewPaddingOf(this);
  EdgeInsets get viewInsets => MediaQuery.viewInsetsOf(this);
  double get devicePixelRatio => MediaQuery.devicePixelRatioOf(this);
  Locale get locale => Localizations.localeOf(this);
  Brightness get platformBrightness => MediaQuery.platformBrightnessOf(this);

  NavigatorState get navigator => Navigator.of(this);
  GoRouter get router => GoRouter.of(this);
  ScaffoldMessengerState get scaffoldMessenger => ScaffoldMessenger.of(this);
}
