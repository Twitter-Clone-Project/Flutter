import 'package:x_clone/web_services/web_services.dart';
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../utils/constants.dart';
import '../../../../utils/hive_manager.dart';
import '../model/user.dart';

abstract class AuthRepository {
  Future<User?> fetchUserData();

  Future<User?> login({
    required String email,
    required String password,
  });
  Future<bool?> isEmailFound({required String newEmail});
  Future<bool?> forgetPassword({
    required String email,
  });
  Future<User?> register({
    required String username,
    required String email,
    required String name,
    required String password,
    required String birthDate,
    required String reCaptchaText,
  });
  Future<User?> confirmEmail({
    required String otp,
    required String email,
    required bool isSignUp,
    String? newEmail,
  });
  Future<bool?> resetPassword({
    required String password,
    required String passwordConfirm,
    required String email,
  });
  Future<String?> resendOtp({
    required String email,
  });
//   Future<User?> updateUser({String? phone, String? name});
  Future<void> registerFCMToken({required String token});

  Future<void> unRegisterFCMToken({required String token});

  void deleteAuthStorage();

  void deleteTokenCachedData();

  getMobileNumber();

  Future<bool?> unmuteUser({
    required String username,
  });

  Future<bool?> unblockUser({
    required String username,
  });

  User? getUserData();

  String? getToken();
  Future<bool?> updateUsername({required String newUsername});
  Future<bool?> updateEmail({required String newEmail});
  Future<bool?> updatePassword(
      {required String currentPassword,
      required String newPassword,
      required String newPasswordConfirm});

  Future<MutersList> fetchMutersData();
  Future<BlockersList> fetchBlockersData();
}

class AuthRepositoryImpl implements AuthRepository {
  /// Updates the username of the authenticated user.
  ///
  /// This method sends a PATCH request to the server to update the username
  /// of the authenticated user with the provided [newUsername].
  ///
  /// Returns a [Future] that completes with a [bool] value indicating whether
  /// the username update was successful or not. If the update is successful,
  /// it returns `true`. Otherwise, it throws an error with the error message
  /// received from the server.
  ///
  /// Example:
  /// ```dart
  /// try {
  ///   bool isUpdated = await authRepository.updateUsername(newUsername: "john_doe");
  ///   print("Username update successful: $isUpdated");
  /// } catch (e) {
  ///   print("Username update failed: $e");
  /// }
  /// ```
  @override
  Future<bool?> updateUsername({required String newUsername}) async {
    try {
      final data = {
        "newUsername": newUsername,
      };
      var response = await HttpClient.dio.patch(
        EndPoints.updateUsername,
        data: data,
      );
      if (response.statusCode == 200 || response.statusCode == 201) {
        return true;
      } else {
        throw (response.data["message"]);
      }
    } catch (e) {
      throw e.toString();
    }
  }

  /// Updates the email address associated with the user's account.
  ///
  /// Returns a [Future] that completes with a [bool] value indicating whether the email update was successful.
  /// If the update is successful, the returned value will be `true`. Otherwise, it will be `false`.
  ///
  /// The [newEmail] parameter is required and specifies the new email address to be associated with the account.
  ///
  /// Throws an exception if an error occurs during the update process.
  ///
  /// Example:
  /// ```dart
  /// try {
  ///   bool isEmailUpdated = await authRepository.updateEmail(newEmail: 'newemail@example.com');
  ///   if (isEmailUpdated) {
  ///     print('Email update successful');
  ///   } else {
  ///     print('Email update failed');
  ///   }
  /// } catch (e) {
  ///   print('Error updating email: $e');
  /// }
  /// ```
  @override
  Future<bool?> updateEmail({required String newEmail}) async {
    try {
      final data = {
        "newEmail": newEmail,
      };
      var response = await HttpClient.dio.patch(
        EndPoints.updateEmail,
        data: data,
      );
      if (response.statusCode == 200 || response.statusCode == 201) {
        return response.data["status"] == true;
      } else {
        throw (response.data["message"]);
      }
    } catch (e) {
      throw e.toString();
    }
  }

