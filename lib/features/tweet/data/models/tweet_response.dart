import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:json_annotation/json_annotation.dart';
import 'dart:convert';

part 'tweet_response.freezed.dart';
part 'tweet_response.g.dart';

/// Converts a JSON string to a [LikersList] object.
///
/// Example usage:
/// ```dart
/// String jsonString = '{"data": [{"id": "1", "name": "John", "screenName": "john123", "imageUrl": "https://example.com/image.jpg", "isFollowed": true}]}';
/// LikersList likersList = LikersResponseFromJson(jsonString);
/// ```
LikersList LikersResponseFromJson(String str) =>
    LikersList.fromJson(json.decode(str));

/// Converts a [LikersList] object to a JSON string.
///
/// Example usage:
/// ```dart
/// LikersList likersList = LikersList(data: [
///   LikerData(id: "1", name: "John", screenName: "john123", imageUrl: "https://example.com/image.jpg", isFollowed: true),
/// ]);
/// String jsonString = LikersResponseToJson(likersList);
/// ```
String LikersResponseToJson(LikersList data) => json.encode(data.toJson());

/// Represents a liker's data.
///
/// Example usage:
/// ```dart
/// LikerData liker = LikerData(
///   id: "1",
///   name: "John",
///   screenName: "john123",
///   imageUrl: "https://example.com/image.jpg",
///   isFollowed: true,
/// );
/// ```
@freezed
class LikerData with _$LikerData {
  const factory LikerData({
    String? id,
    String? name,
    String? screenName,
    String? imageUrl,
    bool? isFollowed,
  }) = _LikerData;

  factory LikerData.fromJson(Map<String, dynamic> json) =>
      _$LikerDataFromJson(json);
}

/// Represents a list of likers.
///
/// Example usage:
/// ```dart
/// LikersList likersList = LikersList(data: [
///   LikerData(id: "1", name: "John", screenName: "john123", imageUrl: "https://example.com/image.jpg", isFollowed: true),
/// ]);
/// ```
@freezed
class LikersList with _$LikersList {
  const factory LikersList({
    List<LikerData>? data,
  }) = _LikersList;

  factory LikersList.fromJson(Map<String, dynamic> json) =>
      _$LikersListFromJson(json);
}

/// Converts a JSON string to a [RetweetersList] object.
///
/// Example usage:
/// ```dart
/// String jsonString = '{"data": [{"id": "1", "name": "John", "screenName": "john123", "imageUrl": "https://example.com/image.jpg", "isFollowed": true}]}';
/// RetweetersList retweetersList = RetweetersResponseFromJson(jsonString);
/// ```
RetweetersList RetweetersResponseFromJson(String str) =>
    RetweetersList.fromJson(json.decode(str));

/// Converts a [RetweetersList] object to a JSON string.
///
/// Example usage:
/// ```dart
/// RetweetersList retweetersList = RetweetersList(data: [
///   RetweeterData(id: "1", name: "John", screenName: "john123", imageUrl: "https://example.com/image.jpg", isFollowed: true),
/// ]);
/// String jsonString = RetweetersResponseToJson(retweetersList);
/// ```
String RetweetersResponseToJson(RetweetersList data) =>
    json.encode(data.toJson());

/// Represents a retweeter's data.
///
/// Example usage:
/// ```dart
/// RetweeterData retweeter = RetweeterData(
///   id: "1",
///   name: "John",
///   screenName: "john123",
///   imageUrl: "https://example.com/image.jpg",
///   isFollowed: true,
/// );
/// ```
@freezed
class RetweeterData with _$RetweeterData {
  const factory RetweeterData({
    String? id,
    String? name,
    String? screenName,
    String? imageUrl,
    bool? isFollowed,
  }) = _RetweeterData;

  factory RetweeterData.fromJson(Map<String, dynamic> json) =>
      _$RetweeterDataFromJson(json);
}

/// Represents a list of retweeters.
///
/// Example usage:
/// ```dart
/// RetweetersList retweetersList = RetweetersList(data: [
///   RetweeterData(id: "1", name: "John", screenName: "john123", imageUrl: "https://example.com/image.jpg", isFollowed: true),
/// ]);
/// ```
@freezed
class RetweetersList with _$RetweetersList {
  const factory RetweetersList({
    List<RetweeterData>? data,
  }) = _RetweetersList;

  factory RetweetersList.fromJson(Map<String, dynamic> json) =>
      _$RetweetersListFromJson(json);
}

/// Converts a JSON string to a [RepliersList] object.
///
/// Example usage:
/// ```dart
/// String jsonString = '{"data": [{"replyId": "1", "replyTweetId": "2", "replyUserId": "3", "replyText": "Hello", "createdAt": "2022-01-01", "username": "john123", "screenName": "john123", "bio": "Software Engineer", "imageUrl": "https://example.com/image.jpg", "followersCount": "100", "followingCount": "50", "isFollowed": true}]}';
/// RepliersList repliersList = RepliersResponseFromJson(jsonString);
/// ```
RepliersList RepliersResponseFromJson(String str) =>
    RepliersList.fromJson(json.decode(str));

/// Converts a [RepliersList] object to a JSON string.
///
/// Example usage:
/// ```dart
/// RepliersList repliersList = RepliersList(data: [
///   ReplierData(
///     replyId: "1",
///     replyTweetId: "2",
///     replyUserId: "3",
///     replyText: "Hello",
///     createdAt: "2022-01-01",
///     username: "john123",
///     screenName: "john123",
///     bio: "Software Engineer",
///     imageUrl: "https://example.com/image.jpg",
///     followersCount: "100",
///     followingCount: "50",
///     isFollowed: true,
///   ),
/// ]);
/// String jsonString = RepliersResponseToJson(repliersList);
/// ```
String RepliersResponseToJson(RepliersList data) => json.encode(data.toJson());

/// Represents a replier's data.
///
/// Example usage:
/// ```dart
/// ReplierData replier = ReplierData(
///   replyId: "1",
///   replyTweetId: "2",
///   replyUserId: "3",
///   replyText: "Hello",
///   createdAt: "2022-01-01",
///   username: "john123",
///   screenName: "john123",
///   bio: "Software Engineer",
///   imageUrl: "https://example.com/image.jpg",
///   followersCount: "100",
///   followingCount: "50",
///   isFollowed: true,
/// );
/// ```
@freezed
class ReplierData with _$ReplierData {
  const factory ReplierData({
    String? replyId,
    String? replyTweetId,
    String? replyUserId,
    String? replyText,
    String? createdAt,
    String? username,
    String? screenName,
    String? bio,
    String? imageUrl,
    String? followersCount,
    String? followingCount,
    bool? isFollowed,
  }) = _ReplierData;

  factory ReplierData.fromJson(Map<String, dynamic> json) =>
      _$ReplierDataFromJson(json);
}

/// Represents a list of repliers.
///
/// Example usage:
/// ```dart
/// RepliersList repliersList = RepliersList(data: [
///   ReplierData(
///     replyId: "1",
///     replyTweetId: "2",
///     replyUserId: "3",
///     replyText: "Hello",
///     createdAt: "2022-01-01",
///     username: "john123",
///     screenName: "john123",
///     bio: "Software Engineer",
///     imageUrl: "https://example.com/image.jpg",
///     followersCount: "100",
///     followingCount: "50",
///     isFollowed: true,
///   ),
/// ]);
/// ```
@freezed
class RepliersList with _$RepliersList {
  const factory RepliersList({
    List<ReplierData>? data,
  }) = _RepliersList;

  factory RepliersList.fromJson(Map<String, dynamic> json) =>
      _$RepliersListFromJson(json);
}
