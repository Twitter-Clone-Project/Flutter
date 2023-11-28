import 'package:flutter_test/flutter_test.dart';
import 'package:x_clone/features/Profile/data/model/user_profile.dart';
import 'package:x_clone/features/Profile/data/repositories/profile_repository.dart';

void main() {
  group('ProfileRepository Tests', () {
    late ProfileRepository profileRepository;

    setUp(() {
      profileRepository = ProfileRepositoryImpl();
    });

    test('fetchUserProfileData returns UserProfile', () async {
      final userId = '123';
      final userProfile = await profileRepository.fetchUserProfileData(userId: userId);

      expect(userProfile, isA<UserProfile>());
    });

    // Add more tests for other repository methods
  });
}
