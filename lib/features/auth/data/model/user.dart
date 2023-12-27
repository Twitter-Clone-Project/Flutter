import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:json_annotation/json_annotation.dart';
import 'dart:convert';

part 'user.freezed.dart';
part 'user.g.dart';

User userFromJson(String str) => User.fromJson(json.decode(str));

String userToJson(User data) => json.encode(data.toJson());

/// Represents a user in the application.
///
/// This class defines the properties and methods associated with a user.
/// It is used to store and manipulate user data within the application.
/// The user object contains information such as user ID, name, username,
/// email, profile image URL, banner URL, follower and following counts,
/// birth date, bio, location, website, confirmation status, and online status.
///
/// Example:
/// ```dart
/// User user = User(
///   userId: '123456',
///   name: 'John Doe',
///   username: 'johndoe',
///   email: 'johndoe@example.com',
///   imageUrl: 'https://example.com/profile.jpg',
///   bannerUrl: 'https://example.com/banner.jpg',
///   followingsCount: '100',
///   followersCount: '200',
///   birthDate: '1990-01-01',
///   bio: 'Software Engineer',
///   location: 'New York',
///   website: 'https://example.com',
///   isConfirmed: true,
///   isOnline: false,
/// );
/// ```
@freezed
class User with _$User {
  const factory User({
    String? userId,
    String? name,
    String? username,
    String? screenName,
    String? email,
    @Default("https://kady-twitter-images.s3.amazonaws.com/defaultProfile.jpg")
    String? imageUrl,
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

/// Converts a JSON string [str] to a [MutersList] object.
///
/// This function takes a JSON string as input and converts it into a [MutersList] object.
/// It uses the `fromJson` method from the [MutersList] class to perform the conversion.
///
/// Example:
/// ```dart
/// String jsonString = '{"muters": [{"id": 1, "name": "John"}, {"id": 2, "name": "Jane"}]}';
/// MutersList mutersList = MutersResponseFromJson(jsonString);
/// print(mutersList.muters.length); // Output: 2
/// ```
MutersList MutersResponseFromJson(String str) =>
  MutersList.fromJson(json.decode(str));

/// Converts a [MutersList] object [data] to a JSON string.
///
/// This function takes a [MutersList] object as input and converts it into a JSON string.
/// It uses the `toJson` method from the [MutersList] class to perform the conversion.
///
/// Example:
/// ```dart
/// MutersList mutersList = MutersList(muters: [
///   Muter(id: 1, name: "John"),
///   Muter(id: 2, name: "Jane"),
/// ]);
/// String jsonString = MutersResponseToJson(mutersList);
/// print(jsonString); // Output: '{"muters":[{"id":1,"name":"John"},{"id":2,"name":"Jane"}]}'
/// ```
String MutersResponseToJson(MutersList data) => json.encode(data.toJson());

/// Represents the data model for a Muter user.
///
/// This class defines the properties of a Muter user, including the user ID,
/// username, name, bio, and image URL.
///
/// Example usage:
/// ```dart
/// MuterData user = MuterData(
///   userId: '123456789',
///   username: 'john_doe',
///   name: 'John Doe',
///   bio: 'Software Engineer',
///   imageUrl: 'https://example.com/profile.jpg',
/// );
/// ```
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

/// Represents a list of users who have been muted.
/// 
/// This class is used to store the list of users who have been muted by the current user.
/// It contains a list of [MuterData] objects representing the muted users.
/// 
/// Example usage:
/// 
/// ```dart
/// MutersList mutersList = MutersList(users: [
///   MuterData(id: 1, name: 'John'),
///   MuterData(id: 2, name: 'Jane'),
/// ]);
/// ```
@freezed
class MutersList with _$MutersList {
  const factory MutersList({
    List<MuterData>? users,
  }) = _MutersList;

  factory MutersList.fromJson(Map<String, dynamic> json) =>
      _$MutersListFromJson(json);
}

/// Converts a JSON string to a [BlockersList] object.
/// 
/// This function takes a JSON string as input and converts it into a [BlockersList] object.
/// 
/// Example usage:
/// 
/// ```dart
/// String jsonString = '{"users": [{"id": 1, "name": "John"}, {"id": 2, "name": "Jane"}]}';
/// BlockersList blockersList = BlockersResponseFromJson(jsonString);
/// ```
BlockersList BlockersResponseFromJson(String str) =>
    BlockersList.fromJson(json.decode(str));

/// Converts a [BlockersList] object to a JSON string.
/// 
/// This function takes a [BlockersList] object as input and converts it into a JSON string.
/// 
/// Example usage:
/// 
/// ```dart
/// BlockersList blockersList = BlockersList(users: [
///   BlockerData(id: 1, name: 'John'),
///   BlockerData(id: 2, name: 'Jane'),
/// ]);
/// String jsonString = BlockersResponseToJson(blockersList);
/// ```
String BlockersResponseToJson(BlockersList data) => json.encode(data.toJson());

/// Represents the data model for a blocker user.
///
/// A blocker user is a user who has been blocked by another user in the application.
/// It contains information such as the user ID, username, name, bio, and image URL.
@freezed
class BlockerData with _$BlockerData {
  const factory BlockerData({
    String? userId,
    String? username,
    String? name,
    String? bio,
    String? imageUrl,
  }) = _BlockerData;

  /// Creates a [BlockerData] instance from a JSON map.
  ///
  /// The JSON map should contain the following keys:
  /// - "userId": The ID of the blocker user.
  /// - "username": The username of the blocker user.
  /// - "name": The name of the blocker user.
  /// - "bio": The bio of the blocker user.
  /// - "imageUrl": The URL of the blocker user's profile image.
  ///
  /// Example usage:
  /// ```dart
  /// final json = {
  ///   "userId": "123",
  ///   "username": "john_doe",
  ///   "name": "John Doe",
  ///   "bio": "I'm a blocker user",
  ///   "imageUrl": "https://example.com/profile.jpg",
  /// };
  ///
  /// final blockerData = BlockerData.fromJson(json);
  /// ```
  factory BlockerData.fromJson(Map<String, dynamic> json) =>
      _$BlockerDataFromJson(json);
}

/// Represents a list of blockers.
///
/// This class is used to store a list of [BlockerData] objects, which represent users who are blocking the current user.
/// It is typically used in the authentication feature of the application.
///
/// Example usage:
/// ```dart
/// final blockersList = BlockersList(users: [
///   BlockerData(id: 1, name: 'User A'),
///   BlockerData(id: 2, name: 'User B'),
///   BlockerData(id: 3, name: 'User C'),
/// ]);
/// ```
@freezed
class BlockersList with _$BlockersList {
  const factory BlockersList({
    List<BlockerData>? users,
  }) = _BlockersList;

  factory BlockersList.fromJson(Map<String, dynamic> json) =>
      _$BlockersListFromJson(json);
}
