import 'package:x_clone/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../../../../app/app_keys.dart';
import '../../../../web_services/interceptors/main_interceptor.dart';
import '../model/user.dart';
import '../repositories/auth_repository.dart';
import '../states/auth_state.dart';

/// A provider that creates and manages the authentication state notifier.
///
/// The [authNotifierProvider] is responsible for creating an instance of [AuthStateNotifier]
/// and providing it with the necessary dependencies, such as the [authRepositoryProvider].
/// It returns the [AuthStateNotifier] instance along with an initial state of `null`.
///
final authNotifierProvider =
    StateNotifierProvider<AuthStateNotifier, AuthState>((ref) {
  final repo = ref.watch(authRepositoryProvider);
  return AuthStateNotifier(repo, null);
});

class AuthStateNotifier extends StateNotifier<AuthState> {
  final AuthRepository _repo;

  /// Initializes the [AuthStateNotifier] with the provided [AuthRepository] and an optional initial [AuthState].
  ///
  /// The [AuthStateNotifier] is responsible for managing the authentication state of the user.
  /// It checks the authentication status upon initialization and updates the state accordingly.
  /// Additionally, it can handle the refresh of the FCM token.
  ///
  /// Example:
  /// ```dart
  /// final authRepository = AuthRepository();
  /// final authStateNotifier = AuthStateNotifier(authRepository);
  /// ```
  AuthStateNotifier(this._repo, [AuthState? state])
      : super(state ?? const AuthState()) {
    checkAuthStatus();
    // onFcmTokenRefresh();
  }

  /// Checks the authentication status and updates the state accordingly.
  ///
  /// This method checks if a token is available using the `_repo.getToken()` method.
  /// If a token is available, it retrieves the user data using the `_repo.getUserData()` method.
  /// If the user data is not null, it updates the state with the user and sets `isLogin` to true.
  /// Then, it fetches the user data again using the `_repo.fetchUserData()` method and updates the state with the updated user data.
  /// If the user data is null but the mobile number is available using the `getMobileNumber()` method, it updates the state without any changes.
  /// If neither the token nor the mobile number is available, it updates the state without any changes.
  ///
  /// Example:
  /// ```dart
  /// AuthProvider authProvider = AuthProvider();
  /// await authProvider.checkAuthStatus();
  /// ```
  ///
  /// In this example, the `checkAuthStatus()` method is called on an instance of `AuthProvider` to check the authentication status.
  /// It updates the state based on the availability of a token and user data.
  /// If the user is authenticated, it fetches the updated user data and updates the state again.
  /// If the user is not authenticated but the mobile number is available, it updates the state without any changes.
  /// If neither the token nor the mobile number is available, it updates the state without any changes.
  /// ```
  Future<void> checkAuthStatus() async {
    try {
      if (_repo.getToken() != null) {
        User? user = _repo.getUserData();
        // if authenticated, update state accordingly
        if (user != null) {
          state = state.copyWith(
            user: user,
            isLogin: true,
          );
          user = await _repo.fetchUserData();
          state = state.copyWith(
            user: user,
            isLogin: true,
          );
        } else if (getMobileNumber() != null) {
          state = state.copyWith();
        } else {
          state = state.copyWith();
        }
      }
    } catch (_) {}
  }

  /// Checks if the user is logged in.
  ///
  /// Returns `true` if the user is logged in, otherwise `false`.
  /// The user is considered logged in if the [state.user] is not `null`.
  ///
  /// Example:
  /// ```dart
  /// AuthProvider authProvider = AuthProvider();
  /// bool isLoggedIn = authProvider.isUserLoggedIn();
  /// print(isLoggedIn); // Output: false
  /// ```
  bool isUserLoggedIn() {
    return state.user != null;
  }

// login(){
//     // state = state.copyWith(
//     //   loading: true,
//     //   errorMessage: '',
//     // );
// }

