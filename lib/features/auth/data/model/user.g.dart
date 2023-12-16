// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserImpl _$$UserImplFromJson(Map<String, dynamic> json) => _$UserImpl(
      userId: json['userId'] as String?,
      name: json['name'] as String?,
      username: json['username'] as String?,
      screenName: json['screenName'] as String?,
      email: json['email'] as String?,
      profileImageURL: json['profileImageURL'] as String? ??
          "https://kady-twitter-images.s3.amazonaws.com/defaultProfile.jpg",
      bannerUrl: json['bannerUrl'] as String?,
      followingsCount: json['followingsCount'] as String?,
      followersCount: json['followersCount'] as String?,
      birthDate: json['birthDate'] as String?,
      isConfirmed: json['isConfirmed'] as bool?,
      isOnline: json['isOnline'] as bool?,
    );

Map<String, dynamic> _$$UserImplToJson(_$UserImpl instance) =>
    <String, dynamic>{
      'userId': instance.userId,
      'name': instance.name,
      'username': instance.username,
      'screenName': instance.screenName,
      'email': instance.email,
      'profileImageURL': instance.profileImageURL,
      'bannerUrl': instance.bannerUrl,
      'followingsCount': instance.followingsCount,
      'followersCount': instance.followersCount,
      'birthDate': instance.birthDate,
      'isConfirmed': instance.isConfirmed,
      'isOnline': instance.isOnline,
    };
