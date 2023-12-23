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

  User? getUserData();

  String? getToken();
  Future<bool?> updateUsername({required String newUsername});
  Future<bool?> updateEmail({required String newEmail});
  Future<MutersList> fetchMutersData();
  Future<BlockersList> fetchBlockersData();
}

class AuthRepositoryImpl implements AuthRepository {
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
        return true;
      } else {
        throw (response.data["message"]);
      }
    } catch (e) {
      throw e.toString();
    }
  }

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

  @override
  Future<User?> confirmEmail({
    required String otp,
    required String email,
    required bool isSignUp,
  }) async {
    print(otp.length);
    print(getToken());
    try {
      final data = {
        "email": email,
        "otp": otp,
      };
      var response = await HttpClient.dio.post(
        EndPoints.confirmEmail,
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

  void _saveUserLoginResponse(String token) {
    HiveManager.addData(StorageKeys.tokenKey, token);
    // HiveManager.addData(StorageKeys.userId, response.userId);
  }

  void _saveUserResetPassToken(String token) {
    HiveManager.addData("resetToken", token);
  }

  void _saveUserDataResponse(response) {
    HiveManager.addData(StorageKeys.userKey, response);
  }

  @override
  Future<void> registerFCMToken({required String token}) {
    // TODO: implement registerFCMToken
    throw UnimplementedError();
  }

  @override
  Future<void> unRegisterFCMToken({required String token}) {
    // TODO: implement unRegisterFCMToken
    throw UnimplementedError();
  }

  @override
  void deleteAuthStorage() {
    HiveManager.remove(StorageKeys.userKey);
  }

  @override
  void deleteTokenCachedData() {
    HiveManager.remove(StorageKeys.tokenKey);
  }

  @override
  void deleteResetTokenData() {
    HiveManager.remove("resetToken");
  }

  @override
  getMobileNumber() {
    // TODO: implement getMobileNumber
    throw UnimplementedError();
  }

  @override
  String? getToken() {
    final tokenData = HiveManager.getData(StorageKeys.tokenKey);
    return tokenData;
  }

  @override
  String? getResetToken() {
    final tokenData = HiveManager.getData("resetToken");
    return tokenData;
  }

  @override
  User? getUserData() {
    var data = HiveManager.getData(StorageKeys.userKey);

    if (data != null) return User.fromJson(data);
    return null;
  }

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

final authRepositoryProvider = Provider<AuthRepository>((ref) {
  return AuthRepositoryImpl();
});