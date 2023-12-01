// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:flutter_test/flutter_test.dart';
// import 'package:x_clone/features/Profile/data/model/user_profile.dart';
// import 'package:x_clone/features/Profile/data/providers/profile_provider.dart';
// import 'package:x_clone/features/Profile/data/repositories/profile_repository.dart';
//
// void main() {
//   group('UserProfileNotifier Tests', () {
//     late UserProfileNotifier userProfileNotifier;
//     late ProfileRepositoryMock profileRepositoryMock;
//
//     setUp(() {
//       profileRepositoryMock = ProfileRepositoryMock();
//       userProfileNotifier = UserProfileNotifier(profileRepositoryMock as ProfileRepository, null);
//     });
//
//     test('fetchUserProfile updates state with UserProfile', () async {
//       final userId = '123';
//       await userProfileNotifier.fetchUserProfile(userId);
//
//       // Assuming ProfileRepositoryMock returns a UserProfile instance
//       expect(userProfileNotifier.state.userProfile, isA<UserProfile>());
//     });
//
//     // Add more tests for other UserProfileNotifier methods and state changes
//   });
// }
//
// class ProfileRepositoryMock extends ProfileRepository {
//   @override
//   Future<UserProfile?> fetchUserProfileData({required String userId}) async {
//     // Return a mock UserProfile for testing
//     return UserProfile(id: '123', name: 'John Doe', username: 'john_doe');
//   }
//
//   @override
//   Future<bool?> updateEmail({required String newEmail}) {
//     // TODO: implement updateEmail
//     throw UnimplementedError();
//   }
//
//   @override
//   Future<bool?> updateProfile({required String name, required String bio, required String website, required String location}) {
//     // TODO: implement updateProfile
//     throw UnimplementedError();
//   }
//
//   @override
//   Future<bool?> updateUsername({required String newUsername}) {
//     // TODO: implement updateUsername
//     throw UnimplementedError();
//   }
//
// }
