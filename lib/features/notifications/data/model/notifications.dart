import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:json_annotation/json_annotation.dart';
import 'dart:convert';

import 'package:x_clone/features/auth/data/model/user.dart';

part 'notifications.freezed.dart';
part 'notifications.g.dart';

/// Converts a JSON string to a [NotificationData] object.
///
/// Example usage:
/// ```dart
/// String jsonString = '{"notificationId": "123", "timestamp": "2022-01-01", "isSeen": true, "type": "message", "content": "Hello", "senderImgUrl": "https://example.com/image.jpg", "senderUsername": "John"}';
/// NotificationData notificationData = NotificationDataFromJson(jsonString);
/// ```
NotificationData NotificationDataFromJson(String str) =>
    NotificationData.fromJson(json.decode(str));

/// Converts a [NotificationData] object to a JSON string.
///
/// Example usage:
/// ```dart
/// NotificationData notificationData = NotificationData(
///   notificationId: "123",
///   timestamp: "2022-01-01",
///   isSeen: true,
///   type: "message",
///   content: "Hello",
///   senderImgUrl: "https://example.com/image.jpg",
///   senderUsername: "John",
/// );
/// String jsonString = NotificationDataToJson(notificationData);
/// ```
String NotificationDataToJson(NotificationData data) =>
    json.encode(data.toJson());

/// Represents a notification data object.
///
/// Example usage:
/// ```dart
/// NotificationData notificationData = NotificationData(
///   notificationId: "123",
///   timestamp: "2022-01-01",
///   isSeen: true,
///   type: "message",
///   content: "Hello",
///   senderImgUrl: "https://example.com/image.jpg",
///   senderUsername: "John",
/// );
/// ```
@freezed
class NotificationData with _$NotificationData {
  const factory NotificationData({
    @Default("") String notificationId,
    @Default("") String timestamp,
    @Default(false) bool isSeen,
    @Default("") String type,
    @Default("") String content,
    @Default("") String senderImgUrl,
    @Default("") String senderUsername,
  }) = _NotificationData;

  /// Creates a [NotificationData] object from a JSON map.
  ///
  /// Example usage:
  /// ```dart
  /// Map<String, dynamic> json = {
  ///   "notificationId": "123",
  ///   "timestamp": "2022-01-01",
  ///   "isSeen": true,
  ///   "type": "message",
  ///   "content": "Hello",
  ///   "senderImgUrl": "https://example.com/image.jpg",
  ///   "senderUsername": "John",
  /// };
  /// NotificationData notificationData = NotificationData.fromJson(json);
  /// ```
  factory NotificationData.fromJson(Map<String, dynamic> json) =>
      _$NotificationDataFromJson(json);
}

/// Represents a list of notifications.
///
/// Example usage:
/// ```dart
/// NotificationsList notificationsList = NotificationsList(
///   data: [
///     NotificationData(
///       notificationId: "123",
///       timestamp: "2022-01-01",
///       isSeen: true,
///       type: "message",
///       content: "Hello",
///       senderImgUrl: "https://example.com/image.jpg",
///       senderUsername: "John",
///     ),
///     NotificationData(
///       notificationId: "456",
///       timestamp: "2022-01-02",
///       isSeen: false,
///       type: "like",
///       content: "Your post was liked",
///       senderImgUrl: "https://example.com/image.jpg",
///       senderUsername: "Jane",
///     ),
///   ],
/// );
/// ```
@freezed
class NotificationsList with _$NotificationsList {
  const factory NotificationsList({
    @Default([]) List<NotificationData> data,
  }) = _NotificationsList;

  /// Creates a [NotificationsList] object from a JSON map.
  ///
  /// Example usage:
  /// ```dart
  /// Map<String, dynamic> json = {
  ///   "data": [
  ///     {
  ///       "notificationId": "123",
  ///       "timestamp": "2022-01-01",
  ///       "isSeen": true,
  ///       "type": "message",
  ///       "content": "Hello",
  ///       "senderImgUrl": "https://example.com/image.jpg",
  ///       "senderUsername": "John",
  ///     },
  ///     {
  ///       "notificationId": "456",
  ///       "timestamp": "2022-01-02",
  ///       "isSeen": false,
  ///       "type": "like",
  ///       "content": "Your post was liked",
  ///       "senderImgUrl": "https://example.com/image.jpg",
  ///       "senderUsername": "Jane",
  ///     },
  ///   ],
  /// };
  /// NotificationsList notificationsList = NotificationsList.fromJson(json);
  /// ```
  factory NotificationsList.fromJson(Map<String, dynamic> json) =>
      _$NotificationsListFromJson(json);
}