  /// Logs in the user with the provided [email] and [password].
  ///
  /// Returns `true` if the login is successful, otherwise returns `false`.
  /// Throws an exception if an error occurs during the login process.
  ///
  /// Example:
  /// ```dart
  /// final authProvider = AuthProvider();
  /// bool isLoggedIn = await authProvider.login(email: 'example@example.com', password: 'password123');
  /// if (isLoggedIn) {
  ///   print('User logged in successfully');
  /// } else {
  ///   print('Login failed');
  /// }
  /// ```
  login({required String email, required String password}) async {
    try {
      state = state.copyWith(loginLoading: true, errorMessage: '');

      final user = await _repo.login(email: email, password: password);
      _onUserLoggedIn(user);

      state = state.copyWith(loginLoading: false, errorMessage: '');

      return true;
    } catch (e) {
      state = state.copyWith(errorMessage: e.toString(), loginLoading: false);
      return false;
    }
  }

  /// Registers a new user with the provided information.
  ///
  /// The [username], [email], [name], [password], [birthDate], and [reCaptchaText] parameters are required.
  /// Returns `true` if the registration is successful, otherwise returns `false`.
  ///
  /// Example:
  /// ```dart
  /// final success = await register(
  ///   username: 'john_doe',
  ///   email: 'john.doe@example.com',
  ///   name: 'John Doe',
  ///   password: 'password123',
  ///   birthDate: '1990-01-01',
  ///   reCaptchaText: 'ABC123',
  /// );
  ///
  /// if (success) {
  ///   print('Registration successful!');
  /// } else {
  ///   print('Registration failed.');
  /// }
  /// ```
  register({
    required String username,
    required String email,
    required String name,
    required String password,
    required String birthDate,
    required String reCaptchaText,
  }) async {
    try {
      state = state.copyWith(registerLoading: true, errorMessage: '');

      final user = await _repo.register(
          username: username,
          email: email,
          name: name,
          password: password,
          birthDate: birthDate,
          reCaptchaText: reCaptchaText);

      state =
          state.copyWith(registerLoading: false, errorMessage: '', user: user);

      return true;
    } catch (e) {
      state = state.copyWith(registerLoading: false, errorMessage: "");
      state = state.copyWith(errorMessage: e.toString());
      return false;
    }
  }

  /// Updates the user information with the provided [name] and [imageUrl].
  ///
  /// Returns a [Future] that completes with a [bool] value indicating whether the user update was successful or not.
  /// If the update is successful, it returns `true`, otherwise it returns `false`.
  ///
  /// The [name] parameter is an optional [String] representing the new name of the user.
  /// The [imageUrl] parameter is an optional [String] representing the new image URL of the user.
  ///
  /// Example:
  /// ```dart
  /// bool success = await updateUser(name: "John Doe", imageUrl: "https://example.com/profile.jpg");
  /// if (success) {
  ///   print("User update successful");
  /// } else {
  ///   print("User update failed");
  /// }
  /// ```
  Future<bool> updateUser({
    String? name,
    String? imageUrl,
  }) async {
    try {
      User user = User(
        isConfirmed: state.user!.isConfirmed,
        email: state.user!.email!,
        userId: state.user!.userId,
        username: state.user!.username,
        name: name,
        imageUrl: imageUrl ??
            "https://kady-twitter-images.s3.amazonaws.com/defaultProfile.jpg",
      );
      state = state.copyWith(user: user);

      // _onUserLoggedIn(user);
      return true;
    } catch (e) {
      // state = state.copyWith(errorMessage: e.toString());
      return false;
    }
  }

  /// Updates the state of the authentication provider after a user has successfully logged in.
  ///
  /// This method is responsible for updating the state of the authentication provider
  /// after a user has successfully logged in. It sets the appropriate loading flags to false,
  /// updates the user object with the logged-in user, clears any error messages, and sets
  /// the login status to true.
  ///
  /// Parameters:
  /// - user: The logged-in user object.
  ///
  void _onUserLoggedIn(User? user) {
    state = state.copyWith(
        googleLoading: false,
        registerLoading: false,
        loginLoading: false,
        user: user,
        errorMessage: '',
        isLogin: true);
  }

  /// Retrieves the mobile number from the authentication provider.
  ///
  /// This method calls the `_repo.getMobileNumber()` method to fetch the mobile number
  /// from the repository. It returns the mobile number as a result.
  ///
  /// Example:
  /// ```dart
  /// String mobileNumber = authProvider.getMobileNumber();
  /// print(mobileNumber); // Output: +1234567890
  /// ```
  getMobileNumber() {
    return _repo.getMobileNumber();
  }

