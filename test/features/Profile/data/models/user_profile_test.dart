// import 'package:flutter_test/flutter_test.dart';
// import 'package:x_clone/features/Profile/data/model/user_profile.dart';
//
//
// void main() {
//   group('UserProfile', () {
//     test('fromJson should correctly deserialize JSON', () {
//       // Example JSON data representing a user profile
//       final jsonMap = {
//         'id': '1',
//         'name': 'John Doe',
//         'username': 'john_doe',
//         'bio': 'Software Developer',
//         'website': 'https://www.johndoe.com',
//         'location': 'City',
//         'profileImageUrl': 'https://www.example.com/image.jpg',
//         'createdAt': '2023-01-01T12:00:00Z',
//       };
//
//       // Deserialize the JSON into a UserProfile object
//       final userProfile = UserProfile.fromJson(jsonMap);
//
//       // Assert the properties of the UserProfile object
//       expect(userProfile.userId, '27');
//
//     });
//
//     test('toJson should correctly serialize to JSON', () {
//       // Create a UserProfile object
//       final userProfile = UserProfile(
//         id: '1',
//         name: 'John Doe',
//         username: 'john_doe',
//         bio: 'Software Developer',
//         website: 'https://www.johndoe.com',
//         location: 'City',
//         profileImageUrl: 'https://www.example.com/image.jpg',
//         createdAt: '2023-01-01T12:00:00Z',
//       );
//
//       // Serialize the UserProfile object to JSON
//       final jsonMap = userProfile.toJson();
//
//       // Assert the JSON map
//       expect(jsonMap['id'], '1');
//       expect(jsonMap['name'], 'John Doe');
//       expect(jsonMap['username'], 'john_doe');
//       expect(jsonMap['bio'], 'Software Developer');
//       expect(jsonMap['website'], 'https://www.johndoe.com');
//       expect(jsonMap['location'], 'City');
//       expect(jsonMap['profileImageUrl'], 'https://www.example.com/image.jpg');
//       expect(jsonMap['createdAt'], '2023-01-01T12:00:00Z');
//     });
//   });
// }
