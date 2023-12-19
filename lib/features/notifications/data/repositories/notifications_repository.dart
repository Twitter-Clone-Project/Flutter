import 'dart:io';

import 'package:dio/dio.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:x_clone/features/tweet/data/models/tweet_response.dart';
import 'package:x_clone/web_services/web_services.dart';

import 'package:socket_io_client/socket_io_client.dart' as IO;

import '../model/notifications.dart';

abstract class NotificationsRepository {
  Future<NotificationsList> getNotifications({required int page});
}

class NotificationsRepositoryImpl implements NotificationsRepository {
  @override
  Future<NotificationsList> getNotifications({required int page}) async {
    try {
      var response = await HttpClient.dio.get(EndPoints.getNotifications);
      if (response.statusCode == 200 || response.statusCode == 201) {
        List<dynamic> notificationData = response.data["data"]["notifications"];
        List<NotificationData> notifications = notificationData
            .map((notification) => NotificationData.fromJson(notification))
            .toList();
        return NotificationsList(data: notifications);
      }
      return [] as NotificationsList;
    } catch (e) {
      rethrow;
    }
  }

}

final notificationsRepositoryProvider =
    Provider<NotificationsRepository>((ref) {
  return NotificationsRepositoryImpl();
});
