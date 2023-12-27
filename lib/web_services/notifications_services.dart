import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class NotificationServices {
  static final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  /// Initializes the notification services.
  ///
  /// This function sets up the necessary configurations for the notification services
  /// on both Android and iOS platforms. It initializes the Flutter Local Notifications Plugin
  /// and requests the necessary permissions for displaying notifications.
  ///
  /// Example:
  /// ```dart
  /// await NotificationsServices.init();
  /// ```
  ///
  /// Note: Make sure to call this function before using any other notification-related functions.
  static Future init() async {
    var androidInitialize =
        new AndroidInitializationSettings('@mipmap/ic_launcher');
    var iOSInitialize = new DarwinInitializationSettings();

    var initializationSettings = new InitializationSettings(
      android: androidInitialize,
      iOS: iOSInitialize,
    );

    flutterLocalNotificationsPlugin
        .resolvePlatformSpecificImplementation<
            AndroidFlutterLocalNotificationsPlugin>()!
        .requestNotificationsPermission();

    await flutterLocalNotificationsPlugin.initialize(initializationSettings);
  }

  /// Shows a notification with the given [title], [body], and [id].
  ///
  /// The [title] is the title of the notification.
  /// The [body] is the content of the notification.
  /// The [id] is a unique identifier for the notification.
  ///
  /// This method uses the [flutterLocalNotificationsPlugin] to display the notification.
  ///
  /// Example usage:
  /// ```dart
  /// await showNotification(
  ///   title: 'New Message',
  ///   body: 'You have a new message',
  ///   id: '123',
  /// );
  /// ```
  static Future<void> showNotification({
    required String title,
    required String body,
    required String id,
  }) async {
    AndroidNotificationDetails androidNotificationDetails =
        const AndroidNotificationDetails(
      'notification',
      'channelName',
      importance: Importance.max,
      priority: Priority.high,
    );
    DarwinNotificationDetails iOSNotificationDetails =
        const DarwinNotificationDetails(
      presentAlert: true,
      presentBadge: true,
      presentSound: true,
    );

    NotificationDetails notificationDetails = NotificationDetails(
      android: androidNotificationDetails,
      iOS: iOSNotificationDetails,
    );

    await flutterLocalNotificationsPlugin.show(
      int.tryParse(id) ?? 0,
      title,
      body,
      notificationDetails,
    );
  }
}