  /// Retrieves the authentication token.
  ///
  /// This method calls the `getToken` method from the repository to retrieve the authentication token.
  /// The authentication token is used for authenticating requests to the server.
  ///
  /// Example:
  /// ```dart
  /// String token = authProvider.getToken();
  /// print(token); // Output: "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiIxMjM0NTY3ODkwIiwibmFtZSI6IkpvaG4gRG9lIiwiaWF0IjoxNTE2MjM5MDIyfQ.SflKxwRJSMeKKF2QT4fwpMeJf36POk6yJV_adQssw5c"
  /// ```
  getToken() {
    return _repo.getToken();
  }

  /// Confirms the email by providing the OTP (One-Time Password) and email address.
  ///
  /// The [otp] parameter is the One-Time Password received by the user.
  /// The [email] parameter is the email address of the user.
  /// The [isSignup] parameter indicates whether the email confirmation is for a signup process.
  /// The [newEmail] parameter is an optional parameter that represents the new email address if the user wants to change their email.
  ///
  /// Returns `true` if the email confirmation is successful, otherwise `false`.
  ///
  /// Example:
  /// ```dart
  /// final otp = "123456";
  /// final email = "example@example.com";
  /// final isSignup = true;
  /// final newEmail = "newemail@example.com";
  ///
  /// final result = await authProvider.confirmEmail(
  ///   otp: otp,
  ///   email: email,
  ///   isSignup: isSignup,
  ///   newEmail: newEmail,
  /// );
  ///
  /// if (result) {
  ///   print("Email confirmation successful");
  /// } else {
  ///   print("Email confirmation failed");
  /// }
  /// ```
  confirmEmail({
    required String otp,
    required String email,
    required bool isSignup,
    String? newEmail,
  }) async {
    try {
      state = state.copyWith(otpLoading: true, errorMessage: '');

      final user = await _repo.confirmEmail(
        otp: otp,
        email: email,
        isSignUp: isSignup,
        newEmail: newEmail,
      );
      if (isSignup) {
        _onUserLoggedIn(user);
      }
      state = state.copyWith(otpLoading: false, errorMessage: '');
      return true;
    } catch (e) {
      state = state.copyWith(otpLoading: false, errorMessage: "");
      state = state.copyWith(errorMessage: e.toString());
      return false;
    }
  }

  /// Resets the password for a user.
  ///
  /// This method takes in the [password], [passwordConfirm], and [email] as required parameters.
  /// It updates the state to indicate that the password reset is in progress by setting [resetPasswordLoading] to true.
  /// Then, it calls the `_repo.resetPassword` method to reset the password.
  /// If the password reset is successful, it updates the state to indicate that the password reset is complete by setting [resetPasswordLoading] to false.
  /// If an error occurs during the password reset process, it updates the state with the error message.
  ///
  /// Returns `true` if the password reset is successful, otherwise returns `false`.
  ///
  /// Example:
  /// ```dart
  /// final password = 'newPassword123';
  /// final passwordConfirm = 'newPassword123';
  /// final email = 'example@example.com';
  ///
  /// final result = await authProvider.resetPassword(
  ///   password: password,
  ///   passwordConfirm: passwordConfirm,
  ///   email: email,
  /// );
  ///
  /// if (result) {
  ///   print('Password reset successful');
  /// } else {
  ///   print('Password reset failed');
  /// }
  /// ```
  resetPassword({
    required String password,
    required String passwordConfirm,
    required String email,
  }) async {
    try {
      state = state.copyWith(
        resetPasswordLoading: true,
      );

      final result = await _repo.resetPassword(
        email: email,
        password: password,
        passwordConfirm: passwordConfirm,
      );
      if (result == true) {
        state = state.copyWith(
          resetPasswordLoading: false,
        );
      }

      return true;
    } catch (e) {
      state = state.copyWith(resetPasswordLoading: false, errorMessage: "");
      state = state.copyWith(errorMessage: e.toString());
      return false;
    }
  }

