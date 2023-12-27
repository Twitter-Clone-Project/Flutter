import 'package:flutter_test/flutter_test.dart';
import 'package:x_clone/features/auth/data/model/user.dart';
import 'package:x_clone/features/home/data/models/home_response.dart';

void main() {
  group('HomeResponse Model', () {
    test('HomeResponse.fromJson should parse JSON correctly', () {
      // Arrange
      final Map<String, dynamic> json = {
        'data': [
          {
            'id': 'tweet1',
            'text': 'Hello, Twitter!',
            'createdAt': '2022-01-01T12:00:00Z',
            'isRetweet': false,
            'user': {
              'userId': 'user1',
              'name': 'User 1',
              'username': 'user1_username',
              'screenName': 'User1',
              'email': 'user1@example.com',
              'imageUrl': 'https://example.com/user1.jpg',
              'bannerUrl': 'https://example.com/banner1.jpg',
              'followingsCount': '50',
              'followersCount': '100',
              'birthDate': '1990-01-01',
              'bio': 'This is the bio.',
              'location': 'City, Country',
              'website': 'https://example.com',
              'isConfirmed': true,
              'isOnline': false,
            },
            'retweetedUser': null,
            'attachmentsUrl': ['https://example.com/attachment1.jpg'],
            'isLiked': true,
            'isRetweeted': false,
            'isReplied': false,
            'likesCount': 10,
            'retweetsCount': 5,
            'repliesCount': 2,
          },
            
        ],
        'total': 1,
      };

      // Act
      final HomeResponse homeResponse = HomeResponse.fromJson(json);

      // Assert
      expect(homeResponse.data.length, 1);
      expect(homeResponse.data[0].id, 'tweet1');
      expect(homeResponse.data[0].text, 'Hello, Twitter!');
      expect(homeResponse.data[0].user?.userId, 'user1');
        
    });

    test('HomeResponse.toJson should convert HomeResponse to JSON correctly', () {
      // Arrange
      const HomeResponse homeResponse = HomeResponse(
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
              screenName: 'User1',
              email: 'user1@example.com',
              imageUrl: 'https://example.com/user1.jpg',
              bannerUrl: 'https://example.com/banner1.jpg',
              followingsCount: '50',
              followersCount: '100',
              birthDate: '1990-01-01',
              bio: 'This is the bio.',
              location: 'City, Country',
              website: 'https://example.com',
              isConfirmed: true,
              isOnline: false,
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
      final Map<String, dynamic> json = homeResponse.toJson();

      // Assert
      expect(json['data']?.length, 1);
      expect(json['data']?[0].id, 'tweet1');
      expect(json['data']?[0].text, 'Hello, Twitter!');
      expect(json['data']?[0].user?.userId, 'user1');
      
    });
  });
}