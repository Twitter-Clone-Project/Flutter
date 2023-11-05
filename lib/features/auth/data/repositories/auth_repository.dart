import 'package:x_clone/web_services/web_services.dart';
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../utils/constants.dart';
import '../../../../utils/hive_manager.dart';
import '../model/user.dart';


abstract class AuthRepository {
  Future<User?> fetchUserData();

  Future<bool> login({required String phone});

//   Future<int> register(
//       {required String username,
//       required String email,
//       required String mobile,
// });
//   Future<User?> updateUser({String? phone, String? name});
  Future<void> registerFCMToken({required String token});

  Future<void> unRegisterFCMToken({required String token});

  void deleteAuthStorage();

  void deleteTokenCachedData();

  getMobileNumber();

  User? getUserData();

  String? getToken();
}

class AuthRepositoryImpl implements AuthRepository {
  @override
  Future<User?> fetchUserData() async {
    try {
      var response = await HttpClient.dio.get("EndPoints");
      _saveUserDataResponse(response.data);

      return User.fromJson(response.data["data"]);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<bool> login(
      {required String phone}) async {
    try {
      final data = {
        "phone": phone,
      };
      var response = await HttpClient.dio.post(EndPoints.login, data: data, options: Options(headers: {
        "Accept": "application/json",
      }),);
      if (response.statusCode == 200 || response.statusCode == 201) {
        return true;
      }
      return false;
    } catch (e) {
      rethrow;
    }
  }

  // @override
  // Future<int> register(
  //     {required String username,
  //     required String email,
  //     required String mobile,
  //     }) async {
  //   try {
  //     final data = {
  //       "name": username,
  //       "email": email,
  //       "phone": mobile,
  //     };
  //     var response = await HttpClient.dio.post(EndPoints.register, data: data,
  //     options: Options(headers: {
  //       "Accept": "application/json",
  //     }),);
  //     if (response.statusCode == 200 || response.statusCode == 201) {
  //
  //       return response.data["temp_user_id"];
  //     } else {
  //       throw(response.data["message"]);
  //     }
  //   } catch (e) {
  //     throw e.toString();
  //   }
  // }

  void _saveUserLoginResponse(String token) {
    HiveManager.addData(StorageKeys.tokenKey, token);
    // HiveManager.addData(StorageKeys.userId, response.userId);
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
  User? getUserData() {
    var data = HiveManager.getData(StorageKeys.userKey);

    if (data != null) return User.fromJson(data);
    return null;
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


}

final authRepositoryProvider = Provider<AuthRepository>((ref) {
  return AuthRepositoryImpl();
});
