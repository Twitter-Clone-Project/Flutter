
import 'package:flutter_test/flutter_test.dart';
import 'package:x_clone/features/home/data/models/home_response.dart';
import 'package:x_clone/features/search/data/models/search_response.dart';

void main() {
  group('TrendingList', () {
    test('fromJson should parse JSON correctly', () {
      // Arrange
      final Map<String, dynamic> json = {
        'data': [
          {'name': 'Trend 1'},
          {'name': 'Trend 2'},
        ],
      };

      // Act
      final TrendingList trendingList = TrendingList.fromJson(json);

      // Assert
      expect(trendingList.data?.length, 2);
      expect(trendingList.data?[0].name, 'Trend 1');
      expect(trendingList.data?[1].name, 'Trend 2');
    });

    test('toJson should convert TrendingList to JSON correctly', () {
      // Arrange
      const TrendingList trendingList = TrendingList(
        data: [
          TrendData(name: 'Trend 1'),
          TrendData(name: 'Trend 2'),
        ],
      );

      // Act
      final Map<String, dynamic> json = trendingList.toJson();

      // Assert
      expect(json['data']?.length, 2);
    });
  });

  group('UsersList', () {
    test('fromJson should parse JSON correctly', () {
      // Arrange
      final Map<String, dynamic> json = {
        'data': [
          {'id': '1', 'username': 'user1'},
          {'id': '2', 'username': 'user2'},
        ],
        'total': 2,
      };

      // Act
      final UsersList usersList = UsersList.fromJson(json);

      // Assert
      expect(usersList.data.length, 2);
      expect(usersList.data[0].id, '1');
      expect(usersList.data[1].id, '2');
      expect(usersList.total, 2);
    });

    test('toJson should convert UsersList to JSON correctly', () {
      // Arrange
      const UsersList usersList = UsersList(
        data: [
          UserData(id: '1', username: 'user1'),
          UserData(id: '2', username: 'user2'),
        ],
        total: 2,
      );

      // Act
      final Map<String, dynamic> json = usersList.toJson();

      // Assert
      expect(json['data']?.length, 2);
    });
  });

  group('TweetList', () {
    test('fromJson should parse JSON correctly', () {
      // Arrange
      final Map<String, dynamic> json = {
        'data': [
          {'id': 'tweet1', 'text': 'Hello, Twitter!'},
          {'id': 'tweet2', 'text': 'Another tweet'},
        ],
        'total': 2,
      };

      // Act
      final TweetList tweetList = TweetList.fromJson(json);

      // Assert
      expect(tweetList.data.length, 2);
      expect(tweetList.data[0].id, 'tweet1');
      expect(tweetList.data[1].id, 'tweet2');
      expect(tweetList.total, 2);
    });

    test('toJson should convert TweetList to JSON correctly', () {
      // Arrange
      TweetList tweetList = const TweetList(
        data: [
          Tweet(id: 'tweet1', text: 'Hello, Twitter!'),
          Tweet(id: 'tweet2', text: 'Another tweet'),
        ],
        total: 2,
      );

      // Act
      final Map<String, dynamic> json = tweetList.toJson();

      // Assert
      expect(json['data']?.length, 2);
    });
  });
}
