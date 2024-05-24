import 'package:cupertino_back_gesture/cupertino_back_gesture.dart';
import 'package:flutter/material.dart';

import 'colors.dart';

class AppTheme {
  static ThemeData get light {
    return ThemeData(
      primaryColor: Colors.black,
      canvasColor: Colors.black54,
      inputDecorationTheme: const InputDecorationTheme(
        fillColor: Colors.amber,
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.blue, width: 2.0),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.grey, width: 1.0),
        ),
      ),
      // fontFamily: FontFamily.inter,
      textButtonTheme: TextButtonThemeData(
          style: TextButton.styleFrom(
              foregroundColor: Colors.teal,
              disabledForegroundColor: Colors.red.withOpacity(0.38),
              side: const BorderSide(),
              shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(25))))),
      textTheme: ThemeData.light().textTheme.copyWith(
          // headlineSmall: inter600,
          // displayMedium: inter500,
          // bodyMedium: inter500,
          // bodyLarge: inter600,
          // titleMedium: inter500,
          // titleSmall: inter400,
          ),
      pageTransitionsTheme: const PageTransitionsTheme(
        builders: {
          TargetPlatform.android: ZoomPageTransitionsBuilder(),
          TargetPlatform.iOS:
              CupertinoPageTransitionsBuilderCustomBackGestureWidth(),
        },
      ),
    );
  }

  static ThemeData get dark {
    return ThemeData(
      brightness: Brightness.dark,
      primaryColor: Colors.white,
      canvasColor: Colors.white54,
      textTheme: ThemeData.dark().textTheme,
      pageTransitionsTheme: const PageTransitionsTheme(
        builders: {
          TargetPlatform.android: ZoomPageTransitionsBuilder(),
          TargetPlatform.iOS:
              CupertinoPageTransitionsBuilderCustomBackGestureWidth(),
        },
      ),
    );
  }
}

final containerDecoration = BoxDecoration(
  borderRadius: BorderRadius.circular(8),
  border: Border.all(color: AppColors.grey200),
  color: AppColors.grey50,
);
