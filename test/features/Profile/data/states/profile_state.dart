import 'package:flutter_test/flutter_test.dart';
import 'package:x_clone/features/Profile/data/model/user_profile.dart';
import 'package:x_clone/features/Profile/data/states/profile_state.dart';
import 'package:x_clone/features/tweet/data/models/tweet_response.dart';

void main() {
  group('UserProfileState', () {
    test('equality', () {
      const userProfileState1 = UserProfileState(
        profileTweetsResponse: ProfileTweetsResponse(data: [], total: 0),
        profileLikedTweetsResponse: ProfileLikedTweetsResponse(data: [], total: 0),
        userprofile: UserProfile(imageUrl: "", bannerUrl: ""),
        followersList: FollowersList(data: []),
        followingsList: FollowingsList(data: []),
        errorMessage: null,
        profileLoading: true,
        loading: true,
        tweetsRefreshing: true,
        tweetsLoading: true,
        isBlocked: false,
        isMuted: false,
        isFollowed: false,
        screenIndex: 0,
        myPostsIndex: 0,
        myLikedPostsIndex: 0,
        userProfile: UserProfile(imageUrl: "", bannerUrl: ""),
        error: null,
        ProfileTweetsRepliersList: RepliersList(data: []),
        ProfileLikedTweetsRepliersList: RepliersList(data: []),
      );

      const userProfileState2 = UserProfileState(
        profileTweetsResponse: ProfileTweetsResponse(data: [], total: 0),
        profileLikedTweetsResponse: ProfileLikedTweetsResponse(data: [], total: 0),
        userprofile: UserProfile(imageUrl: "", bannerUrl: ""),
        followersList: FollowersList(data: []),
        followingsList: FollowingsList(data: []),
        errorMessage: null,
        profileLoading: true,
        loading: true,
        tweetsRefreshing: true,
        tweetsLoading: true,
        isBlocked: false,
        isMuted: false,
        isFollowed: false,
        screenIndex: 0,
        myPostsIndex: 0,
        myLikedPostsIndex: 0,
        userProfile: UserProfile(imageUrl: "", bannerUrl: ""),
        error: null,
        ProfileTweetsRepliersList: RepliersList(data: []),
        ProfileLikedTweetsRepliersList: RepliersList(data: []),
      );

      expect(userProfileState1, userProfileState2);
    });

  });
}
