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
