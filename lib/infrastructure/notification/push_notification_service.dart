import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:rxdart/subjects.dart';

import 'notification_service.dart';

class NotificationApi {
  static final _notifications = FlutterLocalNotificationsPlugin();
  static final onNotifications = BehaviorSubject<String?>();

  static Future _notificationDetails() async{
    return const NotificationDetails(
        android: AndroidNotificationDetails(
            'channel id',
            'channel name',
            importance: Importance.max
        ),
        iOS: IOSNotificationDetails()
    );
  }

  static Future init({bool initScheduled = false}) async {
   final android = const AndroidInitializationSettings('@mipmap/ic_launcher');
   final iOS = const IOSInitializationSettings();
   final settings = InitializationSettings(android: android, iOS: iOS);

   await _notifications.initialize(settings, onSelectNotification: (payload) async {
     onNotifications.add(payload);
   });
  }

  static Future showNotification({
    int id = 0,
    String? title, body, payload,
  }) async => _notifications.show(id, title, body, await _notificationDetails(), payload: payload);

  static Future<void> activateDailyNotification() async {
    var time = const Time(11, 0, 0);
    var time2 = const Time(22, 0, 0);
    var androidPlatformChannelSpecifics = const AndroidNotificationDetails(
        'channel id',
        'channel name',
        priority: Priority.max,
        playSound: true,
        importance: Importance.max
    );
    var iOSPlatformChannelSpecifics = const IOSNotificationDetails(presentSound: true);
    var platformChannelSpecifics = NotificationDetails(
        android: androidPlatformChannelSpecifics, iOS: iOSPlatformChannelSpecifics);

    await flutterLocalNotificationsPlugin.showDailyAtTime(
        1,
        'Hello Coder!',
        'First, solve the problem. Then, write the code.',
        time,
        platformChannelSpecifics
    );

    await flutterLocalNotificationsPlugin.showDailyAtTime(
        2,
        'Don\'t forget to learn some code today',
        '',
        time2,
        platformChannelSpecifics
    );
    await notificationActivated();
  }

  static Future<void> notificationActivated() async {
    var androidPlatformChannelSpecifics = const AndroidNotificationDetails(
      ' other channel id',
      ' other channel name',
      playSound: true,
      priority: Priority.max,
      importance: Importance.max,
    );
    var iOSPlatformChannelSpecifics =
    const IOSNotificationDetails();
    var platformChannelSpecifics = NotificationDetails(
        android: androidPlatformChannelSpecifics, iOS: iOSPlatformChannelSpecifics);
    await flutterLocalNotificationsPlugin.show(
        0,
        'Notification is Activated',
        null,
        platformChannelSpecifics);
  }
}