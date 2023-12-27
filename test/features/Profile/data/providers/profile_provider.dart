import 'package:flutter_test/flutter_test.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:mockito/mockito.dart';
import 'package:x_clone/features/Profile/data/model/user_profile.dart';
import 'package:x_clone/features/Profile/data/providers/profile_provider.dart';
import 'package:x_clone/features/Profile/data/repositories/profile_repository.dart';
import 'package:x_clone/features/Profile/data/states/profile_state.dart';

class MockProfileRepository extends Mock implements ProfileRepository {}

void main() {
  group('ProfileNotifierProvider', () {
    late ProfileNotifierProvider profileNotifier;
    late MockProfileRepository mockProfileRepository;

    setUp(() {
      mockProfileRepository = MockProfileRepository();
      profileNotifier = ProfileNotifierProvider(mockProfileRepository);
    });

    test('initial state is correct', () {
      expect(profileNotifier.state, UserProfileState(
        loading: true,
        userProfile: UserProfile(imageUrl: "", bannerUrl: ""),
      ));
    });

    group('fetchUserProfile', () {
      test(
          'sets loading to true and updates state on successful data fetch',
              () async {
            // Arrange
            final mockUserProfile = UserProfile(imageUrl: '', bannerUrl: '');

            // Act
            profileNotifier.fetchUserProfile("mou");

            // Assert
            expect(profileNotifier.state.loading, false);
            expect(profileNotifier.state.userProfile, mockUserProfile);
          });

      test('ProfileNotifierProvider initialization', () {
        // Arrange & Act
        final provider = ProfileNotifierProvider(MockProfileRepository());

        // Assert
        expect(provider, isNotNull);
        expect(provider.state, UserProfileState(
          loading: true,
          userProfile: UserProfile(imageUrl: "", bannerUrl: ""),
        ));
      });

      test('init method sets loading to true', () {
        // Arrange & Act
        profileNotifier.init();

        // Assert
        expect(profileNotifier.state.loading, true);
      });

      test('loadProfile method sets loading to true', () {
        // Arrange & Act
        profileNotifier.loadProfile();

        // Assert
        expect(profileNotifier.state.loading, true);
      });

      test('resetSearchedUsers method resets profile responses', () {
        // Arrange & Act
        profileNotifier.resetSearchedUsers();

        // Assert
        expect(profileNotifier.state.profileTweetsResponse.data, isEmpty);
        expect(profileNotifier.state.profileLikedTweetsResponse.data, isEmpty);
      });


    });
  });
}
