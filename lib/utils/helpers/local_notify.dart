import 'dart:convert';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

// import 'package:timezone/data/latest.dart' as tz;
// import 'package:timezone/timezone.dart' as tz;

class LocalNotificationService {
  static LocalNotificationService? _instance;

  LocalNotificationService._();

  static LocalNotificationService get instance =>
      _instance ??= LocalNotificationService._();

  final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  static const AndroidNotificationDetails _androidNotificationDetails =
      AndroidNotificationDetails(
    'high_importance_channel',
    'High Importance Notifications',
    channelDescription: 'This channel is used for important notifications.',
    playSound: true,
    priority: Priority.high,
    importance: Importance.high,
    enableVibration: true,
  );

  static const DarwinNotificationDetails _iOSNotificationDetails =
      DarwinNotificationDetails(
    threadIdentifier: 'dinos',
    presentAlert: true,
    presentSound: true,
    presentBadge: true,
  );
  var channel = const AndroidNotificationChannel(
    'flutter_notification', // id
    'flutter_notification_title', // title
    importance: Importance.high,
    enableLights: true,
    enableVibration: true,
    showBadge: true,
    playSound: true,
  );
  final NotificationDetails notificationDetails = const NotificationDetails(
    android: _androidNotificationDetails,
    iOS: _iOSNotificationDetails,
  );

  Future<void> init() async {
    const AndroidInitializationSettings androidInitializationSettings =
        AndroidInitializationSettings('@mipmap/ic_launcher');

    const DarwinInitializationSettings iOSInitializationSettings =
        DarwinInitializationSettings(
      requestAlertPermission: true,
      requestBadgePermission: true,
      requestSoundPermission: true,
      defaultPresentAlert: true,
      defaultPresentBadge: true,
      defaultPresentSound: true,
    );

    const InitializationSettings initializationSettings =
        InitializationSettings(
      android: androidInitializationSettings,
      iOS: iOSInitializationSettings,
    );

    // tz.initializeTimeZones();

    await flutterLocalNotificationsPlugin.initialize(
      initializationSettings,
      onDidReceiveNotificationResponse: (details) {
        notificationTapBackground(details);
      },
      // onDidReceiveBackgroundNotificationResponse: (details) {
      //   notificationTapBackground(details);
      // },
      // ignore: invalid_return_type_for_catch_error
    ).catchError((e) => e.logE('init local notify'));
  }

  Future<void> requestIOSPermissions() async {
    await flutterLocalNotificationsPlugin
        .resolvePlatformSpecificImplementation<
            IOSFlutterLocalNotificationsPlugin>()
        ?.requestPermissions(
          alert: true,
          badge: true,
          sound: true,
        );
  }

  Future<void> showNotification(RemoteMessage message) async {
    await flutterLocalNotificationsPlugin
        .show(
          message.data['id'] ?? 0,
          message.notification?.title,
          message.notification?.body,
          notificationDetails,
          payload: jsonEncode(message.data),
        )
        .catchError((e) => e.logE('showNotification'));
  }

  void notificationTapBackground(NotificationResponse notificationResponse) {}

  // Future<void> scheduleNotification(int id, String title, String body,
  //     DateTime eventDate, TimeOfDay eventTime, String payload,
  //     [DateTimeComponents? dateTimeComponents]) async {
  //   final scheduledTime = eventDate.add(Duration(
  //     hours: eventTime.hour,
  //     minutes: eventTime.minute,
  //   ));
  //   await flutterLocalNotificationsPlugin.zonedSchedule(
  //     id,
  //     title,
  //     body,
  //     tz.TZDateTime.from(scheduledTime, tz.local),
  //     notificationDetails,
  //     uiLocalNotificationDateInterpretation:
  //         UILocalNotificationDateInterpretation.absoluteTime,
  //     androidAllowWhileIdle: true,
  //     payload: payload,
  //     matchDateTimeComponents: dateTimeComponents,
  //   );
  // }

  Future<void> cancelNotification(int id) async {
    await flutterLocalNotificationsPlugin.cancel(id);
  }

  Future<void> cancelAllNotifications() async {
    await flutterLocalNotificationsPlugin.cancelAll();
  }
}

final localNotificationService = LocalNotificationService.instance;
