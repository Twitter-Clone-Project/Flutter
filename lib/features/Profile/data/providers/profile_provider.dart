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

  Future<void> toggleMuteStatus(String username) async {
    try {
      state = state.copyWith(loading: true);

      // Toggle the mute status in the local state
      state = state.copyWith(
        userProfile: state.userProfile.copyWith(
          isMuted: !state.userProfile.isMuted!,
        ),
        loading: false,
      );

      // Perform the asynchronous mute/unmute operation
      if (!state.userProfile.isMuted!) {
        await profileRepository.unmuteUser(username: username);
      } else {
        await profileRepository.muteUser(username: username);
      }
    } catch (e) {
      // If the asynchronous operation fails, revert the local state to the original mute status
      state = state.copyWith(
        userProfile: state.userProfile.copyWith(
          isMuted: !state.userProfile.isMuted!,
        ),
        loading: false,
      );

      // Handle the error as needed
      state = state.copyWith(loading: false, error: e.toString());
    }
  }

  Future<void> toggleFollowStatus(String username) async {
    var isFollowed = state.userProfile.isFollowed!;

    var oldfollowersCount = state.userProfile.followersCount!;

    int currentCount = int.parse(oldfollowersCount);
    int newCount;

    if(isFollowed){
      newCount = currentCount - 1;
    }
    else {
      newCount = currentCount + 1;
    }
    var newfollowersCount = newCount.toString();

    try {


      state = state.copyWith(loading: true);
      state = state.copyWith(
        userProfile: state.userProfile.copyWith(
          isFollowed: !state.userProfile.isFollowed!,
          followersCount: newfollowersCount
        ),
        loading: false,
      );

      // Perform the asynchronous follow/unfollow operation
      if (isFollowed) {
        await profileRepository.unfollowUser(username: username);
      } else {
        await profileRepository.followUser(username: username);
      }


    } catch (e) {
      // If the asynchronous operation fails, revert the local state to the original follow status
      state = state.copyWith(
        userProfile: state.userProfile.copyWith(
          isFollowed: !state.userProfile.isFollowed!,
            followersCount: oldfollowersCount
        ),
        loading: false,
      );

      // Handle the error as needed
      state = state.copyWith(loading: false, error: e.toString());
    }
  }

  Future<void> toggleBlockStatus(String username) async {
    var isBlocked = state.userProfile.isBlocked!;
    var isFollowed_tmp = state.userProfile.isFollowed!;

    var oldfollowersCount = state.userProfile.followersCount!;
    int newCount = int.parse(state.userProfile.followersCount!) - 1;
    var newfollowersCount;
    if (isFollowed_tmp){
      newfollowersCount = newCount.toString();
    }
    else{
      newfollowersCount = oldfollowersCount;
    }


    try {
      state = state.copyWith(loading: true);
      state = state.copyWith(
        userProfile: state.userProfile.copyWith(
          isBlocked: !state.userProfile.isBlocked!,
          isFollowed: false,
            followersCount: newfollowersCount
        ),
        loading: false,
      );

      if (isBlocked) {
        await profileRepository.unblockUser(username: username);
      } else {
        await profileRepository.blockUser(username: username);
      }
    } catch (e) {
      // If the asynchronous operation fails, revert the local state to the original block status
      state = state.copyWith(
        userProfile: state.userProfile.copyWith(
          isBlocked: !state.userProfile.isBlocked!,
            isFollowed: isFollowed_tmp,
            followersCount: oldfollowersCount
        ),
        loading: false,
      );

      // Handle the error as needed
      state = state.copyWith(loading: false, error: e.toString());
    }
  }



}

final profileNotifierProvider =
    StateNotifierProvider<ProfileNotifierProvider, UserProfileState>((ref) {
  final profileRepository = ref.watch(profileRepositoryProvider);

  return ProfileNotifierProvider(profileRepository);
});


