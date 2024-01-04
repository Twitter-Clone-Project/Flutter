import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:x_clone/features/tweet/data/models/tweet_response.dart';

import '../model/user_profile.dart';

part 'profile_state.freezed.dart';

/// Represents the state of the user profile.
///
/// This class is used to store the various states and data related to the user profile.
/// It includes information such as profile tweets, liked tweets, user profile details,
/// followers list, followings list, error messages, loading states, and more.
///
/// Example usage:
/// ```dart
/// UserProfileState userProfileState = UserProfileState(
///   profileTweetsResponse: ProfileTweetsResponse(data: [], total: 0),
///   profileLikedTweetsResponse: ProfileLikedTweetsResponse(data: [], total: 0),
///   userprofile: UserProfile(imageUrl: "", bannerUrl: ""),
///   followersList: FollowersList(data: []),
///   followingsList: FollowingsList(data: []),
///   errorMessage: null,
///   profileLoading: true,
///   loading: true,
///   tweetsRefreshing: true,
///   tweetsLoading: true,
///   isBlocked: false,
///   isMuted: false,
///   isFollowed: false,
///   screenIndex: 0,
///   myPostsIndex: 0,
///   myLikedPostsIndex: 0,
///   userProfile: UserProfile(),
///   error: null,
///   ProfileTweetsRepliersList: RepliersList(data: []),
///   ProfileLikedTweetsRepliersList: RepliersList(data: []),
/// );
/// ```
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
