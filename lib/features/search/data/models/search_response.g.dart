// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TrendDataImpl _$$TrendDataImplFromJson(Map<String, dynamic> json) =>
    _$TrendDataImpl(
      name: json['name'] as String?,
      count: json['count'] as String?,
    );

Map<String, dynamic> _$$TrendDataImplToJson(_$TrendDataImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
      'count': instance.count,
    };

_$TrendingListImpl _$$TrendingListImplFromJson(Map<String, dynamic> json) =>
    _$TrendingListImpl(
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => TrendData.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$TrendingListImplToJson(_$TrendingListImpl instance) =>
    <String, dynamic>{
      'data': instance.data,
    };

_$UserDataImpl _$$UserDataImplFromJson(Map<String, dynamic> json) =>
    _$UserDataImpl(
      id: json['id'] as String?,
      email: json['email'] as String?,
      screenName: json['screenName'] as String?,
      username: json['username'] as String?,
      profileImageURL: json['profileImageURL'] as String?,
      bio: json['bio'] as String?,
      isFollowed: json['isFollowed'] as bool?,
      isFollowing: json['isFollowing'] as bool?,
    );

Map<String, dynamic> _$$UserDataImplToJson(_$UserDataImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'email': instance.email,
      'screenName': instance.screenName,
      'username': instance.username,
      'profileImageURL': instance.profileImageURL,
      'bio': instance.bio,
      'isFollowed': instance.isFollowed,
      'isFollowing': instance.isFollowing,
    };

_$UsersListImpl _$$UsersListImplFromJson(Map<String, dynamic> json) =>
    _$UsersListImpl(
      data: (json['data'] as List<dynamic>?)
              ?.map((e) => UserData.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      total: json['total'] as int?,
    );

Map<String, dynamic> _$$UsersListImplToJson(_$UsersListImpl instance) =>
    <String, dynamic>{
      'data': instance.data,
      'total': instance.total,
    };

_$TweetListImpl _$$TweetListImplFromJson(Map<String, dynamic> json) =>
    _$TweetListImpl(
      data: (json['data'] as List<dynamic>?)
              ?.map((e) => Tweet.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      total: json['total'] as int?,
    );

Map<String, dynamic> _$$TweetListImplToJson(_$TweetListImpl instance) =>
    <String, dynamic>{
      'data': instance.data,
      'total': instance.total,
    };
