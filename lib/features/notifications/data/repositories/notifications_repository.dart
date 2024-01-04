import 'dart:io';

import 'package:dio/dio.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:x_clone/features/tweet/data/models/tweet_response.dart';
import 'package:x_clone/web_services/web_services.dart';

import 'package:socket_io_client/socket_io_client.dart' as IO;

import '../model/notifications.dart';

/// Abstract class representing a notifications repository.
///
/// This class defines the contract for fetching notifications.
abstract class NotificationsRepository {
  /// Fetches notifications based on the provided page number.
  ///
  /// Returns a [Future] that resolves to a [NotificationsList] object containing the fetched notifications.
  ///
  /// Throws an exception if an error occurs during the fetch process.
  Future<NotificationsList> getNotifications({required int page});
}

/// Implementation of the [NotificationsRepository] interface.
///
/// This class provides the implementation for fetching notifications.
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

/// Provider for the [NotificationsRepository] instance.
///
/// This provider is responsible for creating an instance of [NotificationsRepositoryImpl].
final notificationsRepositoryProvider =
    Provider<NotificationsRepository>((ref) {
  return NotificationsRepositoryImpl();
});
