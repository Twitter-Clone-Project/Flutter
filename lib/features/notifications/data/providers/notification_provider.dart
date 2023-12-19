import 'dart:io';

import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:x_clone/features/notifications/data/model/notifications.dart';
import 'package:x_clone/features/notifications/data/repositories/notifications_repository.dart';
import 'package:x_clone/features/notifications/data/state/notifications_state.dart';
import 'package:x_clone/web_services/socket_services.dart';

class NotificationsNotifierProvider extends StateNotifier<NotificationsState> {
  final NotificationsRepository notificationsRepository;

  NotificationsNotifierProvider(this.notificationsRepository,
      [NotificationsState? state])
      : super(
          state ?? const NotificationsState(loading: true),
        ) {}

  init() {
    if (!SocketClient.socket.connected) {
      SocketClient.onNotificationReceive((data) {
        state.copyWith(loading: true);
        final oldList = List<NotificationData>.from(state.notifications.data);

        oldList.insert(0, NotificationData.fromJson(data));

        state = state.copyWith(notifications: NotificationsList(data: oldList));
      });
      SocketClient.connect();
    }
  }

  getNotifications({
    required int page,
  }) async {
    try {
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

final notificationsNotifierProvider =
    StateNotifierProvider<NotificationsNotifierProvider, NotificationsState>(
        (ref) {
  final notificationsRepository = ref.watch(notificationsRepositoryProvider);

  return NotificationsNotifierProvider(notificationsRepository);
});