  /// Sends a forget password request to the authentication provider.
  ///
  /// This method sets the [forgetPasswordLoading] flag to true in the state,
  /// indicating that the forget password request is in progress. It then calls
  /// the [_repo.forgetPassword] method to send the forget password request
  /// with the provided [email]. If the request is successful (result is true),
  /// it sets the [forgetPasswordLoading] flag to false in the state. If an
  /// exception occurs during the request, it sets the [forgetPasswordLoading]
  /// flag to false and updates the [errorMessage] in the state with the
  /// exception message.
  ///
  /// Returns true if the forget password request is successful, and false
  /// otherwise.
  ///
  /// Example:
  /// ```dart
  /// final email = 'example@example.com';
  /// final success = await authProvider.forgetPassword(email: email);
  /// if (success) {
  ///   print('Forget password request sent successfully.');
  /// } else {
  ///   print('Failed to send forget password request.');
  /// }
  /// ```
  forgetPassword({required String email}) async {
    try {
      state = state.copyWith(
        forgetPasswordLoading: true,
      );

      final result = await _repo.forgetPassword(
        email: email,
      );
      if (result == true) {
        state = state.copyWith(
          forgetPasswordLoading: false,
        );
      }

      return true;
    } catch (e) {
      state = state.copyWith(forgetPasswordLoading: false, errorMessage: "");
      state = state.copyWith(errorMessage: e.toString());
      return false;
    }
  }

  /// Resends the OTP (One-Time Password) to the specified email address.
  ///
  /// This method sends a request to the repository to resend the OTP to the provided email address.
  /// If the request is successful, the OTP is resent and the new OTP is returned as a [String].
  /// If an error occurs during the process, the error message is stored in the state of the provider.
  ///
  /// Example:
  /// ```dart
  /// final authProvider = AuthProvider();
  /// final email = 'example@example.com';
  ///
  /// final result = await authProvider.resendOtp(email: email);
  /// if (result != null) {
  ///   print('New OTP: $result');
  /// } else {
  ///   print('Error occurred: ${authProvider.state.errorMessage}');
  /// }
  /// ```
  Future<String?> resendOtp({required String email}) async {
    try {
      final result = await _repo.resendOtp(
        email: email,
      );

      return result;
    } catch (e) {
      state = state.copyWith(errorMessage: e.toString());
    }
  }

  /// Logs out the user by deleting authentication storage, token cached data,
  /// and updating the state to reflect the logout status.
  ///
  /// Example:
  /// ```
  /// await authProvider.logout();
  /// ```
  Future<void> logout() async {
    // state = state.copyWith(
    //   loading: false,
    //   errorMessage: '',
    // );

    //we do not need to wait here
    _repo.deleteAuthStorage();
    _repo.deleteTokenCachedData();

    MainInterceptor.logout();

    state = state.copyWith(
      user: null,
      isLogin: false,
      registerLoading: false,
      loginLoading: false,
      googleLoading: false,
    );
  }

  /// Handles the refresh of the FCM token.
  ///
  /// This method is responsible for handling the refresh of the FCM token.
  /// It listens for the `UpdateFcmTokenEvent` event and updates the FCM token accordingly.
  ///
  /// Example:
  /// ```dart
  /// AuthProvider authProvider = AuthProvider();
  /// await authProvider.onFcmTokenRefresh();
  /// ```
  Future<void> onFcmTokenRefresh() async {
    try {
      // eventBus.on<UpdateFcmTokenEvent>().listen((event) {
      //   updateFcmToken(event.token);
      // });
    } catch (_) {}
  }

  Future<void> updateFcmToken(String? token) async {
    try {
      // final fcmToken = token ?? await _notificationsHandler.getFcmToken();

      // updateUserProfile(
      //     personalData: state.personalData.copyWith(deviceToken: fcmToken),
      //     isUpdatingFcmToken: true);
    } catch (_) {}
  }

