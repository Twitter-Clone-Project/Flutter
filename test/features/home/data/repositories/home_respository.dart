import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:x_clone/features/home/data/models/home_response.dart';
import 'package:x_clone/features/home/data/repositories/home_repository.dart';

class MockDio extends Mock implements Dio {}

void main() {
  late HomeRepositoryImpl homeRepository;

  setUp(() {
    homeRepository = HomeRepositoryImpl();
  });

  group('HomeRepository', () {
    test('getTimeline should return HomeResponse on success', () async {
      // Arrange
      final page = 1;
      final mockResponse = HomeResponse(data: [], total: 0);

      // Act
      final result = await homeRepository.getTimeline(page);

      // Assert
      expect(result, equals(mockResponse));
    });

    test('getTimeline should throw an exception on error', () async {
      // Arrange
      final page = 1;

      // Act & Assert
      expect(() => homeRepository.getTimeline(page), throwsException);
    });

    test('addLike should not throw an exception on success', () async {
      // Arrange
      final tweetId = '123';


      // Act & Assert
      expect(() => homeRepository.addLike(tweetId: tweetId), returnsNormally);
    });

    test('addLike should throw an exception on error', () async {
      // Arrange
      final tweetId = '123';


      // Act & Assert
      expect(() => homeRepository.addLike(tweetId: tweetId), throwsException);
    });

    // Similar tests for deleteLike, addRetweet, deleteRetweet, addReply, fetchRepliersData, deleteTweet, deleteReply

    test('addTweet should not throw an exception on success', () async {
      // Arrange
      final tweetText = 'Hello, world!';
      final media = [MultipartFile.fromString('media')];
      final trends = ['flutter'];


      // Act & Assert
      expect(
            () => homeRepository.addTweet(tweetText: tweetText, media: media, trends: trends),
        returnsNormally,
      );
    });

    test('addTweet should throw an exception on error', () async {
      // Arrange
      final tweetText = 'Hello, world!';
      final media = [MultipartFile.fromString('media')];
      final trends = ['flutter'];


      // Act & Assert
      expect(
            () => homeRepository.addTweet(tweetText: tweetText, media: media, trends: trends),
        throwsException,
      );
    });
  });
}
