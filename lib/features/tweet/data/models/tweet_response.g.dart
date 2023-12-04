// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tweet_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$LikerDataImpl _$$LikerDataImplFromJson(Map<String, dynamic> json) =>
    _$LikerDataImpl(
      id: json['id'] as String?,
      name: json['name'] as String?,
      screenName: json['screenName'] as String?,
      profileImageURL: json['profileImageURL'] as String?,
      isFollowed: json['isFollowed'] as bool?,
    );

Map<String, dynamic> _$$LikerDataImplToJson(_$LikerDataImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'screenName': instance.screenName,
      'profileImageURL': instance.profileImageURL,
      'isFollowed': instance.isFollowed,
    };

_$LikersListImpl _$$LikersListImplFromJson(Map<String, dynamic> json) =>
    _$LikersListImpl(
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => LikerData.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$LikersListImplToJson(_$LikersListImpl instance) =>
    <String, dynamic>{
      'data': instance.data,
    };

_$RetweeterDataImpl _$$RetweeterDataImplFromJson(Map<String, dynamic> json) =>
    _$RetweeterDataImpl(
      id: json['id'] as String?,
      name: json['name'] as String?,
      screenName: json['screenName'] as String?,
      profileImageURL: json['profileImageURL'] as String?,
      isFollowed: json['isFollowed'] as bool?,
    );

Map<String, dynamic> _$$RetweeterDataImplToJson(_$RetweeterDataImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'screenName': instance.screenName,
      'profileImageURL': instance.profileImageURL,
      'isFollowed': instance.isFollowed,
    };

_$RetweetersListImpl _$$RetweetersListImplFromJson(Map<String, dynamic> json) =>
    _$RetweetersListImpl(
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => RetweeterData.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$RetweetersListImplToJson(
        _$RetweetersListImpl instance) =>
    <String, dynamic>{
      'data': instance.data,
    };

_$ReplierDataImpl _$$ReplierDataImplFromJson(Map<String, dynamic> json) =>
    _$ReplierDataImpl(
      replyText: json['replyText'] as String?,
      username: json['username'] as String?,
      bio: json['bio'] as String?,
      profileImageURL: json['profileImageURL'] as String?,
      createdAt: json['createdAt'] as String?,
      replyId: json['replyId'] as String?,
      replyTweetId: json['replyTweetId'] as String?,
      replyUserId: json['replyUserId'] as String?,
    );

Map<String, dynamic> _$$ReplierDataImplToJson(_$ReplierDataImpl instance) =>
    <String, dynamic>{
      'replyText': instance.replyText,
      'username': instance.username,
      'bio': instance.bio,
      'profileImageURL': instance.profileImageURL,
      'createdAt': instance.createdAt,
      'replyId': instance.replyId,
      'replyTweetId': instance.replyTweetId,
      'replyUserId': instance.replyUserId,
    };

_$RepliersListImpl _$$RepliersListImplFromJson(Map<String, dynamic> json) =>
    _$RepliersListImpl(
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => ReplierData.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$RepliersListImplToJson(_$RepliersListImpl instance) =>
    <String, dynamic>{
      'data': instance.data,
    };
