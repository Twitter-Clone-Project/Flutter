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
      imageUrl: json['imageUrl'] as String? ??
          "https://kady-twitter-images.s3.amazonaws.com/defaultProfile.jpg",
      bannerUrl: json['bannerUrl'] as String?,
      followingsCount: json['followingsCount'] as String?,
      followersCount: json['followersCount'] as String?,
      birthDate: json['birthDate'] as String?,
      bio: json['bio'] as String?,
      location: json['location'] as String?,
      website: json['website'] as String?,
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
      'imageUrl': instance.imageUrl,
      'bannerUrl': instance.bannerUrl,
      'followingsCount': instance.followingsCount,
      'followersCount': instance.followersCount,
      'birthDate': instance.birthDate,
      'bio': instance.bio,
      'location': instance.location,
      'website': instance.website,
      'isConfirmed': instance.isConfirmed,
      'isOnline': instance.isOnline,
    };

_$MuterDataImpl _$$MuterDataImplFromJson(Map<String, dynamic> json) =>
    _$MuterDataImpl(
      userId: json['userId'] as String?,
      username: json['username'] as String?,
      name: json['name'] as String?,
      bio: json['bio'] as String?,
      imageUrl: json['imageUrl'] as String?,
    );

Map<String, dynamic> _$$MuterDataImplToJson(_$MuterDataImpl instance) =>
    <String, dynamic>{
      'userId': instance.userId,
      'username': instance.username,
      'name': instance.name,
      'bio': instance.bio,
      'imageUrl': instance.imageUrl,
    };

_$MutersListImpl _$$MutersListImplFromJson(Map<String, dynamic> json) =>
    _$MutersListImpl(
      users: (json['users'] as List<dynamic>?)
          ?.map((e) => MuterData.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$MutersListImplToJson(_$MutersListImpl instance) =>
    <String, dynamic>{
      'users': instance.users,
    };

_$BlockerDataImpl _$$BlockerDataImplFromJson(Map<String, dynamic> json) =>
    _$BlockerDataImpl(
      userId: json['userId'] as String?,
      username: json['username'] as String?,
      name: json['name'] as String?,
      bio: json['bio'] as String?,
      imageUrl: json['imageUrl'] as String?,
    );

Map<String, dynamic> _$$BlockerDataImplToJson(_$BlockerDataImpl instance) =>
    <String, dynamic>{
      'userId': instance.userId,
      'username': instance.username,
      'name': instance.name,
      'bio': instance.bio,
      'imageUrl': instance.imageUrl,
    };

_$BlockersListImpl _$$BlockersListImplFromJson(Map<String, dynamic> json) =>
    _$BlockersListImpl(
      users: (json['users'] as List<dynamic>?)
          ?.map((e) => BlockerData.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$BlockersListImplToJson(_$BlockersListImpl instance) =>
    <String, dynamic>{
      'users': instance.users,
    };
