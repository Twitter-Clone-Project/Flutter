import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:json_annotation/json_annotation.dart';
import 'dart:convert';

import 'package:x_clone/features/auth/data/model/user.dart';

part 'home_response.freezed.dart';
part 'home_response.g.dart';

HomeResponse homeResponseFromJson(String str) =>
    HomeResponse.fromJson(json.decode(str));

String homeResponseToJson(HomeResponse data) => json.encode(data.toJson());

@freezed
class HomeResponse with _$HomeResponse {
  const factory HomeResponse({
    @Default([]) List<Tweet> data,
    int? total,
  }) = _HomeResponse;
  factory HomeResponse.fromJson(Map<String, dynamic> json) =>
      _$HomeResponseFromJson(json);
}

@freezed
class Tweet with _$Tweet {
  const factory Tweet({
    String? id,
    String? text,
    String? createdAt,
    bool? isRetweet,
    User? user,
    List<String>? attachmentsUrl,
    bool? isLiked,
    bool? isRetweeted,
    bool? isReplied,
    int? likesCount,
    int? retweetsCount,
    int? repliesCount,
  }) = _Tweet;
  factory Tweet.fromJson(Map<String, dynamic> json) => _$TweetFromJson(json);
}
