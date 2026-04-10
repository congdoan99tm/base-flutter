import 'package:flutter/material.dart';

import 'app_colors.dart';

class AppTheme {
  static ThemeData get light => ThemeData(
        useMaterial3: true,
        brightness: Brightness.light,
        colorScheme: ColorScheme.fromSeed(seedColor: AppColorsExtension.light.primary),
        scaffoldBackgroundColor: AppColorsExtension.light.background,
        appBarTheme: AppBarTheme(
          backgroundColor: AppColorsExtension.light.surface,
          elevation: 0,
          centerTitle: true,
          foregroundColor: AppColorsExtension.light.textPrimary,
        ),
        extensions: const <ThemeExtension<dynamic>>[
          AppColorsExtension.light,
        ],
      );

  static ThemeData get dark => ThemeData(
        useMaterial3: true,
        brightness: Brightness.dark,
        colorScheme: ColorScheme.fromSeed(
          seedColor: AppColorsExtension.dark.primary,
          brightness: Brightness.dark,
        ),
        scaffoldBackgroundColor: AppColorsExtension.dark.background,
        appBarTheme: AppBarTheme(
          backgroundColor: AppColorsExtension.dark.surface,
          elevation: 0,
          centerTitle: true,
          foregroundColor: AppColorsExtension.dark.textPrimary,
        ),
        extensions: const <ThemeExtension<dynamic>>[
          AppColorsExtension.dark,
        ],
      );
}
