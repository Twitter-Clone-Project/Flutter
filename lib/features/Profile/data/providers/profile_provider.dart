import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:x_clone/features/Profile/data/model/user_profile.dart';
import 'package:x_clone/features/Profile/data/repositories/profile_repository.dart';
import 'package:x_clone/features/Profile/data/states/profile_state.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:x_clone/features/auth/data/model/user.dart';
import 'package:x_clone/features/tweet/data/models/tweet_response.dart';
import 'package:x_clone/utils/utils.dart';

import '../../../home/data/models/home_response.dart';

class ProfileNotifierProvider extends StateNotifier<UserProfileState> {
  final ProfileRepository profileRepository;

  ProfileNotifierProvider(this.profileRepository, [UserProfileState? state])
      : super(state ??
            const UserProfileState(
                loading: true,
                userProfile: UserProfile(imageUrl: "", bannerUrl: ""))) {
    // Additional initialization if needed
  }

  init() {
    // fetchUserProfile(state.userProfile.username!);
    // getUserTweets(userId: state.userProfile.username!, page: 0);
    // getUserLikedTweets(userId: state.userProfile.username!, page: 1);
  }

  loadProfile() {
    state =
        state.copyWith(profileLoading: true, tweetsLoading: true, error: null);
  }

  Future<void> fetchUserProfile(String username) async {
    try {
      state = state.copyWith(loading: true, error: null);
      final userProfile =
          await profileRepository.fetchUserProfileData(username: username);
      state = state.copyWith(
          loading: false,
          profileLoading: false,
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
        state = state.copyWith(tweetsRefreshing: true, myPostsIndex: 0);
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
        tweetsRefreshing: false,
        tweetsLoading: false,
        myPostsIndex: page,
      );
      return profileTweetsResponse;
    } catch (e) {
      state =
          state.copyWith(tweetsRefreshing: false, errorMessage: e.toString());
      return const ProfileTweetsResponse(data: [], total: 0);
    }
  }

