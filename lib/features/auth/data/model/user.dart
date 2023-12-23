import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:json_annotation/json_annotation.dart';
import 'dart:convert';

part 'user.freezed.dart';
part 'user.g.dart';

User userFromJson(String str) => User.fromJson(json.decode(str));

String userToJson(User data) => json.encode(data.toJson());

@freezed
class User with _$User {
  const factory User({
    String? userId,
    String? name,
    String? username,
    String? screenName,
    String? email,
    @Default("https://kady-twitter-images.s3.amazonaws.com/defaultProfile.jpg")
    String? profileImageURL,
    String? bannerUrl,
    String? followingsCount,
    String? followersCount,
    String? birthDate,
    String? bio,
    String? location,
    String? website,
    bool? isConfirmed,
    bool? isOnline,
  }) = _User;

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
}

MutersList MutersResponseFromJson(String str) =>
    MutersList.fromJson(json.decode(str));

String MutersResponseToJson(MutersList data) => json.encode(data.toJson());

@freezed
class MuterData with _$MuterData {
  const factory MuterData({
    String? userId,
    String? username,
    String? name,
    String? bio,
    String? imageUrl,
  }) = _MuterData;

  factory MuterData.fromJson(Map<String, dynamic> json) =>
      _$MuterDataFromJson(json);
}

@freezed
class MutersList with _$MutersList {
  const factory MutersList({
    List<MuterData>? users,
  }) = _MutersList;

  factory MutersList.fromJson(Map<String, dynamic> json) =>
      _$MutersListFromJson(json);
}

BlockersList BlockersResponseFromJson(String str) =>
    BlockersList.fromJson(json.decode(str));

String BlockersResponseToJson(BlockersList data) => json.encode(data.toJson());

@freezed
class BlockerData with _$BlockerData {
  const factory BlockerData({
    String? userId,
    String? username,
    String? name,
    String? bio,
    String? imageUrl,
  }) = _BlockerData;

  factory BlockerData.fromJson(Map<String, dynamic> json) =>
      _$BlockerDataFromJson(json);
}

@freezed
class BlockersList with _$BlockersList {
  const factory BlockersList({
    List<BlockerData>? users,
  }) = _BlockersList;

  factory BlockersList.fromJson(Map<String, dynamic> json) =>
      _$BlockersListFromJson(json);
}