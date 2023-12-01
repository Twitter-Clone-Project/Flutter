// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$HomeResponseImpl _$$HomeResponseImplFromJson(Map<String, dynamic> json) =>
    _$HomeResponseImpl(
      data: (json['data'] as List<dynamic>?)
              ?.map((e) => Tweet.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      total: json['total'] as int?,
    );

Map<String, dynamic> _$$HomeResponseImplToJson(_$HomeResponseImpl instance) =>
    <String, dynamic>{
      'data': instance.data,
      'total': instance.total,
    };

_$TweetImpl _$$TweetImplFromJson(Map<String, dynamic> json) => _$TweetImpl(
      id: json['id'] as String?,
      text: json['text'] as String?,
      createdAt: json['createdAt'] as String?,
      isRetweet: json['isRetweet'] as bool?,
      user: json['user'] == null
          ? null
          : User.fromJson(json['user'] as Map<String, dynamic>),
      isLiked: json['isLiked'] as bool?,
      isRetweeted: json['isRetweeted'] as bool?,
      isReplied: json['isReplied'] as bool?,
      likesCount: json['likesCount'] as int?,
      retweetsCount: json['retweetsCount'] as int?,
      repliesCount: json['repliesCount'] as int?,
    );

Map<String, dynamic> _$$TweetImplToJson(_$TweetImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'text': instance.text,
      'createdAt': instance.createdAt,
      'isRetweet': instance.isRetweet,
      'user': instance.user,
      'isLiked': instance.isLiked,
      'isRetweeted': instance.isRetweeted,
      'isReplied': instance.isReplied,
      'likesCount': instance.likesCount,
      'retweetsCount': instance.retweetsCount,
      'repliesCount': instance.repliesCount,
    };
