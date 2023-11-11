import 'package:freezed_annotation/freezed_annotation.dart';

import '../model/user.dart';

part 'auth_state.freezed.dart';

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
    @Default(false) bool registerLoading
  }) = _AuthState;
}
