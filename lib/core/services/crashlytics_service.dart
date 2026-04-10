import 'package:flutter/foundation.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';

class CrashlyticsService {
  CrashlyticsService._();

  /// Initialize Crashlytics to catch all errors and pass them to Firebase.
  static Future<void> initialize() async {
    // Only configure Crashlytics if Firebase is actually initialized
    if (Firebase.apps.isEmpty) {
      debugPrint('⚠️ Firebase has not been initialized. Crashlytics will not be started.');
      return;
    }

    // Pass all uncaught "fatal" errors from the Flutter framework to Crashlytics
    FlutterError.onError = (errorDetails) {
      FirebaseCrashlytics.instance.recordFlutterFatalError(errorDetails);
    };

    // Pass all uncaught asynchronous errors that aren't handled by the Flutter framework to Crashlytics
    PlatformDispatcher.instance.onError = (error, stack) {
      FirebaseCrashlytics.instance.recordError(error, stack, fatal: true);
      return true;
    };
  }

  /// Manually log an exception or error
  static void logError(dynamic exception, StackTrace stackTrace, {bool isFatal = false, String? reason}) {
    if (Firebase.apps.isEmpty) return;
    FirebaseCrashlytics.instance.recordError(exception, stackTrace, fatal: isFatal, reason: reason);
  }

  /// Add a custom text log to attach to crash reports
  static void logMessage(String message) {
    if (Firebase.apps.isEmpty) return;
    FirebaseCrashlytics.instance.log(message);
  }
}
