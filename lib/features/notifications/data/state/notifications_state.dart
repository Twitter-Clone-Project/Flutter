import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../model/notifications.dart';

part 'notifications_state.freezed.dart';

/// Represents the state of the notifications feature.
///
/// This class is used to manage the state of the notifications feature in the application.
/// It contains information such as the list of notifications, loading status, error message, screen index, and error field.
/// The state is immutable and can only be modified by creating a new instance of this class.
///
/// Example usage:
/// ```dart
/// NotificationsState state = NotificationsState(
///   notifications: NotificationsList(data: []),
///   loading: true,
///   errorMessage: null,
///   screenIndex: 0,
///   error: null,
/// );
/// ```
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
