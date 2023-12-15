// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TrendDataImpl _$$TrendDataImplFromJson(Map<String, dynamic> json) =>
    _$TrendDataImpl(
      name: json['name'] as String?,
    );

Map<String, dynamic> _$$TrendDataImplToJson(_$TrendDataImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
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
      name: json['name'] as String?,
      username: json['username'] as String?,
      profileImageUrl: json['profileImageUrl'] as String?,
    );

Map<String, dynamic> _$$UserDataImplToJson(_$UserDataImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'email': instance.email,
      'name': instance.name,
      'username': instance.username,
      'profileImageUrl': instance.profileImageUrl,
    };

_$UsersListImpl _$$UsersListImplFromJson(Map<String, dynamic> json) =>
    _$UsersListImpl(
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => UserData.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$UsersListImplToJson(_$UsersListImpl instance) =>
    <String, dynamic>{
      'data': instance.data,
    };
