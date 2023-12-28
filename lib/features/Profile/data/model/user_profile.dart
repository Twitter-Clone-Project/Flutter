import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:json_annotation/json_annotation.dart';
import 'dart:convert';

import '../../../auth/data/model/user.dart';
import '../../../home/data/models/home_response.dart';

part 'user_profile.freezed.dart';
part 'user_profile.g.dart';

/// Converts a JSON string to a [UserProfile] object.
///
/// Example usage:
/// ```dart
/// String jsonString = '{"userId": "123", "name": "John Doe", "username": "johndoe"}';
/// UserProfile userProfile = userProfileFromJson(jsonString);
/// print(userProfile.name); // Output: John Doe
/// ```
UserProfile userProfileFromJson(String str) =>
    UserProfile.fromJson(json.decode(str));

/// Converts a [UserProfile] object to a JSON string.
///
/// Example usage:
/// ```dart
/// UserProfile userProfile = UserProfile(userId: "123", name: "John Doe", username: "johndoe");
/// String jsonString = userProfileToJson(userProfile);
/// print(jsonString); // Output: {"userId": "123", "name": "John Doe", "username": "johndoe"}
/// ```
String userProfileToJson(UserProfile data) => json.encode(data.toJson());

/// Represents a user profile.
///
/// Example usage:
/// ```dart
/// UserProfile userProfile = UserProfile(userId: "123", name: "John Doe", username: "johndoe");
/// print(userProfile.name); // Output: John Doe
/// ```
@freezed
class UserProfile with _$UserProfile {
  const factory UserProfile(
      {String? userId,
      String? name,
      String? username,
      String? bio,
      String? website,
      String? location,
      @Default(
          "https://kady-twitter-images.s3.amazonaws.com/defaultProfile.jpg")
      String imageUrl,
      @Default("https://kady-twitter-images.s3.amazonaws.com/DefaultBanner.png")
      String bannerUrl,
      String? birthDate,
      String? createdAt,
      bool? isFollowed,
      bool? isConfirmed,
      bool? isFollowing,
      bool? isMuted,
      bool? isBlocked,
      bool? isBlockingMe,
      String? followersCount,
      String? followingsCount}) = _UserProfile;

  /// Creates a [UserProfile] object from a JSON map.
  ///
  /// Example usage:
  /// ```dart
  /// Map<String, dynamic> json = {
  ///   "userId": "123",
  ///   "name": "John Doe",
  ///   "username": "johndoe"
  /// };
  /// UserProfile userProfile = UserProfile.fromJson(json);
  /// print(userProfile.name); // Output: John Doe
  /// ```
  factory UserProfile.fromJson(Map<String, dynamic> json) =>
      _$UserProfileFromJson(json);
}

/// Converts a JSON string to a [ProfileTweetsResponse] object.
///
/// Example usage:
/// ```dart
/// String jsonString = '{"data": [{"id": "1", "text": "Hello World"}], "total": 1}';
/// ProfileTweetsResponse response = profileTweetsResponseFromJson(jsonString);
/// print(response.data.length); // Output: 1
/// ```
ProfileTweetsResponse profileTweetsResponseFromJson(String str) =>
    ProfileTweetsResponse.fromJson(json.decode(str));

/// Converts a [ProfileTweetsResponse] object to a JSON string.
///
/// Example usage:
/// ```dart
/// ProfileTweetsResponse response = ProfileTweetsResponse(data: [Tweet(id: "1", text: "Hello World")], total: 1);
/// String jsonString = profileTweetsResponseToJson(response);
/// print(jsonString); // Output: {"data": [{"id": "1", "text": "Hello World"}], "total": 1}
/// ```
String profileTweetsResponseToJson(ProfileTweetsResponse data) =>
    json.encode(data.toJson());

/// Represents a response containing a list of tweets for a user profile.
///
/// Example usage:
/// ```dart
/// ProfileTweetsResponse response = ProfileTweetsResponse(data: [Tweet(id: "1", text: "Hello World")], total: 1);
/// print(response.data.length); // Output: 1
/// ```
@freezed
class ProfileTweetsResponse with _$ProfileTweetsResponse {
  const factory ProfileTweetsResponse({
    @Default([]) List<Tweet> data,
    int? total,
  }) = _ProfileTweetsResponse;

  /// Creates a [ProfileTweetsResponse] object from a JSON map.
  ///
  /// Example usage:
  /// ```dart
  /// Map<String, dynamic> json = {
  ///   "data": [{"id": "1", "text": "Hello World"}],
  ///   "total": 1
  /// };
  /// ProfileTweetsResponse response = ProfileTweetsResponse.fromJson(json);
  /// print(response.data.length); // Output: 1
  /// ```
  factory ProfileTweetsResponse.fromJson(Map<String, dynamic> json) =>
      _$ProfileTweetsResponseFromJson(json);
}

