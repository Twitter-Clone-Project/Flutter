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
