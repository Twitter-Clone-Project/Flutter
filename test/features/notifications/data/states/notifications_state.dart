import 'package:flutter_test/flutter_test.dart';
import 'package:x_clone/features/notifications/data/model/notifications.dart';
import 'package:x_clone/features/notifications/data/state/notifications_state.dart';

void main() {
  group('NotificationsState', () {
    test('equality', () {
      const notificationsState1 = NotificationsState(
        notifications: NotificationsList(data: []),
        loading: true,
        errorMessage: null,
        screenIndex: 0,
      );

      const notificationsState2 = NotificationsState(
        notifications: NotificationsList(data: []),
        loading: true,
        errorMessage: null,
        screenIndex: 0,
      );

      expect(notificationsState1, notificationsState2);
    });

    test('custom error message', () {
      const notificationsState = NotificationsState(
        // ... set other default values ...
        errorMessage: 'Custom error message',
      );

      expect(notificationsState.errorMessage, 'Custom error message');
    });

  });
}