/// Converts a JSON string to a [ProfileLikedTweetsResponse] object.
///
/// Example usage:
/// ```dart
/// String jsonString = '{"data": [{"id": "1", "text": "Hello World"}], "total": 1}';
/// ProfileLikedTweetsResponse response = profileLikedTweetsResponseFromJson(jsonString);
/// print(response.data.length); // Output: 1
/// ```
ProfileLikedTweetsResponse profileLikedTweetsResponseFromJson(String str) =>
    ProfileLikedTweetsResponse.fromJson(json.decode(str));

/// Converts a [ProfileLikedTweetsResponse] object to a JSON string.
///
/// Example usage:
/// ```dart
/// ProfileLikedTweetsResponse response = ProfileLikedTweetsResponse(data: [Tweet(id: "1", text: "Hello World")], total: 1);
/// String jsonString = profileLikedTweetsResponseToJson(response);
/// print(jsonString); // Output: {"data": [{"id": "1", "text": "Hello World"}], "total": 1}
/// ```
String profileLikedTweetsResponseToJson(ProfileLikedTweetsResponse data) =>
    json.encode(data.toJson());

/// Represents a response containing a list of liked tweets for a user profile.
///
/// Example usage:
/// ```dart
/// ProfileLikedTweetsResponse response = ProfileLikedTweetsResponse(data: [Tweet(id: "1", text: "Hello World")], total: 1);
/// print(response.data.length); // Output: 1
/// ```
@freezed
class ProfileLikedTweetsResponse with _$ProfileLikedTweetsResponse {
  const factory ProfileLikedTweetsResponse({
    @Default([]) List<Tweet> data,
    int? total,
  }) = _ProfileLikedTweetsResponse;

  /// Creates a [ProfileLikedTweetsResponse] object from a JSON map.
  ///
  /// Example usage:
  /// ```dart
  /// Map<String, dynamic> json = {
  ///   "data": [{"id": "1", "text": "Hello World"}],
  ///   "total": 1
  /// };
  /// ProfileLikedTweetsResponse response = ProfileLikedTweetsResponse.fromJson(json);
  /// print(response.data.length); // Output: 1
  /// ```
  factory ProfileLikedTweetsResponse.fromJson(Map<String, dynamic> json) =>
      _$ProfileLikedTweetsResponseFromJson(json);
}

/// Converts a JSON string to a [FollowersList] object.
///
/// Example usage:
/// ```dart
/// String jsonString = '{"data": [{"userId": "123", "username": "johndoe"}]}';
/// FollowersList response = FollowersResponseFromJson(jsonString);
/// print(response.data.length); // Output: 1
/// ```
FollowersList FollowersResponseFromJson(String str) =>
    FollowersList.fromJson(json.decode(str));

/// Converts a [FollowersList] object to a JSON string.
///
/// Example usage:
/// ```dart
/// FollowersList response = FollowersList(data: [FollowerData(userId: "123", username: "johndoe")]);
/// String jsonString = FollowersResponseToJson(response);
/// print(jsonString); // Output: {"data": [{"userId": "123", "username": "johndoe"}]}
/// ```
String FollowersResponseToJson(FollowersList data) =>
    json.encode(data.toJson());

/// Represents the data model for a follower.
///
/// This class defines the properties and methods associated with a follower.
/// It provides a convenient way to store and access follower data.
@freezed
class FollowerData with _$FollowerData {
  const factory FollowerData({
    /// The unique identifier of the user.
    String? userId,

    /// The username of the user.
    String? username,

    /// The name of the user.
    String? name,

    /// The bio of the user.
    String? bio,

    /// The URL of the user's profile image.
    String? imageUrl,

    /// Indicates whether the user is followed by the current user.
    bool? isFollowed,

    /// Indicates whether the current user is following the user.
    bool? isFollowing,

    /// The number of followers the user has.
    String? followersCount,

    /// The number of users the user is following.
    String? followingCount,
  }) = _FollowerData;

  /// Creates a [FollowerData] instance from a JSON map.
  ///
  /// This factory method is used to create a [FollowerData] instance from
  /// a JSON map, typically retrieved from an API response.
  ///
  /// Example usage:
  /// ```dart
  /// final json = {
  ///   'userId': '123',
  ///   'username': 'john_doe',
  ///   'name': 'John Doe',
  ///   'bio': 'Software Engineer',
  ///   'imageUrl': 'https://example.com/profile.jpg',
  ///   'isFollowed': true,
  ///   'isFollowing': false,
  ///   'followersCount': '100',
  ///   'followingCount': '50',
  /// };
  ///
  /// final followerData = FollowerData.fromJson(json);
  /// ```
  factory FollowerData.fromJson(Map<String, dynamic> json) =>
      _$FollowerDataFromJson(json);
}

/// Represents a list of followers.
///
/// This class is used to store a list of [FollowerData] objects.
/// It is typically used in the context of a user's profile to display
/// the list of followers.
///
/// Example usage:
/// ```dart
/// FollowersList followersList = FollowersList(
///   data: [
///     FollowerData(name: 'John Doe', username: 'johndoe'),
///     FollowerData(name: 'Jane Smith', username: 'janesmith'),
///   ],
/// );
///
/// print(followersList.data.length); // Output: 2
/// print(followersList.data[0].name); // Output: John Doe
/// ```
@freezed
class FollowersList with _$FollowersList {
  const factory FollowersList({
    List<FollowerData>? data,
  }) = _FollowersList;

