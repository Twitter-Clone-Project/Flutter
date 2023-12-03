
import 'dart:ffi';

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:json_annotation/json_annotation.dart';
import 'dart:convert';

import '../../../auth/data/model/user.dart';
import '../../../home/data/models/home_response.dart';

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
    @Default("https://kady-twitter-images.s3.amazonaws.com/defaultProfile.jpg") String imageUrl,
    @Default("https://kady-twitter-images.s3.amazonaws.com/DefaultBanner.png") String bannerUrl,
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


ProfileLikedTweetsResponse profileLikedTweetsResponseFromJson(String str) =>
    ProfileLikedTweetsResponse.fromJson(json.decode(str));

String profileLikedTweetsResponseToJson(ProfileLikedTweetsResponse data) => json.encode(data.toJson());

@freezed
class ProfileLikedTweetsResponse with _$ProfileLikedTweetsResponse {
  const factory ProfileLikedTweetsResponse({
    @Default([]) List<Tweet> data,
    int? total,
  }) = _ProfileLikedTweetsResponse;
  factory ProfileLikedTweetsResponse.fromJson(Map<String, dynamic> json) =>
      _$ProfileLikedTweetsResponseFromJson(json);
}