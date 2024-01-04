import 'package:dio/dio.dart';

import 'end_points.dart';
import 'interceptors/main_interceptor.dart';

/// A class that provides an HTTP client for making network requests.
class HttpClient {
  static final Dio dio = initDio();

  static final _singleton = HttpClient._internal();

  static const timeout = Duration(seconds: 30);

  HttpClient._internal();

  factory HttpClient() => _singleton;

  /// Initializes and configures the Dio HTTP client.
  ///
  /// The [initDio] method creates a new instance of Dio with the specified
  /// base URL and timeout duration. It also adds interceptors for logging
  /// request and response details, as well as a custom interceptor for
  /// handling main requests.
  ///
  /// Example usage:
  ///
  /// ```dart
  /// var dio = HttpClient.initDio();
  /// ```
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
