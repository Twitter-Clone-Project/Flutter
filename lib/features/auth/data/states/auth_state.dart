import 'package:freezed_annotation/freezed_annotation.dart';

import '../model/user.dart';

part 'auth_state.freezed.dart';

/// Represents the state of the authentication feature.
///
/// This class is used to store the current state of the authentication feature,
/// including the user information, authentication tokens, loading flags, error messages,
/// and lists of muters and blockers.
///
/// Example usage:
/// ```dart
/// AuthState state = AuthState(
///   user: User(id: 1, name: 'John Doe'),
///   token: 'abc123',
///   isLogin: true,
///   loginLoading: false,
///   otpLoading: false,
///   googleLoading: false,
///   forgetPasswordLoading: false,
///   resetPasswordLoading: false,
///   errorMessage: null,
///   registerLoading: false,
///   loading: false,
///   mutersList: MutersList(users: []),
///   blockedList: BlockersList(users: []),
/// );
/// ```
@freezed
class AuthState with _$AuthState {
  const factory AuthState({
    @Default(null) User? user,
    @Default("") String? token,
    @Default(false) bool? isLogin,
    @Default(false) bool loginLoading,
    @Default(false) bool otpLoading,
    @Default(false) bool googleLoading,
    @Default(false) bool forgetPasswordLoading,
    @Default(false) bool resetPasswordLoading,
    @Default(null) String? errorMessage,
    @Default(false) bool registerLoading,
    @Default(false) bool? loading,
    @Default(MutersList(users: [])) MutersList mutersList,
    @Default(BlockersList(users: [])) BlockersList blockedList,
  }) = _AuthState;
}