  getUserLikedTweets({
    required String username,
    required int page,
  }) async {
    try {
      if (page == 1) {
        state = state.copyWith(tweetsRefreshing: true, myLikedPostsIndex: 0);
      }
      final ProfileLikedTweetsResponse profileLikedTweetsResponse =
          await profileRepository.getUserLikedTweets(username, page);
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
        tweetsRefreshing: false,
        myLikedPostsIndex: page,
      );
      return profileLikedTweetsResponse;
    } catch (e) {
      state =
          state.copyWith(tweetsRefreshing: false, errorMessage: e.toString());
      return const ProfileLikedTweetsResponse(data: [], total: 0);
    }
  }

  Future<UserProfile?> updateUserProfile(
      {String? profilePhoto,
      String? bannerPhoto,
      String? name,
      String? bio,
      String? website,
      String? location,
      String? birthDate,
      bool? removeProfilePhoto,
      bool? removeBannerPhoto}) async {
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
          removeBannerPhoto: removeBannerPhoto);

      var userProfile = state.userProfile;
      var updatedUserProfile = UserProfile(
        bannerUrl: result!.bannerUrl,
        bio: result.bio,
        birthDate: result.birthDate,
        imageUrl: result.imageUrl,
        location: result.location,
        name: result.name,
        website: result.website,
        userId: userProfile.userId,
        isFollowing: userProfile.isFollowed,
        isMuted: userProfile.isMuted,
        username: userProfile.username,
        isConfirmed: userProfile.isConfirmed,
        isBlockingMe: userProfile.isBlockingMe,
        isFollowed: userProfile.isFollowed,
        isBlocked: userProfile.isBlocked,
        createdAt: userProfile.createdAt,
        followersCount: userProfile.followersCount,
        followingsCount: userProfile.followingsCount,
      );

      if (result != null) {
        state = state.copyWith(userProfile: updatedUserProfile, loading: false);
        return updatedUserProfile;
      }
      //TODO Edit the following line to update the state to the newest updated user profile
      state = state.copyWith(loading: false);
    } catch (e) {
      state = state.copyWith(loading: false, error: e.toString());
    }
  }

  Future<bool> toggleMuteStatus(String username) async {
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
      return true;
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
      return false;
    }
  }

  Future<bool> toggleFollowStatus(String username) async {
    var isFollowed = state.userProfile.isFollowed!;

    var oldfollowersCount = state.userProfile.followersCount ?? "0";

    int currentCount = int.parse(oldfollowersCount);
    int newCount;

    if (isFollowed) {
      newCount = currentCount - 1;
    } else {
      newCount = currentCount + 1;
    }
    var newfollowersCount = newCount.toString();

    try {
      state = state.copyWith(loading: true);
      state = state.copyWith(
        userProfile: state.userProfile.copyWith(
            isFollowed: !state.userProfile.isFollowed!,
            followersCount: newfollowersCount),
        loading: false,
      );

      // Perform the asynchronous follow/unfollow operation
      if (isFollowed) {
        await profileRepository.unfollowUser(username: username);
      } else {
        await profileRepository.followUser(username: username);
      }
      return true;
    } catch (e) {
      // If the asynchronous operation fails, revert the local state to the original follow status
      state = state.copyWith(
        userProfile: state.userProfile.copyWith(
            isFollowed: !state.userProfile.isFollowed!,
            followersCount: oldfollowersCount),
        loading: false,
      );

      // Handle the error as needed
      state = state.copyWith(loading: false, error: e.toString());
      return false;
    }
  }

  Future<bool> toggleBlockStatus(String username) async {
    var isBlocked = state.userProfile.isBlocked!;
    var isFollowed_tmp = state.userProfile.isFollowed!;

    var oldfollowersCount = state.userProfile.followersCount ?? "0";
    int newCount = int.parse(oldfollowersCount) - 1;
    var newfollowersCount;
    if (isFollowed_tmp) {
      newfollowersCount = newCount.toString();
    } else {
      newfollowersCount = oldfollowersCount;
    }

    try {
      state = state.copyWith(loading: true);
      state = state.copyWith(
        userProfile: state.userProfile.copyWith(
            isBlocked: !state.userProfile.isBlocked!,
            isFollowed: false,
            followersCount: newfollowersCount),
        loading: false,
      );

      if (isBlocked) {
        await profileRepository.unblockUser(username: username);
      } else {
        await profileRepository.blockUser(username: username);
      }
      return true;
    } catch (e) {
      // If the asynchronous operation fails, revert the local state to the original block status
      state = state.copyWith(
        userProfile: state.userProfile.copyWith(
            isBlocked: !state.userProfile.isBlocked!,
            isFollowed: isFollowed_tmp,
            followersCount: oldfollowersCount),
        loading: false,
      );

      // Handle the error as needed
      state = state.copyWith(loading: false, error: e.toString());
      return false;
    }
  }

  Future<void> getFollowers({required String username}) async {
    state = state.copyWith(
      loading: true,
    );
    final FollowersList followers =
        await profileRepository.fetchFollowersData(username: username);
    if (followers.data != null) {
      state = state.copyWith(
        followersList: followers,
        loading: false,
      );
    } else {
      state = state.copyWith(
        errorMessage: 'Failed to fetch followers',
        loading: false,
      );
    }
  }

  Future<void> getFollowings({required String username}) async {
    state = state.copyWith(
      loading: true,
    );
    final FollowingsList followings =
        await profileRepository.fetchFollowingsData(username: username);
    if (followings.data != null) {
      state = state.copyWith(
        followingsList: followings,
        loading: false,
      );
    } else {
      state = state.copyWith(
        errorMessage: 'Failed to fetch followers',
        loading: false,
      );
    }
  }

  addLike(
      {required String tweetId,
      required int whom,
      required int inMyProfile}) async {
    try {
      //ProfileTweetList
      print("inmyprofile===============");
      print(inMyProfile);
      List<Tweet> tweetlist = List.from(state.profileTweetsResponse.data);
      int tweetIndex = tweetlist.indexWhere((tweet) => tweet.id == tweetId);
      for (int i = 0; i < tweetlist.length; i++) {
        if (tweetlist[i].id == tweetId) {
          tweetlist[i] = tweetlist[i].copyWith(
            isLiked: true,
            likesCount: tweetlist[i].likesCount! + 1,
          );
        }
      }
      state = state.copyWith(
        profileTweetsResponse:
            state.profileTweetsResponse.copyWith(data: tweetlist),
        loading: false,
      );
      //ProfileLikedTweetList
      List<Tweet> tweetLikedlist =
          List.from(state.profileLikedTweetsResponse.data);
      int tweetLikedlistIndex =
          tweetLikedlist.indexWhere((tweet) => tweet.id == tweetId);

      //Check if i am in MyProfile
      if (tweetLikedlistIndex == -1 && inMyProfile == 1) {
        tweetLikedlist.add(tweetlist[tweetIndex]);
        state = state.copyWith(
          profileLikedTweetsResponse:
              state.profileLikedTweetsResponse.copyWith(data: tweetLikedlist),
          loading: false,
        );
        return true;
      }

      //If i am in user profile
      if (tweetLikedlistIndex != -1 && inMyProfile == 0) {
        tweetLikedlist[tweetLikedlistIndex] =
            tweetLikedlist[tweetLikedlistIndex].copyWith(
          isLiked: true,
          likesCount: tweetLikedlist[tweetLikedlistIndex].likesCount! + 1,
        );
        state = state.copyWith(
          profileLikedTweetsResponse:
              state.profileLikedTweetsResponse.copyWith(data: tweetLikedlist),
          loading: false,
        );
      } else {
        return false;
      }
    } catch (e) {
      return false;
    }
  }

  deleteLike(
      {required String tweetId,
      required int whom,
      required int inMyProfile}) async {
    try {
      //ProfileTweetList
      List<Tweet> tweetlist = List.from(state.profileTweetsResponse.data);
      int tweetIndex = tweetlist.indexWhere((tweet) => tweet.id == tweetId);
      if (tweetIndex != -1) {
        tweetlist[tweetIndex] = tweetlist[tweetIndex].copyWith(
          isLiked: false,
          likesCount: tweetlist[tweetIndex].likesCount! - 1,
        );
        state = state.copyWith(
          profileTweetsResponse:
              state.profileTweetsResponse.copyWith(data: tweetlist),
          loading: false,
        );
      }
      //ProfileLikedTweetList
      List<Tweet> tweetLikedlist =
          List.from(state.profileLikedTweetsResponse.data);
      int tweetLikedlistIndex =
          tweetLikedlist.indexWhere((tweet) => tweet.id == tweetId);
      //Check if i am in MyProfile
      if (tweetLikedlistIndex != -1 && inMyProfile == 1) {
        tweetLikedlist.removeAt(tweetLikedlistIndex);
        state = state.copyWith(
          profileLikedTweetsResponse:
              state.profileLikedTweetsResponse.copyWith(data: tweetLikedlist),
          loading: false,
        );
      }
      //If i am in user profile
      else if (tweetLikedlistIndex != -1 && inMyProfile == 0) {
        tweetLikedlist[tweetLikedlistIndex] =
            tweetLikedlist[tweetLikedlistIndex].copyWith(
          isLiked: false,
          likesCount: tweetLikedlist[tweetLikedlistIndex].likesCount! - 1,
        );
        state = state.copyWith(
          profileLikedTweetsResponse:
              state.profileLikedTweetsResponse.copyWith(data: tweetLikedlist),
          loading: false,
        );
      }
      return true;
    } catch (e) {
      return false;
    }
  }

  addRetweet(
      {required String tweetId,
      required int whom,
      required int inMyProfile}) async {
    try {
      //ProfileTweetLikedList
      List<Tweet> tweetLikedlist =
          List.from(state.profileLikedTweetsResponse.data);
      int tweetLikedlistIndex =
          tweetLikedlist.indexWhere((tweet) => tweet.id == tweetId);
      //ProfileTweetList
      List<Tweet> tweetlist = List.from(state.profileTweetsResponse.data);
      int tweetIndex = tweetlist.indexWhere((tweet) => tweet.id == tweetId);
      //Check if i am in MyProfile
      if (tweetLikedlistIndex != -1 && inMyProfile == 1) {
        tweetLikedlist[tweetLikedlistIndex] =
            tweetLikedlist[tweetLikedlistIndex].copyWith(
          isRetweeted: true,
          retweetsCount: tweetLikedlist[tweetLikedlistIndex].retweetsCount! + 1,
        );
        state = state.copyWith(
          profileLikedTweetsResponse:
              state.profileLikedTweetsResponse.copyWith(data: tweetLikedlist),
          loading: false,
        );
        List<Tweet> tweetlist = List.from(state.profileTweetsResponse.data);
        int tweetIndex = tweetlist.indexWhere((tweet) => tweet.id == tweetId);
        if (tweetIndex == -1) {
          tweetlist.add(tweetLikedlist[tweetLikedlistIndex]);
          state = state.copyWith(
            profileTweetsResponse:
                state.profileTweetsResponse.copyWith(data: tweetlist),
            loading: false,
          );
        }
      }
      //If i am in user profile
      else if (inMyProfile == 0) {
        //ProfileTweetLikedList of User Profile
        if (tweetLikedlistIndex != -1) {
          tweetLikedlist[tweetLikedlistIndex] =
              tweetLikedlist[tweetLikedlistIndex].copyWith(
            isRetweeted: true,
            retweetsCount:
                tweetLikedlist[tweetLikedlistIndex].retweetsCount! + 1,
          );
          state = state.copyWith(
            profileLikedTweetsResponse:
                state.profileLikedTweetsResponse.copyWith(data: tweetLikedlist),
            loading: false,
          );
        }
        //ProfileTweetList of User Profile
        if (tweetIndex != -1) {
          tweetlist[tweetIndex] = tweetlist[tweetIndex].copyWith(
            isRetweeted: true,
            retweetsCount: tweetlist[tweetIndex].retweetsCount! + 1,
          );
          state = state.copyWith(
            profileTweetsResponse:
                state.profileTweetsResponse.copyWith(data: tweetlist),
            loading: false,
          );
        }
      } else {
        return false;
      }
      return true;
    } catch (e) {
      return false;
    }
  }

  deleteRetweet({
    required String tweetId,
    required int whom,
    required int inMyProfile,
  }) async {
    try {
      //ProfileTweetList
      List<Tweet> tweetlist = List.from(state.profileTweetsResponse.data);
      int tweetIndex = tweetlist.indexWhere((tweet) => tweet.id == tweetId);
      //ProfileTweetLikedList
      List<Tweet> tweetLikedlist =
          List.from(state.profileLikedTweetsResponse.data);
      int tweetLikedlistIndex =
          tweetLikedlist.indexWhere((tweet) => tweet.id == tweetId);
      if (inMyProfile == 1) {
        //ProfileTweetList of My Profile
        if (tweetIndex != -1) {
          tweetlist.removeAt(tweetIndex);
          state = state.copyWith(
            profileTweetsResponse:
                state.profileTweetsResponse.copyWith(data: tweetlist),
            loading: false,
          );
        }
        //ProfileTweetLikedList of MyProfile
        if (tweetLikedlistIndex != -1) {
          tweetLikedlist[tweetLikedlistIndex] =
              tweetLikedlist[tweetLikedlistIndex].copyWith(
            isRetweeted: false,
            retweetsCount:
                tweetLikedlist[tweetLikedlistIndex].retweetsCount! - 1,
          );
          state = state.copyWith(
            profileLikedTweetsResponse:
                state.profileLikedTweetsResponse.copyWith(data: tweetLikedlist),
            loading: false,
          );
          return true;
        }
      } else if (inMyProfile == 0) {
        //ProfileTweetList of User Profile
        if (tweetIndex != -1) {
          tweetlist[tweetIndex] = tweetlist[tweetIndex].copyWith(
            isRetweeted: false,
            retweetsCount: tweetlist[tweetIndex].retweetsCount! - 1,
          );
          state = state.copyWith(
            profileTweetsResponse:
                state.profileTweetsResponse.copyWith(data: tweetlist),
            loading: false,
          );
        }
        //ProfileTweetLikedList of User Profile
        if (tweetLikedlistIndex != -1) {
          tweetLikedlist[tweetLikedlistIndex] =
              tweetLikedlist[tweetLikedlistIndex].copyWith(
            isRetweeted: false,
            retweetsCount:
                tweetLikedlist[tweetLikedlistIndex].retweetsCount! - 1,
          );
          state = state.copyWith(
            profileLikedTweetsResponse:
                state.profileLikedTweetsResponse.copyWith(data: tweetLikedlist),
            loading: false,
          );
          return true;
        }
      }
    } catch (e) {
      return false;
    }
  }

  Future<bool> addReply({
    required String tweetId,
    required String replyText,
    required User replierUser,
    required ReplierData replier,
  }) async {
    try {
      if (replyText.isEmpty) return false;
      // Check if Tweet is In ProfileTweetList Then Add Reply and Increment Reply Count
      List<Tweet> tweetlist = List.from(state.profileTweetsResponse.data);
      int tweetIndex = tweetlist.indexWhere((tweet) => tweet.id == tweetId);
      if (tweetIndex != -1) {
        List<ReplierData> updatedRepliersList =
            List<ReplierData>.from(state.ProfileTweetsRepliersList.data!);
        updatedRepliersList.add(replier);
        RepliersList updatedList = RepliersList(data: updatedRepliersList);
        tweetlist[tweetIndex] = tweetlist[tweetIndex].copyWith(
          repliesCount:
              state.profileTweetsResponse.data[tweetIndex].repliesCount! + 1,
        );
        state = state.copyWith(
          profileTweetsResponse:
              state.profileTweetsResponse.copyWith(data: tweetlist),
          loading: false,
          ProfileTweetsRepliersList: updatedList,
        );
      }
      //Check if Tweet is In ProfileLikedTweetList Then Add Reply and Increment Reply Count
      List<Tweet> likedTweetList =
          List.from(state.profileLikedTweetsResponse.data);
      int likedTweetIndex =
          likedTweetList.indexWhere((tweet) => tweet.id == tweetId);
      if (likedTweetIndex != -1) {
        List<ReplierData> updatedRepliersList =
            List<ReplierData>.from(state.ProfileLikedTweetsRepliersList.data!);
        updatedRepliersList.add(replier);
        RepliersList updatedList = RepliersList(data: updatedRepliersList);
        likedTweetList[likedTweetIndex] =
            likedTweetList[likedTweetIndex].copyWith(
          repliesCount: state.profileLikedTweetsResponse.data[likedTweetIndex]
                  .repliesCount! +
              1,
        );
        state = state.copyWith(
          profileLikedTweetsResponse:
              state.profileLikedTweetsResponse.copyWith(data: likedTweetList),
          loading: false,
          ProfileLikedTweetsRepliersList: updatedList,
        );
      }

      return true;
    } catch (e) {
      return false;
    }
  }

  deleteReply({required String tweetId, required String replyId}) async {
    try {
      List<Tweet> tweetlist = List.from(state.profileTweetsResponse.data);
      int tweetIndex = tweetlist.indexWhere((tweet) => tweet.id == tweetId);
      List<Tweet> likedTweetList =
          List.from(state.profileLikedTweetsResponse.data);
      int likedTweetIndex =
          likedTweetList.indexWhere((tweet) => tweet.id == tweetId);
      //Check in ProfileTweetList
      if (tweetIndex != -1) {
        List<ReplierData> updatedRepliersList =
            List<ReplierData>.from(state.ProfileTweetsRepliersList.data!);
        int replyindex =
            updatedRepliersList.indexWhere((reply) => reply.replyId == replyId);
        if (replyindex != -1) {
          updatedRepliersList.removeAt(replyindex);
          RepliersList updatedList = RepliersList(data: updatedRepliersList);
          tweetlist[tweetIndex] = tweetlist[tweetIndex].copyWith(
            repliesCount:
                state.profileTweetsResponse.data[tweetIndex].repliesCount! - 1,
          );
          state = state.copyWith(
            profileTweetsResponse:
                state.profileTweetsResponse.copyWith(data: tweetlist),
            loading: false,
            ProfileTweetsRepliersList: updatedList,
          );
        }
      }
      //Check in ProfileLikedTweetList
      if (likedTweetIndex != -1) {
        List<ReplierData> updatedRepliersList =
            List<ReplierData>.from(state.ProfileLikedTweetsRepliersList.data!);
        int replyindex =
            updatedRepliersList.indexWhere((reply) => reply.replyId == replyId);
        if (replyindex != -1) {
          updatedRepliersList.removeAt(replyindex);
          RepliersList updatedList = RepliersList(data: updatedRepliersList);
          likedTweetList[likedTweetIndex] =
              likedTweetList[likedTweetIndex].copyWith(
            repliesCount: state.profileLikedTweetsResponse.data[likedTweetIndex]
                    .repliesCount! -
                1,
          );
          state = state.copyWith(
            profileLikedTweetsResponse:
                state.profileLikedTweetsResponse.copyWith(data: likedTweetList),
            loading: false,
            ProfileLikedTweetsRepliersList: updatedList,
          );
        }
      } else {
        return false;
      }
    } catch (e) {
      return false;
    }
  }

  deleteTweet({required String tweetId}) async {
    try {
      List<Tweet> tweetlist = List.from(state.profileTweetsResponse.data);
      int tweetIndex = tweetlist.indexWhere((tweet) => tweet.id == tweetId);
      List<Tweet> tweetLikedlist =
          List.from(state.profileLikedTweetsResponse.data);
      int tweetLikedlistIndex =
          tweetLikedlist.indexWhere((tweet) => tweet.id == tweetId);
      if (tweetIndex != -1) {
        tweetlist.removeAt(tweetIndex);
        state = state.copyWith(
          profileTweetsResponse:
              state.profileTweetsResponse.copyWith(data: tweetlist),
          loading: false,
        );
      }
      if (tweetLikedlistIndex != -1) {
        tweetLikedlist.removeAt(tweetLikedlistIndex);
        state = state.copyWith(
          profileTweetsResponse:
              state.profileTweetsResponse.copyWith(data: tweetLikedlist),
          loading: false,
        );
      } else {
        return false;
      }
    } catch (e) {
      return false;
    }
  }

  Future<void> getRepliers({required String tweetId}) async {
    try {
      state = state.copyWith(
        loading: true,
      );
      final RepliersList repliers =
          await profileRepository.fetchRepliersData(tweetId: tweetId);
      List<Tweet> tweetlist = List.from(state.profileTweetsResponse.data);
      int tweetIndex = tweetlist.indexWhere((tweet) => tweet.id == tweetId);
      List<Tweet> tweetLikedlist =
          List.from(state.profileLikedTweetsResponse.data);
      int tweetLikedlistIndex =
          tweetLikedlist.indexWhere((tweet) => tweet.id == tweetId);
      if (tweetIndex != -1) {
        if (repliers.data != null) {
          state = state.copyWith(
            ProfileTweetsRepliersList: repliers,
            loading: false,
          );
        } else {
          state = state.copyWith(
            errorMessage: 'Failed to fetch likers',
            loading: false,
          );
        }
      }
      if (tweetLikedlistIndex != -1) {
        if (repliers.data != null) {
          state = state.copyWith(
            ProfileLikedTweetsRepliersList: repliers,
            loading: false,
          );
        } else {
          state = state.copyWith(
            errorMessage: 'Failed to fetch likers',
            loading: false,
          );
        }
      }
    } catch (e) {
      state = state.copyWith(
        loading: false,
        //errorMessage: e.toString(),
        ProfileTweetsRepliersList: const RepliersList(data: []),
      );
    }
  }

  Future<bool> addTweet(
      {String? tweetText, List<MultipartFile>? attachments}) async {
    List<String> trends = [];
    if (tweetText != null) {
      List<String> words = tweetText.split(' ');
      for (String word in words) {
        int i = 0;
        if (word.startsWith('#') && !containsOnlyOneCharacter(word)) {
          for (i = 0; i < word.length; i++) {
            if (word[i] != '#') break;
          }
          if (word.substring(i).isNotEmpty) {
            trends.add(word.substring(i));
          }
        }
      }
    }
    try {
      final Tweet result = await profileRepository.addTweet(
          tweetText: tweetText, media: attachments, trends: trends);
      List<Tweet> tweetlist = List.from(state.profileTweetsResponse.data);
      tweetlist.add(result);
      state = state.copyWith(
          profileTweetsResponse:
              state.profileTweetsResponse.copyWith(data: tweetlist));
      return true;
    } catch (e) {
      return false;
      // Handle error
    }
  }

  Future<void> resetSearchedUsers() async {
    state = state.copyWith(
      profileTweetsResponse: const ProfileTweetsResponse(
          data: []), // Assuming UsersList has a factory method for an empty state
      profileLikedTweetsResponse: const ProfileLikedTweetsResponse(
          data: []), // Assuming UsersList has a factory method for an empty state
    );
  }
}

final profileNotifierProvider =
    StateNotifierProvider<ProfileNotifierProvider, UserProfileState>((ref) {
  final profileRepository = ref.watch(profileRepositoryProvider);

  return ProfileNotifierProvider(profileRepository);
});
