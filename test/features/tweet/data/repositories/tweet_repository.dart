import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:x_clone/features/tweet/data/models/tweet_response.dart';
import 'package:x_clone/web_services/http_client.dart';
import 'package:x_clone/web_services/end_points.dart';
import 'package:x_clone/features/tweet/data/repositories/tweet_repository.dart';

class MockDio extends Mock implements Dio {}

void main() {
  late TweetRepositoryImpl tweetRepository;
  late MockDio mockDio;

  setUp(() {
    mockDio = MockDio();
    tweetRepository = TweetRepositoryImpl();
  });

  group('TweetRepository', () {
    test('fetchLikersData should return LikersList on success', () async {
      // Arrange
      final tweetId = '123';
      final mockResponse = {
        "data": [{"id": 1, "username": "user1"}, {"id": 2, "username": "user2"}]
      };

      // Act
      final result = await tweetRepository.fetchLikersData(tweetId: tweetId);

      // Assert
      expect(result, isA<LikersList>());
      expect(result.data, isNotEmpty);
      expect(result.data?[0].id, equals(1));
      expect(result.data?[1].id, equals(2));
    });

    test('fetchLikersData should return empty LikersList on error', () async {
      // Arrange
      final tweetId = '123';

      // Act
      final result = await tweetRepository.fetchLikersData(tweetId: tweetId);

      // Assert
      expect(result, isA<LikersList>());
      expect(result.data, isEmpty);
    });

    // Similar tests for fetchRetweetersData...

    test('fetchRetweetersData should return RetweetersList on success', () async {
      // Arrange
      final tweetId = '123';
      final mockResponse = {
        "data": [{"id": 1, "username": "user1"}, {"id": 2, "username": "user2"}]
      };

      // Act
      final result = await tweetRepository.fetchRetweetersData(tweetId: tweetId);

      // Assert
      expect(result, isA<RetweetersList>());
      expect(result.data, isNotEmpty);
      expect(result.data?[0].id, equals(1));
      expect(result.data?[1].id, equals(2));
    });

    test('fetchRetweetersData should return empty RetweetersList on error', () async {
      // Arrange
      final tweetId = '123';

      // Act
      final result = await tweetRepository.fetchRetweetersData(tweetId: tweetId);

      // Assert
      expect(result, isA<RetweetersList>());
      expect(result.data, isEmpty);
    });

  });
}
