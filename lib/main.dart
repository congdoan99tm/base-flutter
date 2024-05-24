import 'dart:async';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';

import 'application.dart';
import 'constant/strings.dart';
import 'core/di.dart';

void main() {
  runZonedGuarded<Future<void>>(() async {
    WidgetsFlutterBinding.ensureInitialized();
    await Hive.initFlutter();
    await registerDependencies();
    Firebase.initializeApp();
    Intl.defaultLocale = Strings.kVnLocale;
    initializeDateFormatting(Strings.kVnLocale);
    runApp(const Application(''));
  }, (error, stack) async {
    // await crashService.recordError(error, stack);
  });
}
