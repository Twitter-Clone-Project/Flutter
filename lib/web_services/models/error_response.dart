import 'package:freezed_annotation/freezed_annotation.dart';
import 'dart:convert';

part 'error_response.freezed.dart';
part 'error_response.g.dart';

/// Converts a JSON string to an [ErrorResponse] object.
///
/// The [str] parameter is the JSON string to be converted.
/// Returns an [ErrorResponse] object.
ErrorResponse errorResponseFromJson(String str) => ErrorResponse.fromJson(json.decode(str));

/// Converts an [ErrorResponse] object to a JSON string.
///
/// The [data] parameter is the [ErrorResponse] object to be converted.
/// Returns a JSON string representing the [ErrorResponse] object.
String errorResponseToJson(ErrorResponse data) => json.encode(data.toJson());

/// Represents an error response.
///
/// An [ErrorResponse] object contains information about an error, including the error [code],
/// [name], [message], [details], and [stack].
@freezed
abstract class ErrorResponse with _$ErrorResponse {
  const factory ErrorResponse({
    int? code,
    String? name,
    String? message,
    Details? details,
    String? stack,
  }) = _ErrorResponse;

  /// Creates an [ErrorResponse] object from a JSON map.
  ///
  /// The [json] parameter is a map representing the JSON structure of the [ErrorResponse] object.
  /// Returns an [ErrorResponse] object.
  factory ErrorResponse.fromJson(Map<String, dynamic> json) => _$ErrorResponseFromJson(json);
}

/// Represents the details of an error.
///
/// A [Details] object contains additional information about an error.
@freezed
abstract class Details with _$Details {
  const factory Details() = _Details;

  /// Creates a [Details] object from a JSON map.
  ///
  /// The [json] parameter is a map representing the JSON structure of the [Details] object.
  /// Returns a [Details] object.
  factory Details.fromJson(Map<String, dynamic> json) => _$DetailsFromJson(json);
}
