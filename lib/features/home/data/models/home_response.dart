import 'package:freezed_annotation/freezed_annotation.dart';
import 'dart:convert';

import 'package:x_clone/features/auth/data/model/user.dart';

part 'home_response.freezed.dart';
part 'home_response.g.dart';

/// Converts a JSON string to a [HomeResponse] object.
HomeResponse homeResponseFromJson(String str) =>
    HomeResponse.fromJson(json.decode(str));

/// Converts a [HomeResponse] object to a JSON string.
String homeResponseToJson(HomeResponse data) => json.encode(data.toJson());

/// Represents the response data for the home screen.
///
/// The [HomeResponse] class contains a list of [Tweet] objects and the total count of tweets.
@freezed
class HomeResponse with _$HomeResponse {
  const factory HomeResponse({
    @Default([]) List<Tweet> data,
    int? total,
  }) = _HomeResponse;

  /// Creates a [HomeResponse] object from a JSON map.
  factory HomeResponse.fromJson(Map<String, dynamic> json) =>
      _$HomeResponseFromJson(json);
}

/// Represents a tweet.
///
/// The [Tweet] class contains various properties of a tweet, such as its ID, text, creation date,
/// user information, attachments, and engagement metrics.
@freezed
class Tweet with _$Tweet {
  const factory Tweet({
    String? id,
    String? text,
    String? createdAt,
    bool? isRetweet,
    User? user,
    User? retweetedUser,
    List<String>? attachmentsUrl,
    bool? isLiked,
    bool? isRetweeted,
    bool? isReplied,
    int? likesCount,
    int? retweetsCount,
    int? repliesCount,
  }) = _Tweet;

  /// Creates a [Tweet] object from a JSON map.
  factory Tweet.fromJson(Map<String, dynamic> json) => _$TweetFromJson(json);
}
