import 'package:freezed_annotation/freezed_annotation.dart';

import '../model/user_profile.dart';

part 'profile_state.freezed.dart';

@freezed
class UserProfileState with _$UserProfileState {
  const factory UserProfileState({
    @Default(ProfileTweetsResponse(data: [],total:0)) ProfileTweetsResponse profileTweetsResponse,
    @Default(ProfileLikedTweetsResponse(data: [],total:0)) ProfileLikedTweetsResponse profileLikedTweetsResponse,
    @Default(UserProfile(imageUrl: "", bannerUrl: "")) UserProfile userprofile,
    @Default(FollowersList(data: [])) FollowersList followersList,
    @Default(FollowingsList(data: [])) FollowingsList followingsList,
    @Default(null) String? errorMessage,
    @Default(true) bool profileLoading,
    @Default(true) bool loading,
    @Default(true) bool tweetsloading,
    @Default(false) bool isBlocked,
    @Default(false) bool isMuted,
    @Default(false) bool isFollowed,
    @Default(0) int screenIndex,
    @Default(0) int pageIndex,
    required UserProfile userProfile,
    String? error, // Add an error field for handling errors
  }) = _UserProfileState;

}