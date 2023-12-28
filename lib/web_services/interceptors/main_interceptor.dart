import 'package:dio/dio.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../../utils/constants.dart';
import '../../utils/hive_manager.dart';
import '../http_exceptions.dart';

/// A class that represents the main interceptor for making HTTP requests.
/// It extends the [Interceptor] class from the Dio package.
class MainInterceptor extends Interceptor {
  static String token = "";

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    /// Adds the authorization token to the request headers if the token is not empty.
    /// If the token is empty, it checks for a reset token and adds it to the headers.
    /// If both tokens are empty, no authorization header is added.
    if (getToken().isNotEmpty) {
      options.headers["Authorization"] = "Bearer $token";
      print("Bearer $token");
    } else if (getResetToken().isNotEmpty) {
      options.headers["Authorization"] = "Bearer $token";
      token = "";
    }

    handler.next(options); //continue
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    handler.next(response);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    throw HttpExceptions.fromDioException(err);
  }

  /// Retrieves the token from the [HiveManager] data storage.
  /// If the token is already stored in the [token] variable, it returns the stored token.
  /// If the token is not stored, it retrieves the token from the [HiveManager] and stores it in the [token] variable.
  /// Returns the token.
  static getToken() {
    if (token.isNotEmpty) return token;

    final tokenData = HiveManager.getData(StorageKeys.tokenKey);

    if (tokenData != null) token = tokenData;

    return token;
  }

  /// Retrieves the reset token from the [HiveManager] data storage.
  /// If the token is already stored in the [token] variable, it returns the stored token.
  /// If the token is not stored, it retrieves the token from the [HiveManager] and stores it in the [token] variable.
  /// Returns the token.
  static getResetToken() {
    if (token.isNotEmpty) return token;

    final tokenData = HiveManager.getData("resetToken");

    if (tokenData != null) token = tokenData;

    return token;
  }

  /// Clears the stored token by setting it to an empty string.
  static logout() {
    token = "";
  }
}
