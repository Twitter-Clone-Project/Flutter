import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../model/notifications.dart';

part 'notifications_state.freezed.dart';

@freezed
class NotificationsState with _$NotificationsState {
  const factory NotificationsState({
    @Default(NotificationsList(data: [])) NotificationsList notifications,
    @Default(true) bool loading,
    @Default(null) String? errorMessage,
    @Default(0) int screenIndex,
    String? error, // Add an error field for handling errors
  }) = _NotificationsState;
}
