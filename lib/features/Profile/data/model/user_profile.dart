
import 'dart:ffi';

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:json_annotation/json_annotation.dart';
import 'dart:convert';

import '../../../auth/data/model/user.dart';

part 'user_profile.freezed.dart';
part 'user_profile.g.dart';

UserProfile userProfileFromJson(String str) => UserProfile.fromJson(json.decode(str));

String userProfileToJson(UserProfile data) => json.encode(data.toJson());

@freezed
class UserProfile with _$UserProfile {
  const factory UserProfile({
    String? userId,
    String? name,
    String? username,
    String? bio,
    String? website,
    String? location,
    String? imageUrl,
    String? bannerUrl,
    String? birthdate,
    // String? CreatedAt,
    bool? isFollowed,
    bool? isConfirmed,
    bool? isFollowing,
    bool? isMuted,
    bool? isBlocked,
    bool? isBlockingMe,
    String? followersCount,
    String? followingsCount

  }) = _UserProfile;

  factory UserProfile.fromJson(Map<String, dynamic> json) => _$UserProfileFromJson(json);
}



ProfileTweetsResponse profileTweetsResponseFromJson(String str) =>
    ProfileTweetsResponse.fromJson(json.decode(str));

String profileTweetsResponseToJson(ProfileTweetsResponse data) => json.encode(data.toJson());

@freezed
class ProfileTweetsResponse with _$ProfileTweetsResponse {
  const factory ProfileTweetsResponse({
    @Default([]) List<Tweet> data,
    int? total,
  }) = _ProfileTweetsResponse;
  factory ProfileTweetsResponse.fromJson(Map<String, dynamic> json) =>
      _$ProfileTweetsResponseFromJson(json);
}

@freezed
class Tweet with _$Tweet {
  const factory Tweet({
    String? id,
    String? text,
    String? createdAt,
    bool? isRetweet,
    User? user,
    bool? isLiked,
    bool? isRetweeted,
    bool? isReplied,
    int? likesCount,
    int? retweetsCount,
    int? repliesCount,
  }) = _Tweet;
  factory Tweet.fromJson(Map<String, dynamic> json) =>
      _$TweetFromJson(json);
}
