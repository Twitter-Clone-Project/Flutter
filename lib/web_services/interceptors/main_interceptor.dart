import 'package:dio/dio.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../../utils/constants.dart';
import '../../utils/hive_manager.dart';
import '../http_exceptions.dart';

class MainInterceptor extends Interceptor {
  static String token = "";

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    if (getToken().isNotEmpty) {
      options.headers["Authorization"] = "Bearer $token";
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

  static getToken() {
    if (token.isNotEmpty) return token;

    final tokenData = HiveManager.getData(StorageKeys.tokenKey);

    if (tokenData != null) token = tokenData;

    return token;
  }

  static logout() {
    token = "";
  }
}
