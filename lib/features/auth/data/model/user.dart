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
    @Default("https://kady-twitter-images.s3.amazonaws.com/defaultProfile.jpg") String? profileImageURL,
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
