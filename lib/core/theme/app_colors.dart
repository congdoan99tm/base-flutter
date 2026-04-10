import 'package:flutter/material.dart';

/// Base color palette for the application
abstract class AppPalette {
  static const Color primaryBlue = Color(0xFF2563EB);
  static const Color darkBlue = Color(0xFF1D4ED8);
  static const Color purple = Color(0xFF7C3AED);
  
  static const Color white = Color(0xFFFFFFFF);
  static const Color black = Color(0xFF000000);
  
  static const Color grey50 = Color(0xFFF9FAFB);
  static const Color grey100 = Color(0xFFF3F4F6);
  static const Color grey200 = Color(0xFFE5E7EB);
  static const Color grey500 = Color(0xFF6B7280);
  static const Color grey800 = Color(0xFF1F2937);
  static const Color grey900 = Color(0xFF111827);
  
  static const Color red = Color(0xFFDC2626);
  static const Color green = Color(0xFF16A34A);
  static const Color orange = Color(0xFFD97706);
}

/// Custom colors extension to handle light and dark mode colors seamlessly
class AppColorsExtension extends ThemeExtension<AppColorsExtension> {
  final Color primary;
  final Color background;
  final Color surface;
  final Color textPrimary;
  final Color textSecondary;
  final Color success;
  final Color warning;
  final Color error;
  final Color divider;

  const AppColorsExtension({
    required this.primary,
    required this.background,
    required this.surface,
    required this.textPrimary,
    required this.textSecondary,
    required this.success,
    required this.warning,
    required this.error,
    required this.divider,
  });

  @override
  AppColorsExtension copyWith({
    Color? primary,
    Color? background,
    Color? surface,
    Color? textPrimary,
    Color? textSecondary,
    Color? success,
    Color? warning,
    Color? error,
    Color? divider,
  }) {
    return AppColorsExtension(
      primary: primary ?? this.primary,
      background: background ?? this.background,
      surface: surface ?? this.surface,
      textPrimary: textPrimary ?? this.textPrimary,
      textSecondary: textSecondary ?? this.textSecondary,
      success: success ?? this.success,
      warning: warning ?? this.warning,
      error: error ?? this.error,
      divider: divider ?? this.divider,
    );
  }

  @override
  AppColorsExtension lerp(ThemeExtension<AppColorsExtension>? other, double t) {
    if (other is! AppColorsExtension) {
      return this;
    }
    return AppColorsExtension(
      primary: Color.lerp(primary, other.primary, t)!,
      background: Color.lerp(background, other.background, t)!,
      surface: Color.lerp(surface, other.surface, t)!,
      textPrimary: Color.lerp(textPrimary, other.textPrimary, t)!,
      textSecondary: Color.lerp(textSecondary, other.textSecondary, t)!,
      success: Color.lerp(success, other.success, t)!,
      warning: Color.lerp(warning, other.warning, t)!,
      error: Color.lerp(error, other.error, t)!,
      divider: Color.lerp(divider, other.divider, t)!,
    );
  }

  /// Light theme colors
  static const light = AppColorsExtension(
    primary: AppPalette.primaryBlue,
    background: AppPalette.grey50,
    surface: AppPalette.white,
    textPrimary: AppPalette.grey900,
    textSecondary: AppPalette.grey500,
    success: AppPalette.green,
    warning: AppPalette.orange,
    error: AppPalette.red,
    divider: AppPalette.grey200,
  );

  /// Dark theme colors
  static const dark = AppColorsExtension(
    primary: AppPalette.primaryBlue,
    background: AppPalette.grey900,
    surface: AppPalette.grey800,
    textPrimary: AppPalette.grey50,
    textSecondary: AppPalette.grey500,
    success: AppPalette.green,
    warning: AppPalette.orange,
    error: AppPalette.red,
    divider: AppPalette.grey800,
  );
}

/// Extension on BuildContext to quickly access colors
/// Usage: `context.colors.primary`
extension AppColorsExtensionHelper on BuildContext {
  AppColorsExtension get colors =>
      Theme.of(this).extension<AppColorsExtension>() ?? AppColorsExtension.light;
}
