import 'package:flutter_test/flutter_test.dart';
import 'package:x_clone/features/Profile/data/model/user_profile.dart';
import 'package:x_clone/features/auth/data/model/user.dart';
import 'package:x_clone/features/home/data/models/home_response.dart';

void main() {
  group('UserProfile Model', () {
    test('UserProfile.toJson should convert UserProfile to JSON correctly', () {
      // Arrange
      const UserProfile userProfile = UserProfile(
        userId: 'user1',
        name: 'User 1',
        username: 'user1_username',
        bio: 'This is the bio.',
        website: 'https://example.com',
        location: 'City, Country',
        imageUrl: 'https://example.com/user1.jpg',
        bannerUrl: 'https://example.com/banner1.jpg',
        birthDate: '1990-01-01',
        createdAt: '2022-01-01',
        isFollowed: true,
        isConfirmed: true,
        isFollowing: true,
        isMuted: false,
        isBlocked: false,
        isBlockingMe: false,
        followersCount: '100',
        followingsCount: '50',
      );

      // Act
      final Map<String, dynamic> json = userProfile.toJson();

      // Assert
      expect(json['userId'], 'user1');
      expect(json['name'], 'User 1');
      expect(json['username'], 'user1_username');
      expect(json['bio'], 'This is the bio.');
      expect(json['website'], 'https://example.com');
      expect(json['location'], 'City, Country');
      expect(json['imageUrl'], 'https://example.com/user1.jpg');
      expect(json['bannerUrl'], 'https://example.com/banner1.jpg');
      expect(json['birthDate'], '1990-01-01');
      expect(json['createdAt'], '2022-01-01');
      expect(json['isFollowed'], true);
      expect(json['isConfirmed'], true);
      expect(json['isFollowing'], true);
      expect(json['isMuted'], false);
      expect(json['isBlocked'], false);
      expect(json['isBlockingMe'], false);
      expect(json['followersCount'], '100');
      expect(json['followingsCount'], '50');
      
    });
  });

  group('ProfileTweetsResponse Model', () {
    test('ProfileTweetsResponse.toJson should convert ProfileTweetsResponse to JSON correctly', () {
      // Arrange
      const ProfileTweetsResponse profileTweetsResponse = ProfileTweetsResponse(
        data: [
          Tweet(
            id: 'tweet1',
            text: 'Hello, Twitter!',
            createdAt: '2022-01-01T12:00:00Z',
            isRetweet: false,
            user: User(
              userId: 'user1',
              name: 'User 1',
              username: 'user1_username',
              
            ),
            retweetedUser: null,
            attachmentsUrl: ['https://example.com/attachment1.jpg'],
            isLiked: true,
            isRetweeted: false,
            isReplied: false,
            likesCount: 10,
            retweetsCount: 5,
            repliesCount: 2,
          ),
        ],
        total: 1,
      );

      // Act
      final Map<String, dynamic> json = profileTweetsResponse.toJson();

      // Assert
      expect(json['data']?.length, 1);
      
    });
  });

  group('ProfileLikedTweetsResponse Model', () {
    test('toJson should convert ProfileLikedTweetsResponse to JSON correctly', () {
      // Arrange
      const ProfileLikedTweetsResponse profileLikedTweetsResponse = ProfileLikedTweetsResponse(
        data: [
          Tweet(
            id: 'tweet1',
            text: 'Hello, Twitter!',
            createdAt: '2022-01-01T12:00:00Z',
            isRetweet: false,
            user: User(
              userId: 'user1',
              name: 'User 1',
              username: 'user1_username',
              
            ),
            retweetedUser: null,
            attachmentsUrl: ['https://example.com/attachment1.jpg'],
            isLiked: true,
            isRetweeted: false,
            isReplied: false,
            likesCount: 10,
            retweetsCount: 5,
            repliesCount: 2,
          ),
        ],
        total: 1,
      );

      // Act
      final Map<String, dynamic> json = profileLikedTweetsResponse.toJson();

      // Assert
      expect(json['data']?.length, 1);
      
    });
  });

  group('FollowerData Model', () {
    test('FollowerData.toJson should convert FollowerData to JSON correctly', () {
      // Arrange
      const FollowerData followerData = FollowerData(
        userId: 'user1',
        username: 'user1_username',
        name: 'User 1',
        bio: 'This is the bio.',
        imageUrl: 'https://example.com/user1.jpg',
        isFollowed: true,
        isFollowing: true,
        followersCount: '100',
        followingCount: '50',
      );

      // Act
      final Map<String, dynamic> json = followerData.toJson();

      // Assert
      expect(json['userId'], 'user1');
      expect(json['username'], 'user1_username');
      expect(json['name'], 'User 1');
      expect(json['bio'], 'This is the bio.');
      expect(json['imageUrl'], 'https://example.com/user1.jpg');
      expect(json['isFollowed'], true);
      expect(json['isFollowing'], true);
      expect(json['followersCount'], '100');
      expect(json['followingCount'], '50');
      
    });
  });

  group('FollowersList Model', () {
    test('FollowersList.toJson should convert FollowersList to JSON correctly', () {
      // Arrange
      const FollowersList followersList = FollowersList(
        data: [
          FollowerData(
            userId: 'user1',
            username: 'user1_username',
            name: 'User 1',
            
          ),
        ],
      );

      // Act
      final Map<String, dynamic> json = followersList.toJson();

      // Assert
      expect(json['data']?.length, 1);
      
    });
  });

  group('FollowingData Model', () {
    test('FollowingData.toJson should convert FollowingData to JSON correctly', () {
      // Arrange
      const FollowingData followingData = FollowingData(
        userId: 'user1',
        username: 'user1_username',
        name: 'User 1',
        bio: 'This is the bio.',
        imageUrl: 'https://example.com/user1.jpg',
        isFollowed: true,
        isFollowing: true,
        followersCount: '100',
        followingCount: '50',
      );

      // Act
      final Map<String, dynamic> json = followingData.toJson();

      // Assert
      expect(json['userId'], 'user1');
      expect(json['username'], 'user1_username');
      expect(json['name'], 'User 1');
      expect(json['bio'], 'This is the bio.');
      expect(json['imageUrl'], 'https://example.com/user1.jpg');
      expect(json['isFollowed'], true);
      expect(json['isFollowing'], true);
      expect(json['followersCount'], '100');
      expect(json['followingCount'], '50');
      
    });
  });

  group('FollowingsList Model', () {
    test('FollowingsList.toJson should convert FollowingsList to JSON correctly', () {
      // Arrange
      const FollowingsList followingsList = FollowingsList(
        data: [
          FollowingData(
            userId: 'user1',
            username: 'user1_username',
            name: 'User 1',
            
          ),
        ],
      );

      // Act
      final Map<String, dynamic> json = followingsList.toJson();

      // Assert
      expect(json['data']?.length, 1);
      expect(json['data']?[0]['userId'], 'user1');
      expect(json['data']?[0]['username'], 'user1_username');
      expect(json['data']?[0]['name'], 'User 1');
      
    });
  });

}
