import 'package:freezed_annotation/freezed_annotation.dart';

import '../model/user_profile.dart';

part 'profile_state.freezed.dart';

@freezed
class UserProfileState with _$UserProfileState {
  const factory UserProfileState({
    required bool isLoading,
    UserProfile? userProfile,
    String? error, // Add an error field for handling errors
  }) = _UserProfileState;

  factory UserProfileState.initial() => UserProfileState(
    isLoading: false,
    userProfile: null,
    error: null,
  );
}
