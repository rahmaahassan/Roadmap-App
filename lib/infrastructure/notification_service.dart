// import 'package:flutter/material.dart';
// import 'package:flutter_local_notifications/flutter_local_notifications.dart';
//
// import 'push_notification_service.dart';
//
// Future<void> init() async {
//   final AndroidInitializationSettings initializationSettingsAndroid =
//   AndroidInitializationSettings('app_icon');
//
//   final IOSInitializationSettings initializationSettingsIOS =
//   IOSInitializationSettings(
//     requestSoundPermission: false,
//     requestBadgePermission: false,
//     requestAlertPermission: false,
//     onDidReceiveLocalNotification: NotificationApi.showNotification(),
//   );
//
//   final InitializationSettings initializationSettings =
//   InitializationSettings(
//       android: initializationSettingsAndroid,
//       iOS: initializationSettingsIOS,
//       macOS: null);
//
//   await flutterLocalNotificationsPlugin.initialize(initializationSettings,
//       onSelectNotification: selectNotification);
// }
