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
