import 'package:flutter/material.dart';
import 'package:x_clone/features/Profile/data/model/user_profile.dart';
import 'package:x_clone/features/Profile/data/repositories/profile_repository.dart';
import 'package:x_clone/features/Profile/data/states/profile_state.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../home/data/models/home_response.dart';

class ProfileNotifierProvider extends StateNotifier<UserProfileState> {

  final ProfileRepository profileRepository;

  ProfileNotifierProvider(this.profileRepository, [UserProfileState? state])
      : super(state ?? const UserProfileState(loading: true, userProfile: UserProfile(imageUrl: "", bannerUrl: ""))) {
    // Additional initialization if needed

  }

  // init() {
  //   fetchUserProfile(state.userProfile.username!);
  //   getUserTweets(userId: state.userProfile.username!, page: 0);
  //   getUserLikedTweets(userId: state.userProfile.username!, page: 1);
  // }

  Future<void> fetchUserProfile(String username) async {
    try {
      state = state.copyWith(loading: true, error: null);
      final userProfile =
          await profileRepository.fetchUserProfileData(username: username);
      state = state.copyWith(
          loading: false,
          userProfile:
              userProfile ?? const UserProfile(imageUrl: "", bannerUrl: ""));
    } catch (e) {
      state = state.copyWith(loading: false, error: e.toString());
    }
  }

  getUserTweets({
    required String username,
    required int page,
  }) async {
    try {
      if (page == 1) {
        state = state.copyWith(tweetsloading: true);
      }
      final ProfileTweetsResponse profileTweetsResponse =
          await profileRepository.getUserTweets(username, page);
      final List<Tweet> tweets;

      if (page == 1) {
        tweets = profileTweetsResponse.data;
      } else {
        final oldList = List<Tweet>.from(state.profileTweetsResponse.data);
        oldList.addAll(profileTweetsResponse.data);
        tweets = oldList;
      }
      state = state.copyWith(
          profileTweetsResponse: state.profileTweetsResponse
              .copyWith(data: tweets, total: profileTweetsResponse.total),
          tweetsloading: false);
      return profileTweetsResponse;
    } catch (e) {
      state = state.copyWith(tweetsloading: false, errorMessage: e.toString());
      return const ProfileTweetsResponse(data: [], total: 0);
    }
  }


  getUserLikedTweets({
    required String username,
    required int page,
  }) async {
    try {
      if (page == 1) {
        state = state.copyWith(loading: true);
      }
      final ProfileLikedTweetsResponse profileLikedTweetsResponse = await profileRepository.getUserLikedTweets(username, page);
      final List<Tweet> tweets;

      if (page == 1) {
        tweets = profileLikedTweetsResponse.data;
      } else {
        final oldList = List<Tweet>.from(state.profileLikedTweetsResponse.data);
        oldList.addAll(profileLikedTweetsResponse.data);
        tweets = oldList;
      }
      state = state.copyWith(
          profileLikedTweetsResponse: state.profileLikedTweetsResponse
              .copyWith(data: tweets, total: profileLikedTweetsResponse.total),
          loading: false);
      return profileLikedTweetsResponse;
    } catch (e) {
      state = state.copyWith(loading: false, errorMessage: e.toString());
      return const ProfileLikedTweetsResponse(data: [], total: 0);
    }
  }

  Future<bool?> updateUserProfile({
    String? profilePhoto,
    String? bannerPhoto,
    String? name,
    String? bio,
    String? website,
    String? location,
    String? birthDate,
  }) async {
    try {
      state = state.copyWith(loading: true);
      final result = await profileRepository.updateProfile(
        profilePhoto: profilePhoto,
        bannerPhoto: bannerPhoto,
        name: name,
        bio: bio,
        website: website,
        location: location,
        birthDate: birthDate,
      );

      if (result != null) {
        state = state.copyWith(userProfile: result, loading: false);
        return true;
      }
      //TODO Edit the following line to update the state to the newest updated user profile
      state = state.copyWith(loading: false);
    } catch (e) {
      state = state.copyWith(loading: false, error: e.toString());
    }
  }



  Future<void> followUser(String username) async {
    try {
      state = state.copyWith(loading: true);
      final result = await profileRepository.followUser(username: username);

      if (result == true) {
        // Handle success if needed, for example, refetch the updated profile
      }

      // TODO: Edit the following line to update the state to reflect the change in the user's follow status
      state = state.copyWith(loading: false);
    } catch (e) {
      state = state.copyWith(loading: false, error: e.toString());
    }
  }

  Future<void> unfollowUser(String username) async {
    try {
      state = state.copyWith(loading: true);
      final result = await profileRepository.unfollowUser(username: username);

      if (result == true) {
        // Handle success if needed, for example, refetch the updated profile
      }

      // TODO: Edit the following line to update the state to reflect the change in the user's follow status
      state = state.copyWith(loading: false);
    } catch (e) {
      state = state.copyWith(loading: false, error: e.toString());
    }
  }

  Future<void> muteUser(String username) async {
    try {
      state = state.copyWith(loading: true);
      final result = await profileRepository.muteUser(username: username);

      if (result == true) {
        // Handle success if needed, for example, refetch the updated profile
      }

      // TODO: Edit the following line to update the state to reflect the change in the user's mute status
      state = state.copyWith(loading: false);
    } catch (e) {
      state = state.copyWith(loading: false, error: e.toString());
    }
  }

  Future<void> unmuteUser(String username) async {
    try {
      state = state.copyWith(loading: true);
      final result = await profileRepository.unmuteUser(username: username);

      if (result == true) {
        // Handle success if needed, for example, refetch the updated profile
      }

      // TODO: Edit the following line to update the state to reflect the change in the user's mute status
      state = state.copyWith(loading: false);
    } catch (e) {
      state = state.copyWith(loading: false, error: e.toString());
    }
  }

  Future<void> blockOrUnblockUser(String username) async {
    try {
      state = state.copyWith(loading: true);
      final result = state.isBlocked
          ? await profileRepository.unblockUser(username: username)
          : await profileRepository.blockUser(username: username);

      if (result == true) {
        state = state.copyWith(isBlocked: !state.isBlocked, loading: false);
      }
    } catch (e) {
      state = state.copyWith(loading: false, error: e.toString());
    }
  }


}

final profileNotifierProvider =
    StateNotifierProvider<ProfileNotifierProvider, UserProfileState>((ref) {
  final profileRepository = ref.watch(profileRepositoryProvider);

  return ProfileNotifierProvider(profileRepository);
});


