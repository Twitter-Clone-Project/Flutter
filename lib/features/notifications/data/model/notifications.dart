import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:json_annotation/json_annotation.dart';
import 'dart:convert';

import 'package:x_clone/features/auth/data/model/user.dart';

part 'notifications.freezed.dart';
part 'notifications.g.dart';

NotificationData NotificationDataFromJson(String str) =>
    NotificationData.fromJson(json.decode(str));

String NotificationDataToJson(NotificationData data) =>
    json.encode(data.toJson());

/* 
{
  "status":true,
  "data":{
    "notifications":[
        {
          "notificationId":"3",
          "timestamp":"2023-12-18T22:20:41.921Z",
          "isSeen":false,
          "type":"FOLLOW", // CHAT, MENTION, FOLLOW, UNFOLLOW
          "content":"Yousef Rabia followed you",
          "senderImgUrl":"https://kady-twitter-images.s3.amazonaws.com/1000000034.jpg",
          "senderUsername":"ddcdvfbg"
          
        }
      ]
    }
  }
}

 */

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

  factory NotificationData.fromJson(Map<String, dynamic> json) =>
      _$NotificationDataFromJson(json);
}

@freezed
class NotificationsList with _$NotificationsList {
  const factory NotificationsList({
    @Default([]) List<NotificationData> data,
  }) = _NotificationsList;

  factory NotificationsList.fromJson(Map<String, dynamic> json) =>
      _$NotificationsListFromJson(json);
}
