import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:x_clone/features/tweet/data/models/tweet_response.dart';

import '../model/user_profile.dart';

part 'profile_state.freezed.dart';

@freezed
class UserProfileState with _$UserProfileState {
  const factory UserProfileState({
    @Default(ProfileTweetsResponse(data: [], total: 0))
    ProfileTweetsResponse profileTweetsResponse,
    @Default(ProfileLikedTweetsResponse(data: [], total: 0))
    ProfileLikedTweetsResponse profileLikedTweetsResponse,
    @Default(UserProfile(imageUrl: "", bannerUrl: "")) UserProfile userprofile,
    @Default(FollowersList(data: [])) FollowersList followersList,
    @Default(FollowingsList(data: [])) FollowingsList followingsList,
    @Default(null) String? errorMessage,
    @Default(true) bool profileLoading,
    @Default(true) bool loading,
    @Default(true) bool tweetsRefreshing,
    @Default(true) bool tweetsLoading,
    @Default(false) bool isBlocked,
    @Default(false) bool isMuted,
    @Default(false) bool isFollowed,
    @Default(0) int screenIndex,
    @Default(0) int myPostsIndex,
    @Default(0) int myLikedPostsIndex,
    required UserProfile userProfile,
    String? error, // Add an error field for handling errors
    @Default(RepliersList(data: [])) RepliersList ProfileTweetsRepliersList,
    @Default(RepliersList(data: []))
    RepliersList ProfileLikedTweetsRepliersList,
  }) = _UserProfileState;
}
