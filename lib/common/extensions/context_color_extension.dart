import 'package:flutter/material.dart';

import '../../core/theme/app_colors.dart';

/// Convenient color shortcuts on [BuildContext].
extension BuildContextColorExtension on BuildContext {
  ThemeData get theme => Theme.of(this);
  ColorScheme get colorScheme => theme.colorScheme;
  Brightness get brightness => theme.brightness;

  AppColorsExtension get appColors =>
      theme.extension<AppColorsExtension>() ?? AppColorsExtension.light;

  Color get primary => colorScheme.primary;
  Color get onPrimary => colorScheme.onPrimary;
  Color get secondary => colorScheme.secondary;
  Color get onSecondary => colorScheme.onSecondary;
  Color get surface => colorScheme.surface;
  Color get onSurface => colorScheme.onSurface;
  Color get background => theme.scaffoldBackgroundColor;
  Color get onBackground => onSurface;
  Color get error => colorScheme.error;
  Color get onError => colorScheme.onError;
  Color get outline => colorScheme.outline;
  Color get outlineVariant => colorScheme.outlineVariant;
  Color get shadow => colorScheme.shadow;

  Color get textPrimary => appColors.textPrimary;
  Color get textSecondary => appColors.textSecondary;
  Color get success => appColors.success;
  Color get warning => appColors.warning;
  Color get danger => appColors.error;
  Color get divider => appColors.divider;
}
