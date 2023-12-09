// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_profile.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserProfileImpl _$$UserProfileImplFromJson(Map<String, dynamic> json) =>
    _$UserProfileImpl(
      userId: json['userId'] as String?,
      name: json['name'] as String?,
      username: json['username'] as String?,
      bio: json['bio'] as String?,
      website: json['website'] as String?,
      location: json['location'] as String?,
      imageUrl: json['imageUrl'] as String? ??
          "https://kady-twitter-images.s3.amazonaws.com/defaultProfile.jpg",
      bannerUrl: json['bannerUrl'] as String? ??
          "https://kady-twitter-images.s3.amazonaws.com/DefaultBanner.png",
      birthDate: json['birthDate'] as String?,
      isFollowed: json['isFollowed'] as bool?,
      isConfirmed: json['isConfirmed'] as bool?,
      isFollowing: json['isFollowing'] as bool?,
      isMuted: json['isMuted'] as bool?,
      isBlocked: json['isBlocked'] as bool?,
      isBlockingMe: json['isBlockingMe'] as bool?,
      followersCount: json['followersCount'] as String?,
      followingsCount: json['followingsCount'] as String?,
    );

Map<String, dynamic> _$$UserProfileImplToJson(_$UserProfileImpl instance) =>
    <String, dynamic>{
      'userId': instance.userId,
      'name': instance.name,
      'username': instance.username,
      'bio': instance.bio,
      'website': instance.website,
      'location': instance.location,
      'imageUrl': instance.imageUrl,
      'bannerUrl': instance.bannerUrl,
      'birthDate': instance.birthDate,
      'isFollowed': instance.isFollowed,
      'isConfirmed': instance.isConfirmed,
      'isFollowing': instance.isFollowing,
      'isMuted': instance.isMuted,
      'isBlocked': instance.isBlocked,
      'isBlockingMe': instance.isBlockingMe,
      'followersCount': instance.followersCount,
      'followingsCount': instance.followingsCount,
    };

_$ProfileTweetsResponseImpl _$$ProfileTweetsResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$ProfileTweetsResponseImpl(
      data: (json['data'] as List<dynamic>?)
              ?.map((e) => Tweet.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      total: json['total'] as int?,
    );

Map<String, dynamic> _$$ProfileTweetsResponseImplToJson(
        _$ProfileTweetsResponseImpl instance) =>
    <String, dynamic>{
      'data': instance.data,
      'total': instance.total,
    };

_$ProfileLikedTweetsResponseImpl _$$ProfileLikedTweetsResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$ProfileLikedTweetsResponseImpl(
      data: (json['data'] as List<dynamic>?)
              ?.map((e) => Tweet.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      total: json['total'] as int?,
    );

Map<String, dynamic> _$$ProfileLikedTweetsResponseImplToJson(
        _$ProfileLikedTweetsResponseImpl instance) =>
    <String, dynamic>{
      'data': instance.data,
      'total': instance.total,
    };
