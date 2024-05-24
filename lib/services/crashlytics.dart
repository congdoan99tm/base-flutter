// import 'package:firebase_core/firebase_core.dart';
// import 'package:firebase_crashlytics/firebase_crashlytics.dart';
// import 'package:flutter/foundation.dart';


// class CrashService {
//   static CrashService? _instance;

//   CrashService._();

//   static CrashService get instance => _instance ??= CrashService._();

//   late final FirebaseCrashlytics _crashlytics;

//   Future<void> _initFirebase() async {
//     if (Firebase.apps.isEmpty) {
//       await Firebase.initializeApp();
//     }
//     _crashlytics = FirebaseCrashlytics.instance;
//   }

//   Future<void> init() async {
//     await _initFirebase();
//     // FlutterError.onError = (errorDetails) {
//     //   FirebaseCrashlytics.instance.recordFlutterFatalError(errorDetails);
//     // };
//     // PlatformDispatcher.instance.onError = (error, stack) {
//     //   FirebaseCrashlytics.instance.recordError(error, stack, fatal: true);
//     //   return true;
//     // };
//     FlutterError.onError = FirebaseCrashlytics.instance.recordFlutterError;

//     PlatformDispatcher.instance.onError = (error, stack) {
//       FirebaseCrashlytics.instance.recordError(error, stack, fatal: false);
//       return true;
//     };
//   }

//   Future<void> recordError(dynamic error, StackTrace? stack) async {
//     await _crashlytics.recordError(Exception(error.toString()), stack);
//   }
// }

// final CrashService crashService = CrashService.instance;
