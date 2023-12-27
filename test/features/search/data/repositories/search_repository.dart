import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:x_clone/features/search/data/models/search_response.dart';
import 'package:x_clone/web_services/http_client.dart';
import 'package:x_clone/web_services/end_points.dart';
import 'package:x_clone/features/search/data/repositories/search_repository.dart';

class MockDio extends Mock implements Dio {}

void main() {
  late SearchRepositoryImpl searchRepository;
  late MockDio mockDio;

  setUp(() {
    mockDio = MockDio();
    searchRepository = SearchRepositoryImpl();
  });

  group('SearchRepository', () {
    test('fetchTrendingData should return TrendingList on success', () async {
      // Arrange
      final mockResponse = {
        "data": [{"id": 1, "name": "Trending 1"}, {"id": 2, "name": "Trending 2"}]
      };

      // Act
      final result = await searchRepository.fetchTrendingData();

      // Assert
      expect(result, isA<TrendingList>());
      expect(result.data, isNotEmpty);
    });

    test('fetchTrendingData should return empty TrendingList on error', () async {
      // Arrange

      // Act
      final result = await searchRepository.fetchTrendingData();

      // Assert
      expect(result, isA<TrendingList>());
      expect(result.data, isEmpty);
    });

    // Similar tests for searchUsers, searchTweets...

    test('searchUsers should return UsersList on success', () async {
      // Arrange
      final query = 'test';
      final page = 1;
      final mockResponse = {
        "data": [{"id": 1, "username": "user1"}, {"id": 2, "username": "user2"}]
      };

      // Act
      final result = await searchRepository.searchUsers(query: query, page: page);

      // Assert
      expect(result, isA<UsersList>());
      expect(result.data, isNotEmpty);
      expect(result.data?[0].id, equals(1));
      expect(result.data?[0].username, equals("user1"));
      expect(result.data?[1].id, equals(2));
      expect(result.data?[1].username, equals("user2"));
    });

    // Add similar tests for searchTweets...

    test('searchTweets should return TweetList on success', () async {
      // Arrange
      final query = 'test';
      final page = 1;
      final mockResponse = {
        "data": [{"id": 1, "text": "Tweet 1"}, {"id": 2, "text": "Tweet 2"}]
      };


      // Act
      final result = await searchRepository.searchTweets(query: query, page: page);

      // Assert
      expect(result, isA<TweetList>());
      expect(result.data, isNotEmpty);
    });

  });
}
