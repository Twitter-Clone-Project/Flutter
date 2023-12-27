import 'package:flutter_test/flutter_test.dart';
import 'package:x_clone/features/auth/data/model/user.dart';

void main() {
  group('User Model', () {
    test('User.fromJson should parse JSON correctly', () {
      // Arrange
      final Map<String, dynamic> json = {
        'userId': '123',
        'name': 'John Doe',
        'username': 'john_doe',
        'screenName': 'JohnDoe',
        'email': 'john.doe@example.com',
        'imageUrl': 'https://example.com/image.jpg',
      };

      // Act
      final User user = User.fromJson(json);

      // Assert
      expect(user.userId, '123');
      expect(user.name, 'John Doe');
      expect(user.username, 'john_doe');
      expect(user.screenName, 'JohnDoe');
      expect(user.email, 'john.doe@example.com');
      expect(user.imageUrl, 'https://example.com/image.jpg');
    });

    test('User.toJson should convert User to JSON correctly', () {
      // Arrange
      final User user = User(
        userId: '123',
        name: 'John Doe',
        username: 'john_doe',
        screenName: 'JohnDoe',
        email: 'john.doe@example.com',
        imageUrl: 'https://example.com/image.jpg',
      );

      // Act
      final Map<String, dynamic> json = user.toJson();

      // Assert
      expect(json['userId'], '123');
      expect(json['name'], 'John Doe');
      expect(json['username'], 'john_doe');
      expect(json['screenName'], 'JohnDoe');
      expect(json['email'], 'john.doe@example.com');
      expect(json['imageUrl'], 'https://example.com/image.jpg');
      // Add assertions for other fields
    });
  });

  group('MutersList Model', () {
    test('MutersList.fromJson should parse JSON correctly', () {
      // Arrange
      final Map<String, dynamic> json = {
        'users': [
          {'userId': '1', 'username': 'user1'},
          {'userId': '2', 'username': 'user2'},
        ],
      };

      // Act
      final MutersList mutersList = MutersList.fromJson(json);

      // Assert
      expect(mutersList.users?.length, 2);
      expect(mutersList.users?[0].userId, '1');
      expect(mutersList.users?[0].username, 'user1');
      expect(mutersList.users?[1].userId, '2');
      expect(mutersList.users?[1].username, 'user2');
    });

    test('MutersList.toJson should convert MutersList to JSON correctly', () {
      // Arrange
      final MutersList mutersList = MutersList(
        users: [
          MuterData(userId: '1', username: 'user1'),
          MuterData(userId: '2', username: 'user2'),
        ],
      );

      // Act
      final Map<String, dynamic> json = mutersList.toJson();

      // Assert
      expect(json['users']?.length, 2);
      expect(json['users']?[0].userId, '1');
      expect(json['users']?[0].username, 'user1');
      expect(json['users']?[1].userId, '2');
      expect(json['users']?[1].username, 'user2');
    });

  });

  group('BlockersList Model', () {
    test('BlockersList.fromJson should parse JSON correctly', () {
      // Arrange
      final Map<String, dynamic> json = {
        'users': [
          {'userId': '1', 'username': 'user1'},
          {'userId': '2', 'username': 'user2'},
        ],
      };

      // Act
      final BlockersList blockersList = BlockersList.fromJson(json);

      // Assert
      expect(blockersList.users?.length, 2);
      expect(blockersList.users?[0].userId, '1');
      expect(blockersList.users?[0].username, 'user1');
      expect(blockersList.users?[1].userId, '2');
      expect(blockersList.users?[1].username, 'user2');
    });

    test('BlockersList.toJson should convert BlockersList to JSON correctly', () {
      // Arrange
      final BlockersList blockersList = BlockersList(
        users: [
          BlockerData(userId: '1', username: 'user1'),
          BlockerData(userId: '2', username: 'user2'),
        ],
      );

      // Act
      final Map<String, dynamic> json = blockersList.toJson();

      // Assert
      expect(json['users']?.length, 2);
      expect(json['users']?[0].userId, '1');
      expect(json['users']?[0].username, 'user1');
      expect(json['users']?[1].userId, '2');
      expect(json['users']?[1].username, 'user2');
    });
  });

}