  /// Checks if the provided email is found in the system.
  ///
  /// This method sends a GET request to the server to check if the provided email
  /// is already registered in the system. It returns a boolean value indicating
  /// whether the email is found or not.
  ///
  /// The [newEmail] parameter is the email address to be checked.
  ///
  /// Example:
  /// ```dart
  /// AuthRepository authRepository = AuthRepository();
  /// bool isEmailFound = await authRepository.isEmailFound(newEmail: 'example@example.com');
  /// print(isEmailFound); // true or false
  /// ```
  Future<bool?> isEmailFound({required String newEmail}) async {
    try {
      var response = await HttpClient.dio.get(
        EndPoints.isEmailFound(newEmail),
      );
      if (response.statusCode == 200 || response.statusCode == 201) {
        return response.data["data"]["isFound"] == true;
      } else {
        throw (response.data["message"]);
      }
    } catch (e) {
      throw e.toString();
    }
  }

  /// Updates the user's password.
  ///
  /// This method sends a PATCH request to the server to update the user's password.
  /// It takes the [currentPassword], [newPassword], and [newPasswordConfirm] as required parameters.
  /// The [currentPassword] is the user's current password.
  /// The [newPassword] is the new password that the user wants to set.
  /// The [newPasswordConfirm] is the confirmation of the new password.
  ///
  /// Returns a [Future] that completes with a [bool] value indicating whether the password update was successful.
  /// If the update is successful, the returned value will be `true`.
  /// If the update fails, an exception will be thrown with the error message.
  ///
  /// Example:
  /// ```dart
  /// final authRepository = AuthRepository();
  /// try {
  ///   bool isUpdated = await authRepository.updatePassword(
  ///     currentPassword: 'oldPassword123',
  ///     newPassword: 'newPassword456',
  ///     newPasswordConfirm: 'newPassword456',
  ///   );
  ///   print('Password update successful: $isUpdated');
  /// } catch (e) {
  ///   print('Password update failed: $e');
  /// }
  /// ```
  @override
  Future<bool?> updatePassword(
      {required String currentPassword,
      required String newPassword,
      required String newPasswordConfirm}) async {
    try {
      final data = {
        "currentPassword": currentPassword,
        "newPassword": newPassword,
        "newPasswordConfirm": newPasswordConfirm,
      };
      var response = await HttpClient.dio.patch(
        EndPoints.updatePassword,
        data: data,
      );
      if (response.statusCode == 200 || response.statusCode == 201) {
        return response.data["status"];
      } else {
        throw (response.data["message"]);
      }
    } catch (e) {
      throw e.toString();
    }
  }

