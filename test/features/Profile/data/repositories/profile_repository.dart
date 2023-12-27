import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:x_clone/features/Profile/data/model/user_profile.dart';
import 'package:x_clone/features/home/data/models/home_response.dart';
import 'package:x_clone/features/tweet/data/models/tweet_response.dart';
import 'package:x_clone/web_services/web_services.dart';
import 'package:x_clone/features/Profile/data/repositories/profile_repository.dart';

class MockDio extends Mock implements Dio {}

void main() {
  late ProfileRepositoryImpl profileRepository;
  late MockDio mockDio;

  setUp(() {
    mockDio = MockDio();
    profileRepository = ProfileRepositoryImpl();
  });

  group('ProfileRepository', () {
    test('fetchUserProfileData should return UserProfile on success', () async {
      // Arrange
      const username = 'testuser';
      final mockResponse = {
        "data": {"user": {"username": "testuser", "name": "Test User"}}
      };

      // Act
      final result = await profileRepository.fetchUserProfileData(username: username);

      // Assert
      expect(result, isA<UserProfile>());
      expect(result.username, equals('testuser'));
      expect(result.name, equals('Test User'));
    });

    test('fetchUserProfileData should throw an exception on error', () async {
      // Arrange
      const username = 'testuser';

      // Act & Assert
      expect(() => profileRepository.fetchUserProfileData(username: username), throwsException);
    });

    // Similar tests for getUserTweets, getUserLikedTweets, updateProfile, followUser, unfollowUser, muteUser, unmuteUser, blockUser, unblockUser, fetchFollowersData, fetchFollowingsData, fetchRepliersData, addTweet

    test('getUserTweets should return ProfileTweetsResponse on success', () async {
      // Arrange
      const username = 'testuser';
      const page = 1;
      final mockResponse = {
        "data": {"tweets": []}
      };

      // Act
      final result = await profileRepository.getUserTweets(username, page);

      // Assert
      expect(result, isA<ProfileTweetsResponse>());
    });

    // Add similar tests for other methods...

    test('addTweet should return Tweet on success', () async {
      // Arrange
      final mockResponse = {
        "data": {"tweet": {"id": "123", "text": "Test tweet"}}
      };

      // Act
      final result = await profileRepository.addTweet(tweetText: 'Test tweet');

      // Assert
      expect(result, isA<Tweet>());
      expect(result.id, equals('123'));
      expect(result.text, equals('Test tweet'));
    });

    // Add cleanup code for file resources if needed...
  });
}