  /// Updates the username of the authenticated user.
  ///
  /// This method takes a [newUsername] parameter and updates the username of the authenticated user
  /// by calling the [_repo.updateUsername] method. If the update is successful, the user's username
  /// in the app state is also updated. If an error occurs during the update process, the error message
  /// is stored in the app state.
  ///
  /// Returns `true` if the update is successful, otherwise returns `false`.
  ///
  /// Example:
  /// ```dart
  /// bool success = await updateUsername(newUsername: 'john_doe');
  /// if (success) {
  ///   print('Username updated successfully');
  /// } else {
  ///   print('Failed to update username');
  /// }
  /// ```
  updateUsername({required String newUsername}) async {
    try {
      final result = await _repo.updateUsername(
        newUsername: newUsername,
      );
      User updatedUser = state.user!;
      updatedUser = updatedUser.copyWith(username: newUsername);
      if (result == true) {
        state = state.copyWith(
          user: updatedUser,
        );
      }
      return true;
    } catch (e) {
      state = state.copyWith(errorMessage: e.toString());
      return false;
    }
  }

  /// Updates the email of the authenticated user.
  ///
  /// This method updates the email of the authenticated user by calling the
  /// `_repo.updateEmail` method with the provided `newEmail` parameter.
  ///
  /// Returns `true` if the email is successfully updated, otherwise returns `false`.
  /// If an error occurs during the update process, the `state` is updated with
  /// the error message and `false` is returned.
  ///
  /// Example:
  /// ```dart
  /// bool success = await updateEmail(newEmail: 'newemail@example.com');
  /// if (success) {
  ///   print('Email updated successfully');
  /// } else {
  ///   print('Failed to update email');
  ///   print(state.errorMessage);
  /// }
  /// ```
  updateEmail({required String newEmail}) async {
    try {
      var result = await _repo.updateEmail(
        newEmail: newEmail,
      );

      return result;
    } catch (e) {
      state = state.copyWith(errorMessage: e.toString());
      return false;
    }
  }

  /// Checks if the given email is found in the repository.
  ///
  /// This method asynchronously calls the [_repo.isEmailFound()] method to check if the email exists in the repository.
  /// If the email is found, it returns true. Otherwise, it returns false.
  ///
  /// Example:
  /// ```dart
  /// bool emailExists = await isEmailFound(email: 'example@example.com');
  /// print(emailExists); // Output: true
  /// ```
  isEmailFound({required String email}) async {
    try {
      print("555555555555555555555555");
      final result = await _repo.isEmailFound(newEmail: email);
      print(result);
      return result;
    } catch (e) {
      return false;
    }
  }

  /// Updates the user's password.
  ///
  /// This method takes the current password, new password, and new password confirmation as parameters
  /// and attempts to update the user's password using the [_repo.updatePassword] method.
  ///
  /// If the password update is successful, it returns `true`. Otherwise, it returns `false`.
  ///
  /// If an error occurs during the password update process, the error message is stored in the [state.errorMessage]
  /// property and `false` is returned.
  ///
  /// Example usage:
  /// ```dart
  /// bool success = await updatePassword(
  ///   currentPassword: 'oldPassword123',
  ///   newPassword: 'newPassword456',
  ///   newPasswordConfirm: 'newPassword456',
  /// );
  ///
  /// if (success) {
  ///   print('Password updated successfully');
  /// } else {
  ///   print('Failed to update password. Error: ${state.errorMessage}');
  /// }
  /// ```
  Future<bool> updatePassword(
      {required String currentPassword,
      required String newPassword,
      required String newPasswordConfirm}) async {
    try {
      final result = await _repo.updatePassword(
        currentPassword: currentPassword,
        newPassword: newPassword,
        newPasswordConfirm: newPasswordConfirm,
      );
      // User updatedUser = state.user!;
      // updatedUser = updatedUser.copyWith(email: newEmail);
      if (result == true) {
        // state = state.copyWith(
        //   user: updatedUser,
        // );
        return true;
      } else {
        return false;
      }
    } catch (e) {
      state = state.copyWith(errorMessage: e.toString());
      return false;
    }
  }

