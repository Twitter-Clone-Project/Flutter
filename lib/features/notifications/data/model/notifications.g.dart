// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notifications.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$NotificationDataImpl _$$NotificationDataImplFromJson(
        Map<String, dynamic> json) =>
    _$NotificationDataImpl(
      notificationId: json['notificationId'] as String? ?? "",
      timestamp: json['timestamp'] as String? ?? "",
      isSeen: json['isSeen'] as bool? ?? false,
      type: json['type'] as String? ?? "",
      content: json['content'] as String? ?? "",
      senderImgUrl: json['senderImgUrl'] as String? ?? "",
      senderUsername: json['senderUsername'] as String? ?? "",
    );

Map<String, dynamic> _$$NotificationDataImplToJson(
        _$NotificationDataImpl instance) =>
    <String, dynamic>{
      'notificationId': instance.notificationId,
      'timestamp': instance.timestamp,
      'isSeen': instance.isSeen,
      'type': instance.type,
      'content': instance.content,
      'senderImgUrl': instance.senderImgUrl,
      'senderUsername': instance.senderUsername,
    };

_$NotificationsListImpl _$$NotificationsListImplFromJson(
        Map<String, dynamic> json) =>
    _$NotificationsListImpl(
      data: (json['data'] as List<dynamic>?)
              ?.map((e) => NotificationData.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$NotificationsListImplToJson(
        _$NotificationsListImpl instance) =>
    <String, dynamic>{
      'data': instance.data,
    };
