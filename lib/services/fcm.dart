import 'dart:io';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';

// import 'package:flutter/foundation.dart';

import '../utils/helpers/local_notify.dart';

Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  await Firebase.initializeApp();
}

class FcmService {
  static FcmService? _instance;

  FcmService._();

  static FcmService get instance => _instance ??= FcmService._();

  late FirebaseMessaging _fcmInstance;
  final _localNotifyService = LocalNotificationService.instance;

  Future<void> _initFirebase() async {
    if (Firebase.apps.isEmpty) {
      await Firebase.initializeApp();
    }
    _fcmInstance = FirebaseMessaging.instance;
  }

  Future<void> init() async {
    await _localNotifyService.init();
    await _initFirebase();
    final d = DateTime.now().day;
    _fcmInstance.subscribeToTopic('prod$d');
    await _fcmInstance.requestPermission(
      alert: true,
      announcement: false,
      badge: true,
      carPlay: true,
      criticalAlert: true,
      provisional: true,
      sound: true,
    );
    FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);

    if (!kIsWeb) {
      await _fcmInstance.setForegroundNotificationPresentationOptions(
        alert: true,
        badge: true,
        sound: true,
      );
    }
    _listenFCM();
  }

  Future<void> _listenFCM() async {
    FirebaseMessaging.onMessage.listen((message) {
      if (Platform.isIOS) return;
      _localNotifyService.showNotification(message);
    });

    FirebaseMessaging.onMessageOpenedApp.listen((mess) {
      // handle
    });
  }

  Future<void> getInitialMessage() async {
    final initMess = await FirebaseMessaging.instance.getInitialMessage();
    if (initMess == null) return;
    // handle
  }
}

final fcmService = FcmService.instance;
