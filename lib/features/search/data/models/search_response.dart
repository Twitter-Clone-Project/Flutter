import 'dart:convert';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../home/data/models/home_response.dart';

part 'search_response.freezed.dart';
part 'search_response.g.dart';

@freezed
abstract class TrendData with _$TrendData {
  const factory TrendData({
    String? name,
    String? count,
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
/// Converts a JSON string to a [UsersList] object.
///
/// The [str] parameter is the JSON string to be converted.
/// Returns a [UsersList] object.
UsersList UsersResponseFromJson(String str) =>
    UsersList.fromJson(json.decode(str));

/// Converts a [UsersList] object to a JSON string.
///
/// The [data] parameter is the [UsersList] object to be converted.
/// Returns a JSON string.
String UsersResponseToJson(UsersList data) => json.encode(data.toJson());

/// Represents user data.
///
/// The [id] parameter is the unique identifier of the user.
/// The [email] parameter is the email address of the user.
/// The [screenName] parameter is the screen name of the user.
/// The [username] parameter is the username of the user.
/// The [profileImageURL] parameter is the URL of the user's profile image.
/// The [bio] parameter is the biography of the user.
/// The [isFollowed] parameter indicates whether the user is followed by the current user.
/// The [isFollowing] parameter indicates whether the current user is following the user.
@freezed
class UserData with _$UserData {
  const factory UserData({
    String? id,
    String? email,
    String? screenName,
    String? username,
    String? profileImageURL,
    String? bio,
    bool? isFollowed,
    bool? isFollowing,
  }) = _UserData;

  /// Creates a [UserData] object from a JSON map.
  ///
  /// The [json] parameter is the JSON map representing the [UserData] object.
  /// Returns a [UserData] object.
  factory UserData.fromJson(Map<String, dynamic> json) =>
      _$UserDataFromJson(json);
}

/// Represents a list of users.
///
/// The [data] parameter is a list of [UserData] objects.
/// The [total] parameter is the total number of users.
@freezed
class UsersList with _$UsersList {
  const factory UsersList({
    @Default([]) List<UserData> data,
    int? total,
  }) = _UsersList;

  /// Creates a [UsersList] object from a JSON map.
  ///
  /// The [json] parameter is the JSON map representing the [UsersList] object.
  /// Returns a [UsersList] object.
  factory UsersList.fromJson(Map<String, dynamic> json) =>
      _$UsersListFromJson(json);
}

/// Converts a JSON string to a [TweetList] object.
///
/// This function takes a JSON string [str] as input and returns a [TweetList]
/// object. It uses the [json.decode] function from the `dart:convert` library
/// to parse the JSON string and convert it into a Map. Then, it calls the
/// [TweetList.fromJson] constructor to create a [TweetList] object from the
/// parsed JSON data.
///
/// Example usage:
/// ```dart
/// String jsonString = '{"data": [{"id": 1, "text": "Hello world"}], "total": 1}';
/// TweetList tweetList = tweetListFromJson(jsonString);
/// print(tweetList.data[0].text); // Output: Hello world
/// ```
TweetList tweetListFromJson(String str) => TweetList.fromJson(json.decode(str));

/// Converts a [TweetList] object to a JSON string.
///
/// This function takes a [TweetList] object [data] as input and returns a JSON
/// string representation of the object. It uses the [json.encode] function from
/// the `dart:convert` library to convert the [TweetList] object into a JSON
/// string.
///
/// Example usage:
/// ```dart
/// TweetList tweetList = TweetList(
///   data: [
///     Tweet(id: 1, text: "Hello world"),
///   ],
///   total: 1,
/// );
/// String jsonString = tweetListToJson(tweetList);
/// print(jsonString); // Output: {"data":[{"id":1,"text":"Hello world"}],"total":1}
/// ```
String tweetListToJson(TweetList data) => json.encode(data.toJson());

/// Represents a list of tweets.
///
/// This class is a data model that represents a list of tweets. It has two
/// properties: [data] and [total]. The [data] property is a list of [Tweet]
/// objects, and the [total] property is an optional integer representing the
/// total number of tweets.
///
/// Example usage:
/// ```dart
/// TweetList tweetList = TweetList(
///   data: [
///     Tweet(id: 1, text: "Hello world"),
///   ],
///   total: 1,
/// );
/// print(tweetList.data[0].text); // Output: Hello world
/// ```
@freezed
class TweetList with _$TweetList {
  const factory TweetList({
    @Default([]) List<Tweet> data,
    int? total,
  }) = _TweetList;

  /// Constructs a [TweetList] object from a JSON map.
  ///
  /// This constructor takes a JSON map [json] as input and creates a [TweetList]
  /// object from the parsed JSON data. The [json] map should contain the
  /// following keys: "data" (a list of tweet objects) and "total" (an optional
  /// integer representing the total number of tweets).
  ///
  /// Example usage:
  /// ```dart
  /// Map<String, dynamic> json = {
  ///   "data": [
  ///     {"id": 1, "text": "Hello world"}
  ///   ],
  ///   "total": 1
  /// };
  /// TweetList tweetList = TweetList.fromJson(json);
  /// print(tweetList.data[0].text); // Output: Hello world
  /// ```
  factory TweetList.fromJson(Map<String, dynamic> json) =>
      _$TweetListFromJson(json);
}
