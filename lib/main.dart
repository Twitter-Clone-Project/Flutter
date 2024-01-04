import 'dart:io';

import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:x_clone/features/notifications/data/repositories/notifications_repository.dart';
import 'package:x_clone/utils/hive_manager.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:x_clone/web_services/notifications_services.dart';
import 'app/app.dart';
import 'package:workmanager/workmanager.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  await HiveManager.initHive();
  HttpOverrides.global = MyHttpOverrides();
  await NotificationServices.init();

  Workmanager().initialize(
      callbackDispatcher, // The top level function, aka callbackDispatcher
      isInDebugMode:
          false // If enabled it will post a notification whenever the task is running. Handy for debugging tasks
      );

  // await Firebase.initializeApp(
  //   options: DefaultFirebaseOptions.currentPlatform,
  // );
  //
  // await NotificationsHandler().init();
  runApp(const RootApp());
}

@pragma(
    'vm:entry-point') // Mandatory if the App is obfuscated or using Flutter 3.1+
void callbackDispatcher() {
  Workmanager().executeTask((task, inputData) async {
    var notifications =
        await NotificationsRepositoryImpl().getNotifications(page: 1);
    var lastNotification = notifications.data.first;
    if (lastNotification.isSeen) return Future.value(true);
    await NotificationServices.showNotification(
      title: "from @${lastNotification.senderUsername}",
      body: lastNotification.content,
      id: lastNotification.notificationId,
    );

    return Future.value(true);
  });
}

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}