  /// Retrieves the list of muted users.
  ///
  /// This method updates the state of the authentication provider to indicate that the list of muted users is being fetched.
  /// It then calls the `_repo.fetchMutersData()` method to retrieve the muted users data.
  /// If the data is successfully fetched, it updates the state with the retrieved `MutersList` object and sets the loading state to false.
  /// If the data retrieval fails, it sets an error message in the state and sets the loading state to false.
  ///
  /// Example usage:
  /// ```dart
  /// await getMutedUsers();
  /// ```
  /// This will fetch the list of muted users and update the state accordingly.
  Future<void> getMutedUsers() async {
    state = state.copyWith(
      loading: true,
    );
    final MutersList muters = await _repo.fetchMutersData();
    if (muters.users != null) {
      state = state.copyWith(
        mutersList: muters,
        loading: false,
      );
    } else {
      state = state.copyWith(
        errorMessage: 'Failed to fetch likers',
        loading: false,
      );
    }
  }

  Future<void> getBlockedUsers() async {
    state = state.copyWith(
      loading: true,
    );
    final BlockersList blockers = await _repo.fetchBlockersData();
    if (blockers.users != null) {
      state = state.copyWith(
        blockedList: blockers,
        loading: false,
      );
    } else {
      state = state.copyWith(
        errorMessage: 'Failed to fetch likers',
        loading: false,
      );
    }
  }

  /// Unblocks a user with the given [username].
  ///
  /// This method updates the state of the authentication provider to unblock a user.
  /// It sets the loading state to true, then calls the [_repo.unblockUser] method to unblock the user.
  /// If the unblocking is successful, it updates the state with the updated blocked list fetched from [_repo.fetchBlockersData].
  /// If the unblocking fails, it updates the state with an error message.
  ///
  /// Example:
  /// ```dart
  /// final authProvider = AuthProvider();
  /// await authProvider.unblockUser('john_doe');
  /// ```
  Future<void> unblockUser(String username) async {
    state = state.copyWith(
      loading: true,
    );

    final bool? success = await _repo.unblockUser(username: username);

    if (success!) {
      // If unblocking is successful, update the state accordingly
      final BlockersList updatedBlockedList = await _repo.fetchBlockersData();
      state = state.copyWith(
        blockedList: updatedBlockedList,
        loading: false,
      );
    } else {
      // If unblocking fails, update the state with an error message
      state = state.copyWith(
        errorMessage: 'Failed to unblock user $username',
        loading: false,
      );
    }
  }

  /// Unmutes a user by their username.
  ///
  /// This method updates the state to indicate that the operation is in progress,
  /// then calls the `_repo.unmuteUser` method to unmute the user with the given username.
  /// If the unmute operation is successful, it updates the state with the updated list of muters
  /// and sets the loading flag to false. If the unmute operation fails, it updates the state
  /// with an error message and sets the loading flag to false.
  ///
  /// Example:
  /// ```
  /// final authProvider = AuthProvider();
  /// await authProvider.unmuteUser('john_doe');
  /// ```
  Future<void> unmuteUser(String username) async {
    state = state.copyWith(
      loading: true,
    );

    final bool? success = await _repo.unmuteUser(username: username);

    if (success!) {
      final MutersList updatedMutersList = await _repo.fetchMutersData();
      state = state.copyWith(
        mutersList: updatedMutersList,
        loading: false,
      );
    } else {
      state = state.copyWith(
        errorMessage: 'Failed to unmute user $username',
        loading: false,
      );
    }
  }

  Future<void> incFollowings(bool result) async {
    if (result) {
      final int followingCount = int.parse(state.user!.followingsCount!) + 1;
      state = state.copyWith(
        user: state.user!.copyWith(
          followingsCount: followingCount.toString(),
        ),
      );
    }
  }

  Future<void> decFollowings(bool result) async {
    if (result) {
      final int followingCount = int.parse(state.user!.followingsCount!) - 1;
      state = state.copyWith(
        user: state.user!.copyWith(
          followingsCount: followingCount.toString(),
        ),
      );
    }
  }

  Future<void> incFollowers() async {
    final int followingCount = int.parse(state.user!.followersCount!) + 1;
    state = state.copyWith(
      user: state.user!.copyWith(
        followersCount: followingCount.toString(),
      ),
    );
  }

  Future<void> decFollowers() async {
    final int followingCount = int.parse(state.user!.followersCount!) - 1;
    state = state.copyWith(
      user: state.user!.copyWith(
        followersCount: followingCount.toString(),
      ),
    );
  }
// void resetErrorMessage() {
//   state = state.copyWith(loading: false, errorMessage: "");
// }
}
