import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:base_flutter_2/core/services/crashlytics_service.dart';
import 'package:base_flutter_2/app/di/injection.dart';

/// Bootstraps the application.
/// It runs all the necessary background services initialization and configurations
/// before handing over the initialization to the root [builder] widget.
Future<void> bootstrap(FutureOr<Widget> Function() builder) async {
  // Ensure we capture errors right from the start
  FlutterError.onError = (details) {
    debugPrint(details.exceptionAsString());
    // CrashlyticsService will naturally intercept this after init
  };

  await runZonedGuarded(
    () async {
      // 1. Initialize Flutter bindings
      WidgetsFlutterBinding.ensureInitialized();

      // 2. Setup System configurations (Orientation, Navigation Bar, Status Bar)
      await _setupSystemUI();

      // 3. Initialize Firebase & Services
      await _initServices();

      // 4. Setup Dependency Injection
      await configureDependencies();

      // 5. Run the provided App widget
      runApp(await builder());
    },
    (error, stackTrace) {
      debugPrint('Zoned Error caught outside framework: $error');
      // Pass all globally unhandled errors to Crashlytics
      CrashlyticsService.logError(error, stackTrace, isFatal: true);
    },
  );
}

/// Configures System UI overlays and preferred device orientations
Future<void> _setupSystemUI() async {
  // Lock screen orientation to Portrait only
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  // Set status bar & bottom navigation bar themes to match system defaults / design
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent, // Makes the status bar transparent
      statusBarIconBrightness: Brightness.dark, // Dark text for light backgrounds
      statusBarBrightness: Brightness.light, // For iOS
      systemNavigationBarColor: Colors.transparent, // Default nav bar color
      systemNavigationBarIconBrightness: Brightness.dark, // Dark icons for bottom nav
    ),
  );
}

/// Initializes external services like Firebase, Crashlytics, Local Storage etc.
Future<void> _initServices() async {
  // Initialize Firebase (Requires flutterfire configure)
  try {
    await Firebase.initializeApp();
  } catch (e) {
    debugPrint('Firebase init failed (Did you run flutterfire configure?): $e');
    // Intentionally not blocking app startup if Firebase fails for now.
  }

  // Initialize Crashlytics to catch all Framework & Async errors
  await CrashlyticsService.initialize();
}
