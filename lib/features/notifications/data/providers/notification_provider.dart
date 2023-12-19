import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:x_clone/features/notifications/data/model/notifications.dart';
import 'package:x_clone/features/notifications/data/repositories/notifications_repository.dart';
import 'package:x_clone/features/notifications/data/state/notifications_state.dart';

class NotificationsNotifierProvider extends StateNotifier<NotificationsState> {
  final NotificationsRepository notificationsRepository;

  NotificationsNotifierProvider(this.notificationsRepository,
      [NotificationsState? state])
      : super(
          state ?? const NotificationsState(loading: true),
        ) {}

  init() {
    // fetchUserProfile(state.userProfile.username!);
    // getUserTweets(userId: state.userProfile.username!, page: 0);
    // getUserLikedTweets(userId: state.userProfile.username!, page: 1);
  }

  getNotifications({
    required int page,
  }) async {
    try {
      if (state.notifications.data.length > 0) {
        state = state.copyWith(loading: false);
      }

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
