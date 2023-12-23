import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class NotificationServices {
  static final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  static Future init() async {
    var androidInitialize =
        new AndroidInitializationSettings('@mipmap/ic_launcher');
    // var iOSInitialize = new IOSInitializationSettings();

    var initializationSettings =
        new InitializationSettings(android: androidInitialize);

    flutterLocalNotificationsPlugin
        .resolvePlatformSpecificImplementation<
            AndroidFlutterLocalNotificationsPlugin>()!
        .requestNotificationsPermission();

    // flutterLocalNotificationsPlugin
    //     .resolvePlatformSpecificImplementation<
    //         AndroidFlutterLocalNotificationsPlugin>()!
    //     .requestExactAlarmsPermission();

    await flutterLocalNotificationsPlugin.initialize(initializationSettings);
  }

  static Future showNotification({
    required String title,
    required String body,
  }) async {
    AndroidNotificationDetails androidNotificationDetails =
        const AndroidNotificationDetails(
      'notification',
      'channelName',
      // playSound: true,
      // sound: RawResourceAndroidNotificationSound('notification'),
      importance: Importance.max,
      priority: Priority.high,
    );

    NotificationDetails notificationDetails =
        new NotificationDetails(android: androidNotificationDetails);

    await flutterLocalNotificationsPlugin.show(
      0,
      title,
      body,
      notificationDetails,
    );
  }

  // static void scheduleNotification() async {
  //   AndroidNotificationDetails androidNotificationDetails =
  //       const AndroidNotificationDetails(
  //     'notification',
  //     'channelName',
  //     // playSound: true,
  //     // sound: RawResourceAndroidNotificationSound('notification'),
  //     importance: Importance.max,
  //     priority: Priority.high,
  //   );

  //   var generalNotificationDetails =
  //       NotificationDetails(android: androidNotificationDetails);

  //   var scheduledTime =
  //       tz.TZDateTime.now(tz.local).add(const Duration(seconds: 5));

  //   await flutterLocalNotificationsPlugin.zonedSchedule(
  //       0,
  //       "Scheduled Task",
  //       "You scheduled a Local Notification",
  //       scheduledTime,
  //       generalNotificationDetails,
  //       androidScheduleMode: AndroidScheduleMode.inexactAllowWhileIdle,
  //       uiLocalNotificationDateInterpretation:
  //           UILocalNotificationDateInterpretation.absoluteTime);
  // }

//   Future showNotification({
//   required FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin,
//   }) async {
//   var androidDetails = AndroidNotificationDetails(
//       "channelId",
//       "channelName",
//       importance: Importance.high);
//   var generalNotificationDetails =
//       NotificationDetails(android: androidDetails);

//   await flutterLocalNotificationsPlugin.show(
//       0, "Task", "You created a Local Notification", generalNotificationDetails);
// }
}
