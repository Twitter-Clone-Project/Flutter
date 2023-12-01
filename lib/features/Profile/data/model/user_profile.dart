
import 'dart:ffi';

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:json_annotation/json_annotation.dart';
import 'dart:convert';

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
    int? followersCount,
    int? followingsCount

  }) = _UserProfile;

  factory UserProfile.fromJson(Map<String, dynamic> json) => _$UserProfileFromJson(json);
}
