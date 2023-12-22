import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:json_annotation/json_annotation.dart';
import 'dart:convert';

part 'tweet_response.freezed.dart';
part 'tweet_response.g.dart';

LikersList LikersResponseFromJson(String str) =>
    LikersList.fromJson(json.decode(str));

String LikersResponseToJson(LikersList data) => json.encode(data.toJson());

@freezed
class LikerData with _$LikerData {
  const factory LikerData({
    String? id,
    String? name,
    String? screenName,
    String? profileImageURL,
    bool? isFollowed,
  }) = _LikerData;

  factory LikerData.fromJson(Map<String, dynamic> json) =>
      _$LikerDataFromJson(json);
}

@freezed
class LikersList with _$LikersList {
  const factory LikersList({
    List<LikerData>? data,
  }) = _LikersList;

  factory LikersList.fromJson(Map<String, dynamic> json) =>
      _$LikersListFromJson(json);
}

RetweetersList RetweetersResponseFromJson(String str) =>
    RetweetersList.fromJson(json.decode(str));

String RetweetersResponseToJson(RetweetersList data) =>
    json.encode(data.toJson());

@freezed
class RetweeterData with _$RetweeterData {
  const factory RetweeterData({
    String? id,
    String? name,
    String? screenName,
    String? profileImageURL,
    bool? isFollowed,
  }) = _RetweeterData;

  factory RetweeterData.fromJson(Map<String, dynamic> json) =>
      _$RetweeterDataFromJson(json);
}

@freezed
class RetweetersList with _$RetweetersList {
  const factory RetweetersList({
    List<RetweeterData>? data,
  }) = _RetweetersList;

  factory RetweetersList.fromJson(Map<String, dynamic> json) =>
      _$RetweetersListFromJson(json);
}

RepliersList RepliersResponseFromJson(String str) =>
    RepliersList.fromJson(json.decode(str));

String RepliersResponseToJson(RepliersList data) => json.encode(data.toJson());

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
    String? profileImageURL,
    String? followersCount,
    String? followingCount,
    bool? isFollowed,
  }) = _ReplierData;

  factory ReplierData.fromJson(Map<String, dynamic> json) =>
      _$ReplierDataFromJson(json);
}

@freezed
class RepliersList with _$RepliersList {
  const factory RepliersList({
    List<ReplierData>? data,
  }) = _RepliersList;

  factory RepliersList.fromJson(Map<String, dynamic> json) =>
      _$RepliersListFromJson(json);
}
