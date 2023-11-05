import 'package:dio/dio.dart';

import 'end_points.dart';
import 'interceptors/main_interceptor.dart';

class HttpClient {
  static final Dio dio = initDio();
  static final _singleton = HttpClient._internal();

  static const timeout = Duration(seconds: 30);

  HttpClient._internal();

  factory HttpClient() => _singleton;

  static Dio initDio() {
    var dio = Dio(BaseOptions(
      baseUrl: baseUrl,
      receiveTimeout: timeout, // 15 seconds
      connectTimeout: timeout,
      sendTimeout: timeout,
    ));

    dio.interceptors.add(
      LogInterceptor(requestBody: true, responseBody: true, error: true),
    );
    dio.interceptors.add(MainInterceptor());

    return dio;
  }
}
