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
      imageUrl: json['imageUrl'] as String?,
      bannerUrl: json['bannerUrl'] as String?,
      birthdate: json['birthdate'] as String?,
      isFollowed: json['isFollowed'] as bool?,
      isConfirmed: json['isConfirmed'] as bool?,
      isFollowing: json['isFollowing'] as bool?,
      isMuted: json['isMuted'] as bool?,
      isBlocked: json['isBlocked'] as bool?,
      isBlockingMe: json['isBlockingMe'] as bool?,
      followersCount: json['followersCount'] as int?,
      followingsCount: json['followingsCount'] as int?,
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
      'birthdate': instance.birthdate,
      'isFollowed': instance.isFollowed,
      'isConfirmed': instance.isConfirmed,
      'isFollowing': instance.isFollowing,
      'isMuted': instance.isMuted,
      'isBlocked': instance.isBlocked,
      'isBlockingMe': instance.isBlockingMe,
      'followersCount': instance.followersCount,
      'followingsCount': instance.followingsCount,
    };
