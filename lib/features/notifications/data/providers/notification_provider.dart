import 'dart:io';

import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:x_clone/features/notifications/data/model/notifications.dart';
import 'package:x_clone/features/notifications/data/repositories/notifications_repository.dart';
import 'package:x_clone/features/notifications/data/state/notifications_state.dart';
import 'package:x_clone/web_services/socket_services.dart';

/// A provider class that manages the state and business logic for notifications.
class NotificationsNotifierProvider extends StateNotifier<NotificationsState> {
  final NotificationsRepository notificationsRepository;

  NotificationsNotifierProvider(this.notificationsRepository,
      [NotificationsState? state])
      : super(
          state ?? const NotificationsState(loading: true),
        ) {}

  /// Initializes the notification provider by setting up a socket client to listen for notification events.
  ///
  /// The [userId] parameter is used to identify the user for whom the notifications are being received.
  /// When a new notification is received, it is added to the top of the existing list of notifications.
  init(String userId) {
    SocketClient.onNotificationReceive(
      (data) {
        final oldList = List<NotificationData>.from(state.notifications.data);

        oldList.insert(0, NotificationData.fromJson(data));

        state = state.copyWith(notifications: NotificationsList(data: oldList));
      },
    );
  }

  /// Removes the listener for notification events.
  ///
  /// The [userId] parameter is used to identify the user for whom the notifications were being received.
  removeListener(String userId) {
    SocketClient.disconnectNotification();
  }

  /// Marks all notifications as seen for a specific user.
  ///
  /// The [userId] parameter is used to identify the user for whom the notifications should be marked as seen.
  /// This function updates the state by marking all notifications as seen and notifying the UI.
  markNotificationsAsSeen(String userId) {
    SocketClient.markNotificationsAsSeen(userId);
    state = state.copyWith(
        notifications: NotificationsList(
            data: state.notifications.data
                .map((e) => e.copyWith(isSeen: true))
                .toList()));
  }

  /// Retrieves notifications for a specific page.
  ///
  /// The [page] parameter specifies the page number of notifications to retrieve.
  /// This function updates the state with the retrieved notifications and notifies the UI.
  /// If the notifications list is empty, it sets the loading state to true.
  /// If an error occurs during the retrieval process, it sets the loading state to false and sets an error message.
  getNotifications({
    required int page,
  }) async {
    try {
      if (!state.notifications.data.isNotEmpty)
        state = state.copyWith(loading: true);

      final NotificationsList NotificationResponse =
          await notificationsRepository.getNotifications(page: page);

      final List<NotificationData> notifications;

      notifications = NotificationResponse.data;

      state = state.copyWith(
          loading: false,
          notifications: NotificationsList(data: notifications));
    } catch (e) {
      state = state.copyWith(loading: false, errorMessage: e.toString());
      return const NotificationsList(data: []);
    }
  }
}

/// A provider instance that can be used to access the notifications notifier provider.
final notificationsNotifierProvider =
    StateNotifierProvider<NotificationsNotifierProvider, NotificationsState>(
        (ref) {
  final notificationsRepository = ref.watch(notificationsRepositoryProvider);

  return NotificationsNotifierProvider(notificationsRepository);
});
