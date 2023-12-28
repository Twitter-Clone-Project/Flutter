import 'package:dio/dio.dart';

import 'models/error_response.dart';

/// A class that represents custom HTTP exceptions.
/// It extends the [Exception] class.
class HttpExceptions implements Exception {
  /// Constructs an [HttpExceptions] object from a [DioException].
  /// It handles different types of [DioException] and throws corresponding custom exceptions.
  ///
  /// Throws a [DeadlineExceededException] if the [DioException] type is connectionTimeout,
  /// sendTimeout, receiveTimeout, connectionError, or badCertificate.
  ///
  /// Throws a [BadRequestException] if the [DioException] type is badResponse and the response status code is 400, 422, or 404.
  ///
  /// Throws an [UnauthorizedException] if the [DioException] type is badResponse and the response status code is 401 or 403.
  ///
  /// Throws a [NotFoundException] if the [DioException] type is badResponse and the response status code is 404.
  ///
  /// Throws a [ConflictException] if the [DioException] type is badResponse and the response status code is 409.
  ///
  /// Throws an [InternalServerErrorException] if the [DioException] type is badResponse and the response status code is 500.
  ///
  /// Throws a [NoInternetConnectionException] if the [DioException] type is unknown.
  HttpExceptions.fromDioException(DioException dioException) {
    switch (dioException.type) {
      case DioExceptionType.connectionTimeout:
      case DioExceptionType.sendTimeout:
      case DioExceptionType.receiveTimeout:
      case DioExceptionType.connectionError:
      case DioExceptionType.badCertificate:
        throw DeadlineExceededException(dioException.requestOptions);
      case DioExceptionType.badResponse:
        switch (dioException.response?.statusCode) {
          case 400:
          case 422:
          case 404:
            throw BadRequestException(
                dioException.requestOptions, dioException.response);
          case 401:
          case 403:
            throw UnauthorizedException(
                dioException.requestOptions, dioException.response);
          case 404:
            throw NotFoundException(
                dioException.requestOptions, dioException.response);
          case 409:
            throw ConflictException(
                dioException.requestOptions, dioException.response);
          case 500:
            throw InternalServerErrorException(
                dioException.requestOptions, dioException.response);
        }
        break;
      case DioExceptionType.cancel:
        break;
      case DioExceptionType.unknown:
        throw NoInternetConnectionException(dioException.requestOptions);
    }
  }
}

/// A custom exception class that represents a bad request.
/// It extends the [DioException] class.
class BadRequestException extends DioException {
  /// Constructs a [BadRequestException] object with the specified request options and response.
  BadRequestException(RequestOptions r, Response? response)
      : super(requestOptions: r, response: response);

  @override
  String toString() {
    try {
      String? msg = ErrorResponse.fromJson(response?.data).message;
      print(msg);
      return msg ?? 'Invalid request';
    } catch (_) {}

    return 'Invalid request';
  }
}

/// A custom exception class that represents an internal server error.
/// It extends the [DioException] class.
class InternalServerErrorException extends DioException {
  /// Constructs an [InternalServerErrorException] object with the specified request options and response.
  InternalServerErrorException(RequestOptions r, Response? response)
      : super(requestOptions: r, response: response);

  @override
  String toString() {
    try {
      String? msg = ErrorResponse.fromJson(response?.data).message;

      return msg ?? 'Unknown error occurred, please try again later.';
    } catch (e) {
      return 'Unknown error occurred, please try again later.';
    }
  }
}

/// A custom exception class that represents a conflict.
/// It extends the [DioException] class.
class ConflictException extends DioException {
  /// Constructs a [ConflictException] object with the specified request options and response.
  ConflictException(RequestOptions r, Response? response)
      : super(requestOptions: r, response: response);

  @override
  String toString() {
    String? msg = ErrorResponse.fromJson(response?.data).message;

    return msg ?? 'Conflict occurred';
  }
}

/// A custom exception class that represents an unauthorized access.
/// It extends the [DioException] class.
class UnauthorizedException extends DioException {
  /// Constructs an [UnauthorizedException] object with the specified request options and response.
  UnauthorizedException(RequestOptions r, Response? response)
      : super(requestOptions: r, response: response);

  @override
  String toString() {
    String? msg = ErrorResponse.fromJson(response?.data).message;

    return msg ?? 'Access denied';
  }
}

/// A custom exception class that represents a not found error.
/// It extends the [DioException] class.
class NotFoundException extends DioException {
  /// Constructs a [NotFoundException] object with the specified request options and response.
  NotFoundException(RequestOptions r, Response? response)
      : super(requestOptions: r, response: response);

  @override
  String toString() {
    String? msg = ErrorResponse.fromJson(response?.data).message;

    return msg ?? 'The requested information could not be found';
  }
}

/// A custom exception class that represents a no internet connection error.
/// It extends the [DioException] class.
class NoInternetConnectionException extends DioException {
  /// Constructs a [NoInternetConnectionException] object with the specified request options.
  NoInternetConnectionException(RequestOptions r) : super(requestOptions: r);

  @override
  String toString() {
    return 'No internet connection detected, please try again.';
  }
}

/// A custom exception class that represents a deadline exceeded error.
/// It extends the [DioException] class.
class DeadlineExceededException extends DioException {
  /// Constructs a [DeadlineExceededException] object with the specified request options.
  DeadlineExceededException(RequestOptions r) : super(requestOptions: r);

  @override
  String toString() {
    return 'The connection has timed out, please try again.';
  }
}