  /// Fetches user data from the server.
  ///
  /// This function sends a GET request to the server to fetch user data.
  /// It saves the fetched user data locally and returns the user object.
  /// If an error occurs during the request, it rethrows the exception.
  ///
  /// Example usage:
  /// ```dart
  /// AuthRepository authRepository = AuthRepository();
  /// User? user = await authRepository.fetchUserData();
  /// print(user?.name);
  /// ```
  @override
  Future<User?> fetchUserData() async {
    try {
      var response = await HttpClient.dio.get(EndPoints.getMe);
      _saveUserDataResponse(response.data["data"]["user"]);

      return User.fromJson(response.data["data"]["user"]);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<User?> login({
    required String email,
    required String password,
  }) async {
    try {
      final data = {
        "email": email,
        "password": password,
      };
      var response = await HttpClient.dio.post(
        EndPoints.login,
        data: data,
      );
      if (response.statusCode == 200 || response.statusCode == 201) {
        _saveUserLoginResponse(response.data["data"]["token"]);
        _saveUserDataResponse(response.data["data"]["user"]);
        return User.fromJson(response.data["data"]["user"]);
      }
      throw (response.data["message"]);
    } catch (e) {
      rethrow;
    }
  }

  /// Registers a new user with the provided information.
  ///
  /// The [username], [email], [name], [password], [birthDate], and [reCaptchaText] parameters are required.
  /// The [username] is the desired username for the user.
  /// The [email] is the email address of the user.
  /// The [name] is the full name of the user.
  /// The [password] is the password for the user's account.
  /// The [birthDate] is the date of birth of the user.
  /// The [reCaptchaText] is the text from the reCAPTCHA verification.
  ///
  /// Returns the registered user if the registration is successful, otherwise throws an exception.
  ///
  /// Example:
  /// ```dart
  /// final user = await authRepository.register(
  ///   username: 'john_doe',
  ///   email: 'john.doe@example.com',
  ///   name: 'John Doe',
  ///   password: 'password123',
  ///   birthDate: '1990-01-01',
  ///   reCaptchaText: 'abc123',
  /// );
  /// print(user.username); // john_doe
  /// print(user.email); // john.doe@example.com
  /// print(user.name); // John Doe
  /// ```
  @override
  Future<User?> register({
    required String username,
    required String email,
    required String name,
    required String password,
    required String birthDate,
    required String reCaptchaText,
  }) async {
    try {
      final data = {
        "name": name,
        "username": username,
        "email": email,
        "password": password,
        "passwordConfirm": password,
        "dateOfBirth": birthDate,
        "gRecaptchaResponse": reCaptchaText,
      };
      var response = await HttpClient.dio.post(
        EndPoints.register,
        data: data,
      );
      if (response.statusCode == 200 || response.statusCode == 201) {
        // _saveUserLoginResponse(response.data["data"]["token"]);
        _saveUserDataResponse(response.data["data"]["user"]);
        return User.fromJson(response.data["data"]["user"]);
      } else {
        throw (response.data["message"]);
      }
    } catch (e) {
      throw e.toString();
    }
  }

  /// A repository class that handles authentication related operations.
  /// Confirms the email by sending the OTP and validating it.
  ///
  /// The [otp] parameter is the one-time password sent to the user's email.
  /// The [email] parameter is the user's email address.
  /// The [isSignUp] parameter indicates whether the email confirmation is for sign up or password reset.
  /// The [newEmail] parameter is an optional parameter used when updating the user's email.
  ///
  /// Returns a [User] object if the email confirmation is successful, otherwise throws an error.
  @override
  Future<User?> confirmEmail({
    required String otp,
    required String email,
    required bool isSignUp,
    String? newEmail,
  }) async {
    print(otp.length);
    print(getToken());
    try {
      final data = {
        if (newEmail != null) "newEmail": newEmail,
        "email": email,
        "otp": otp,
      };
      var response = await HttpClient.dio.post(
        newEmail != null
            ? EndPoints.confirmProfileEmail
            : EndPoints.confirmEmail,
        data: data,
      );
      if (response.statusCode == 200 || response.statusCode == 201) {
        if (isSignUp) {
          _saveUserLoginResponse(response.data["data"]["token"]);
        } else {
          _saveUserResetPassToken(response.data["data"]["token"]);
        }

        _saveUserDataResponse(response.data["data"]["user"]);
        return User.fromJson(response.data["data"]["user"]);
      } else {
        throw (response.data["message"]);
      }
    } catch (e) {
      throw e.toString();
    }
  }

  @override
  Future<String?> resendOtp({
    required String email,
  }) async {
    try {
      final data = {
        "email": email,
      };
      var response = await HttpClient.dio.post(
        EndPoints.resendConfirmEmail,
        data: data,
      );
      if (response.statusCode == 200 || response.statusCode == 201) {
        return response.data["message"];
      } else {
        throw (response.data["message"]);
      }
    } catch (e) {
      throw e.toString();
    }
  }

  /// Resets the password for a user.
  ///
  /// This method takes in the new password, password confirmation, and email as parameters.
  /// It sends a PATCH request to the reset password endpoint with the provided data.
  /// If the request is successful (status code 200 or 201), it returns `true`.
  /// Otherwise, it throws an error with the response message.
  ///
  /// Example:
  /// ```dart
  /// final authRepository = AuthRepository();
  /// try {
  ///   bool resetSuccessful = await authRepository.resetPassword(
  ///     password: 'newPassword123',
  ///     passwordConfirm: 'newPassword123',
  ///     email: 'example@example.com',
  ///   );
  /// } catch (e) {
  ///   print('An error occurred: $e');
  /// }
  /// ```
  @override
  Future<bool?> resetPassword({
    required String password,
    required String passwordConfirm,
    required String email,
  }) async {
    try {
      final data = {
        "email": email,
        "newPassword": password,
        "newPasswordConfirm": passwordConfirm,
      };
      var response = await HttpClient.dio.patch(
        EndPoints.resetPassword,
        data: data,
      );
      deleteResetTokenData();
      if (response.statusCode == 200 || response.statusCode == 201) {
        return true;
      } else {
        throw (response.data["message"]);
      }
    } catch (e) {
      throw e.toString();
    }
  }

  /// Sends a forget password request to the server with the provided [email].
  ///
  /// Returns a [Future] that completes with a [bool] value indicating whether the forget password request was successful or not.
  /// If the request is successful, the returned value is `true`.
  /// If the request fails, an exception is thrown with the error message from the server.
  ///
  /// Example:
  /// ```dart
  /// final authRepository = AuthRepository();
  /// try {
  ///   bool isPasswordForgotten = await authRepository.forgetPassword(email: 'example@example.com');
  ///   if (isPasswordForgotten) {
  ///     print('Password reset email sent successfully.');
  ///   } else {
  ///     print('Failed to send password reset email.');
  ///   }
  /// } catch (e) {
  ///   print('An error occurred: $e');
  /// }
  /// ```
  @override
  Future<bool?> forgetPassword({
    required String email,
  }) async {
    try {
      final data = {
        "email": email,
      };
      var response = await HttpClient.dio.post(
        EndPoints.forgetPassword,
        data: data,
      );
      if (response.statusCode == 200 || response.statusCode == 201) {
        return true;
      } else {
        throw (response.data["message"]);
      }
    } catch (e) {
      throw e.toString();
    }
  }

  /// Saves the user login response by storing the token in the local storage.
  ///
  /// This method takes a [token] as a parameter and stores it in the local storage using HiveManager.
  /// The token is associated with the [StorageKeys.tokenKey] key.
  ///
  /// Example:
  /// ```dart
  /// void _saveUserLoginResponse(String token) {
  ///   HiveManager.addData(StorageKeys.tokenKey, token);
  ///   // HiveManager.addData(StorageKeys.userId, response.userId);
  /// }
  /// ```
  void _saveUserLoginResponse(String token) {
    HiveManager.addData(StorageKeys.tokenKey, token);
    // HiveManager.addData(StorageKeys.userId, response.userId);
  }

  /// Saves the reset password token for the user.
  ///
  /// This method saves the provided [token] in the local storage using HiveManager.
  /// The token can be used later for resetting the user's password.
  ///
  /// Example:
  /// ```dart
  /// String token = "abcd1234";
  /// _saveUserResetPassToken(token);
  /// ```
  void _saveUserResetPassToken(String token) {
    HiveManager.addData("resetToken", token);
  }

  /// Saves the user data response.
  ///
  /// This method saves the provided [response] in the local storage using HiveManager.
  /// The response contains the user's data.
  ///
  /// Example:
  /// ```dart
  /// Map<String, dynamic> response = {
  ///   "name": "John Doe",
  ///   "email": "johndoe@example.com",
  ///   "age": 25,
  /// };
  /// _saveUserDataResponse(response);
  /// ```
  void _saveUserDataResponse(response) {
    HiveManager.addData(StorageKeys.userKey, response);
  }

  /// Registers the FCM token for push notifications.
  ///
  /// This method is responsible for registering the FCM token to the server
  /// for push notifications. It takes a [token] parameter which is the FCM token
  /// to be registered.
  ///
  /// Example:
  /// ```dart
  /// AuthRepository authRepository = AuthRepository();
  /// String fcmToken = 'abcdefg123456';
  /// await authRepository.registerFCMToken(token: fcmToken);
  /// ```
  @override
  Future<void> registerFCMToken({required String token}) {
    // TODO: implement registerFCMToken
    throw UnimplementedError();
  }

  /// Unregisters the FCM token for the user.
  ///
  /// This method is responsible for unregistering the FCM token associated with the user.
  /// It takes a [token] parameter which is the FCM token to be unregistered.
  ///
  /// Example:
  /// ```dart
  /// AuthRepository authRepository = AuthRepository();
  /// String fcmToken = 'your_fcm_token';
  /// await authRepository.unRegisterFCMToken(token: fcmToken);
  /// ```
  @override
  Future<void> unRegisterFCMToken({required String token}) {
    // TODO: implement unRegisterFCMToken
    throw UnimplementedError();
  }

  /// Deletes the authentication storage.
  ///
  /// This method removes the user key from the authentication storage.
  /// It is used to clear the authentication data when the user logs out.
  ///
  /// Example:
  /// ```dart
  /// AuthRepository authRepository = AuthRepository();
  /// authRepository.deleteAuthStorage();
  /// ```
  @override
  void deleteAuthStorage() {
    HiveManager.remove(StorageKeys.userKey);
  }

  /// Deletes the cached token data.
  ///
  /// This method removes the token data stored in the cache using HiveManager.
  /// It is typically used when the user logs out or when the token data becomes invalid.
  ///
  /// Example:
  /// ```dart
  /// AuthRepository authRepository = AuthRepository();
  /// authRepository.deleteTokenCachedData();
  /// ```
  @override
  void deleteTokenCachedData() {
    HiveManager.remove(StorageKeys.tokenKey);
  }

  /// Deletes the reset token data from the storage.
  ///
  /// This method removes the reset token data from the storage using the [HiveManager].
  /// It is typically used when the reset token is no longer needed or has expired.
  ///
  /// Example:
  /// ```dart
  /// AuthRepository authRepository = AuthRepository();
  /// authRepository.deleteResetTokenData();
  /// ```
  @override
  void deleteResetTokenData() {
    HiveManager.remove("resetToken");
  }

  /// Retrieves the mobile number associated with the user.
  ///
  /// This method is responsible for fetching the mobile number of the user from the data source.
  /// It should be implemented in the concrete class that extends [AuthRepository].
  ///
  /// Throws an [UnimplementedError] if the method is not overridden.
  ///
  /// Example:
  /// ```dart
  /// AuthRepository authRepository = AuthRepository();
  /// String mobileNumber = authRepository.getMobileNumber();
  /// print(mobileNumber); // Output: +1 123-456-7890
  /// ```
  @override
  getMobileNumber() {
    // TODO: implement getMobileNumber
    throw UnimplementedError();
  }

  /// Retrieves the authentication token from the storage.
  ///
  /// This method retrieves the authentication token from the storage using the [HiveManager.getData] method.
  /// It returns the token as a [String] value.
  ///
  /// Example:
  /// ```dart
  /// AuthRepository authRepository = AuthRepository();
  /// String? token = authRepository.getToken();
  /// print(token); // Output: "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiIxMjM0NTY3ODkwIiwibmFtZSI6IkpvaG4gRG9lIiwiaWF0IjoxNTE2MjM5MDIyfQ.SflKxwRJSMeKKF2QT4fwpMeJf36POk6yJV_adQssw5c"
  /// ```
  @override
  String? getToken() {
    final tokenData = HiveManager.getData(StorageKeys.tokenKey);
    return tokenData;
  }

  /// Retrieves the reset token from the data storage.
  ///
  /// This method retrieves the reset token from the data storage using the `HiveManager.getData` method.
  /// It returns the reset token as a string, or null if the token is not found.
  ///
  /// Example:
  /// ```dart
  /// String? resetToken = authRepository.getResetToken();
  /// print(resetToken); // Output: "abcd1234"
  /// ```
  @override
  String? getResetToken() {
    final tokenData = HiveManager.getData("resetToken");
    return tokenData;
  }

  /// Retrieves the user data from the storage.
  ///
  /// This method retrieves the user data from the storage using the [HiveManager.getData] method.
  /// If the data is not null, it is converted to a [User] object using the [User.fromJson] method and returned.
  /// If the data is null, null is returned.
  ///
  /// Example:
  /// ```dart
  /// AuthRepository authRepository = AuthRepository();
  /// User? userData = authRepository.getUserData();
  /// if (userData != null) {
  ///   print('User data: ${userData.toJson()}');
  /// } else {
  ///   print('No user data found.');
  /// }
  /// ```
  @override
  User? getUserData() {
    var data = HiveManager.getData(StorageKeys.userKey);

    if (data != null) return User.fromJson(data);
    return null;
  }

  /// Fetches the muters data from the server.
  ///
  /// This method sends a GET request to the server to fetch the muters data.
  /// If the request is successful (status code 200 or 201), it returns a [MutersList]
  /// object containing the muters data. Otherwise, it returns an empty [MutersList].
  ///
  /// Example:
  /// ```dart
  /// AuthRepository authRepository = AuthRepository();
  /// try {
  ///   MutersList mutersList = await authRepository.fetchMutersData();
  ///   print(mutersList.users);
  /// } catch (e) {
  ///   print('Error fetching muters data: $e');
  /// }
  /// ```
  @override
  Future<MutersList> fetchMutersData() async {
    try {
      var response = await HttpClient.dio.get(EndPoints.getMutersData());
      if (response.statusCode == 200 || response.statusCode == 201) {
        return MutersList.fromJson(response.data["data"]);
      }
      return const MutersList(users: []);
    } catch (e) {
      rethrow;
    }
  }

  /// Fetches the blockers data from the server.
  ///
  /// This method sends a GET request to the server to fetch the blockers data.
  /// If the response status code is 200 or 201, it parses the response data
  /// into a [BlockersList] object and returns it. Otherwise, it returns an
  /// empty [BlockersList].
  ///
  /// Example:
  /// ```dart
  /// AuthRepository authRepository = AuthRepository();
  /// BlockersList blockersList = await authRepository.fetchBlockersData();
  /// print(blockersList.users);
  /// ```
  @override
  Future<BlockersList> fetchBlockersData() async {
    try {
      var response = await HttpClient.dio.get(EndPoints.getBlockersData());
      if (response.statusCode == 200 || response.statusCode == 201) {
        return BlockersList.fromJson(response.data["data"]);
      }
      return const BlockersList(users: []);
    } catch (e) {
      rethrow;
    }
  }

  /// Unblocks a user with the specified [username].
  ///
  /// Returns a [Future] that completes with a [bool] value indicating whether the user was successfully unblocked.
  /// If the user is unblocked successfully, the returned value is `true`.
  /// If an error occurs during the unblocking process, an exception is thrown.
  ///
  /// Example:
  /// ```dart
  /// AuthRepository authRepository = AuthRepository();
  /// bool isUnblocked = await authRepository.unblockUser(username: 'john_doe');
  /// if (isUnblocked) {
  ///   print('User unblocked successfully');
  /// } else {
  ///   print('Failed to unblock user');
  /// }
  /// ```
  @override
  Future<bool?> unblockUser({required String username}) async {
    try {
      var response =
          await HttpClient.dio.delete(EndPoints.unblockUser(username));
      if (response.statusCode == 200 || response.statusCode == 201) {
        return true;
      }
      throw (response.data["message"]);
    } catch (e) {
      rethrow;
    }
  }

  /// Unmutes a user.
  ///
  /// This method sends a request to the server to unmute a user with the specified [username].
  /// If the request is successful and the user is unmuted, it returns `true`.
  /// Otherwise, it throws an exception with the error message received from the server.
  ///
  /// Example:
  /// ```dart
  /// var repository = AuthRepository();
  /// try {
  ///   bool result = await repository.unmuteUser(username: 'john_doe');
  ///   print(result); // true
  /// } catch (e) {
  ///   print(e); // Error message from the server
  /// }
  /// ```
  @override
  Future<bool?> unmuteUser({required String username}) async {
    try {
      var response =
          await HttpClient.dio.delete(EndPoints.unmuteUser(username));
      if (response.statusCode == 200 || response.statusCode == 201) {
        return true;
      }
      throw (response.data["message"]);
    } catch (e) {
      rethrow;
    }
  }
}

//
// @override
// Future<User?> updateUser({String? phone, String? name}) async {
//   try {
//
//     final data ={
//       if(phone != null)
//       "phone": phone,
//       if(name != null)
//         "name": name,
//     };
//     var response = await HttpClient.dio.post(EndPoints.updateUser, data: data
//       , options: Options(headers: {
//         "Accept": "application/json",
//       }),);
//     if (response.statusCode == 200 || response.statusCode == 201) {
//       _saveUserDataResponse(response.data["user"]);
//
//       return User.fromJson(response.data["user"]);
//     }
//     return null;
//   } catch (e) {
//     rethrow;
//   }
// }

/// A provider that creates an instance of [AuthRepository].
///
/// This provider is used to obtain an instance of [AuthRepository] which is responsible for
/// handling authentication related operations.
///
/// Example usage:
/// ```
/// final authRepository = ref.read(authRepositoryProvider);
/// ```
final authRepositoryProvider = Provider<AuthRepository>((ref) {
  return AuthRepositoryImpl();
});
