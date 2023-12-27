import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:x_clone/features/notifications/data/repositories/notifications_repository.dart';

class MockDio extends Mock implements Dio {}

void main() {
  late NotificationsRepositoryImpl notificationsRepository;
  late MockDio mockDio;

  setUp(() {
    mockDio = MockDio();
    notificationsRepository = NotificationsRepositoryImpl();
  });

  group('NotificationsRepository', () {
    test('getNotifications should return NotificationsList on success', () async {
      // Arrange
      final page = 1;
      final mockResponse = {
        "data": {
          "notifications": [
            {"id": 1, "message": "Notification 1"},
            {"id": 2, "message": "Notification 2"},
          ]
        }
      };

      // Act
      final result = await notificationsRepository.getNotifications(page: page);

      // Assert
      expect(result.data, isNotNull);
      expect(result.data?.length, equals(2));
    });

    test('getNotifications should return empty NotificationsList on error', () async {
      // Arrange
      final page = 1;


      // Act
      final result = await notificationsRepository.getNotifications(page: page);

      // Assert
      expect(result.data, isEmpty);
    });
  });
}
