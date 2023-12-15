import 'dart:convert';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../home/data/models/home_response.dart';

part 'search_response.freezed.dart';
part 'search_response.g.dart';

@freezed
abstract class TrendData with _$TrendData {
  const factory TrendData({
    String? name,
  }) = _TrendData;

  factory TrendData.fromJson(Map<String, dynamic> json) =>
      _$TrendDataFromJson(json);
}

@freezed
abstract class TrendingList with _$TrendingList {
  const factory TrendingList({
    List<TrendData>? data,
  }) = _TrendingList;

  factory TrendingList.fromJson(Map<String, dynamic> json) =>
      _$TrendingListFromJson(json);
}

TrendingList trendResponseFromJson(String str) =>
    TrendingList.fromJson(json.decode(str));

String trendResponseToJson(TrendingList data) => json.encode(data.toJson());



//Searched Users List
UsersList UsersResponseFromJson(String str) =>
    UsersList.fromJson(json.decode(str));

String UsersResponseToJson(UsersList data) => json.encode(data.toJson());

@freezed
class UserData with _$UserData {
  const factory UserData({
    String? id,
    String? email,
    String? name,
    String? username,
    String? profileImageUrl,
  }) = _UserData;

  factory UserData.fromJson(Map<String, dynamic> json) =>
      _$UserDataFromJson(json);
}

@freezed
class UsersList with _$UsersList {
  const factory UsersList({
    List<UserData>? data,
  }) = _UsersList;

  factory UsersList.fromJson(Map<String, dynamic> json) =>
      _$UsersListFromJson(json);
}

TweetList tweetListFromJson(String str) =>
    TweetList.fromJson(json.decode(str));

String tweetListToJson(TweetList data) => json.encode(data.toJson());

@freezed
class TweetList with _$TweetList {
  const factory TweetList({
    @Default([]) List<Tweet> data,
    int? total,
  }) = _TweetList;
  factory TweetList.fromJson(Map<String, dynamic> json) =>
      _$TweetListFromJson(json);
}