  factory FollowersList.fromJson(Map<String, dynamic> json) =>
      _$FollowersListFromJson(json);
}

/// Converts a JSON string to a [FollowingsList] object.
///
/// Example usage:
/// ```dart
/// String jsonString = '{"data": [{"userId": "123", "username": "johndoe"}]}';
/// FollowingsList response = FollowingsResponseFromJson(jsonString);
/// print(response.data.length); // Output: 1
/// ```
FollowingsList FollowingsResponseFromJson(String str) =>
    FollowingsList.fromJson(json.decode(str));

/// Converts a [FollowingsList] object to a JSON string.
///
/// Example usage:
/// ```dart
/// FollowingsList response = FollowingsList(data: [FollowingData(userId: "123", username: "johndoe")]);
/// String jsonString = FollowingsResponseToJson(response);
/// print(jsonString); // Output: {"data": [{"userId": "123", "username": "johndoe"}]}
/// ```
String FollowingsResponseToJson(FollowingsList data) =>
    json.encode(data.toJson());

/// Represents the data of a user's following.
///
/// This class is used to store information about a user's following, including
/// the user ID, username, name, bio, image URL, and follow status.
///
/// Example usage:
/// ```dart
/// FollowingData data = FollowingData(
///   userId: "123",
///   username: "johndoe",
///   name: "John Doe",
///   bio: "Software Engineer",
///   imageUrl: "https://example.com/profile.jpg",
///   isFollowed: true,
///   isFollowing: false,
///   followersCount: "100",
///   followingCount: "50",
/// );
/// ```
@freezed
class FollowingData with _$FollowingData {
  const factory FollowingData({
    String? userId,
    String? username,
    String? name,
    String? bio,
    String? imageUrl,
    bool? isFollowed,
    bool? isFollowing,
    String? followersCount,
    String? followingCount,
  }) = _FollowingData;

  /// Creates a [FollowingData] object from a JSON map.
  ///
  /// Example usage:
  /// ```dart
  /// Map<String, dynamic> json = {
  ///   "userId": "123",
  ///   "username": "johndoe",
  ///   "name": "John Doe",
  ///   "bio": "Software Engineer",
  ///   "imageUrl": "https://example.com/profile.jpg",
  ///   "isFollowed": true,
  ///   "isFollowing": false,
  ///   "followersCount": "100",
  ///   "followingCount": "50",
  /// };
  /// FollowingData data = FollowingData.fromJson(json);
  /// ```
  factory FollowingData.fromJson(Map<String, dynamic> json) =>
      _$FollowingDataFromJson(json);
}

/// Represents a list of user followings.
///
/// This class is used to store a list of [FollowingData] objects.
///
/// Example usage:
/// ```dart
/// FollowingsList list = FollowingsList(
///   data: [
///     FollowingData(
///       userId: "123",
///       username: "johndoe",
///       name: "John Doe",
///       bio: "Software Engineer",
///       imageUrl: "https://example.com/profile.jpg",
///       isFollowed: true,
///       isFollowing: false,
///       followersCount: "100",
///       followingCount: "50",
///     ),
///     FollowingData(
///       userId: "456",
///       username: "janedoe",
///       name: "Jane Doe",
///       bio: "Web Developer",
///       imageUrl: "https://example.com/profile.jpg",
///       isFollowed: false,
///       isFollowing: true,
///       followersCount: "200",
///       followingCount: "75",
///     ),
///   ],
/// );
/// print(list.data.length); // Output: 2
/// ```
@freezed
class FollowingsList with _$FollowingsList {
  const factory FollowingsList({
    List<FollowingData>? data,
  }) = _FollowingsList;

  /// Creates a [FollowingsList] object from a JSON map.
  ///
  /// Example usage:
  /// ```dart
  /// Map<String, dynamic> json = {
  ///   "data": [
  ///     {
  ///       "userId": "123",
  ///       "username": "johndoe",
  ///       "name": "John Doe",
  ///       "bio": "Software Engineer",
  ///       "imageUrl": "https://example.com/profile.jpg",
  ///       "isFollowed": true,
  ///       "isFollowing": false,
  ///       "followersCount": "100",
  ///       "followingCount": "50",
  ///     },
  ///     {
  ///       "userId": "456",
  ///       "username": "janedoe",
  ///       "name": "Jane Doe",
  ///       "bio": "Web Developer",
  ///       "imageUrl": "https://example.com/profile.jpg",
  ///       "isFollowed": false,
  ///       "isFollowing": true,
  ///       "followersCount": "200",
  ///       "followingCount": "75",
  ///     },
  ///   ],
  /// };
  /// FollowingsList response = FollowingsList.fromJson(json);
  /// print(response.data.length); // Output: 1
  /// ```
  factory FollowingsList.fromJson(Map<String, dynamic> json) =>
      _$FollowingsListFromJson(json);
}
