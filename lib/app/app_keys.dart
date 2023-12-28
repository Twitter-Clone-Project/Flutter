import 'package:flutter/material.dart';

/// A class that contains global keys used throughout the application.
class AppKeys {
  /// A global key for accessing the application's navigator state.
  static final appKeyNavigator = GlobalKey<NavigatorState>();

  /// A global key for accessing the application's scaffold state.
  static final appKey = GlobalKey<ScaffoldState>();

  /// A global key for accessing the application's scaffold messenger state.
  static final GlobalKey<ScaffoldMessengerState> scaffoldMessengerKey =
    GlobalKey<ScaffoldMessengerState>();

  /// A global key for accessing the login form state.
  static final loginFormKey = GlobalKey<FormState>();

  /// A global key for accessing the service form state.
  static final serviceFormKey = GlobalKey<FormState>();

  /// A global key for accessing the register form state.
  static final registerFormKey = GlobalKey<FormState>();

  /// A global key for accessing the verify OTP form state.
  static final verifyOtpFormKey = GlobalKey<FormState>();

  /// A global key for accessing the forget password form state.
  static final forgetFormKey = GlobalKey<FormState>();

  /// A global key for accessing the reset password form state.
  static final resetFormKey = GlobalKey<FormState>();

  /// A global key for accessing the update profile form state.
  static final updateProfileFormKey = GlobalKey<FormState>();

  /// A global key for accessing the update username form state.
  static final updateUserNameFormKey = GlobalKey<FormState>();

  /// A global key for accessing the update email form state.
  static final updateemailFormKey = GlobalKey<FormState>();

  /// A global key for accessing the current password form state.
  static final currentPasswordFormKey = GlobalKey<FormState>();

  /// A global key for accessing the new password form state.
  static final newPasswordFormKey = GlobalKey<FormState>();

  /// A global key for accessing the confirm password form state.
  static final confirmPasswordFormKey = GlobalKey<FormState>();

  /// A global key for accessing the register scaffold state.
  static final GlobalKey<ScaffoldState> registerScaffoldKey =
    GlobalKey<ScaffoldState>();
}
