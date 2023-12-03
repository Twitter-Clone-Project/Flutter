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

  init() {
    // getTimelineData(page: 1);
  }
  // getTimelineData({
  //   required int page,
  // }) async {
  //   try {
  //     if (page == 1) {
  //       state = state.copyWith(loading: true);
  //     }
  //     final HomeResponse homeResponse = await homeRepository.getTimeline(page);
  //     final List<Tweet> tweets;
  //
  //     if (page == 1) {
  //       tweets = homeResponse.data;
  //     } else {
  //       final oldList = List<Tweet>.from(state.homeResponse.data);
  //       oldList.addAll(homeResponse.data);
  //       tweets = oldList;
  //     }
  //     state = state.copyWith(
  //         homeResponse: state.homeResponse
  //             .copyWith(data: tweets, total: homeResponse.total),
  //         loading: false);
  //     return homeResponse;
  //   } catch (e) {
  //     state = state.copyWith(loading: false, errorMessage: e.toString());
  //     return const HomeResponse(data: [], total: 0);
  //   }
  // }
  // changePageIndex(index) {
  //   state = state.copyWith(screenIndex: index);
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
    required String userId,
    required int page,
  }) async {
    try {
      if (page == 1) {
        state = state.copyWith(loading: true);
      }
      final ProfileTweetsResponse profileTweetsResponse =
          await profileRepository.getUserTweets(userId, page);
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
          loading: false);
      return profileTweetsResponse;
    } catch (e) {
      state = state.copyWith(loading: false, errorMessage: e.toString());
      return const ProfileTweetsResponse(data: [], total: 0);
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
        state = state.copyWith(userProfile: result); 
        return true; 
      }
      state = state.copyWith(loading: false);
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
