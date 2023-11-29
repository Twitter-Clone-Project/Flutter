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
      profileImageURL: json['profileImageURL'] as String?,
      isConfirmed: json['isConfirmed'] as bool?,
    );

Map<String, dynamic> _$$UserImplToJson(_$UserImpl instance) =>
    <String, dynamic>{
      'userId': instance.userId,
      'name': instance.name,
      'username': instance.username,
      'screenName': instance.screenName,
      'email': instance.email,
      'profileImageURL': instance.profileImageURL,
      'isConfirmed': instance.isConfirmed,
    };
