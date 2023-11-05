import 'package:freezed_annotation/freezed_annotation.dart';
import 'dart:convert';

part 'error_response.freezed.dart';
part 'error_response.g.dart';

ErrorResponse errorResponseFromJson(String str) => ErrorResponse.fromJson(json.decode(str));

String errorResponseToJson(ErrorResponse data) => json.encode(data.toJson());

@freezed
abstract class ErrorResponse with _$ErrorResponse {
  const factory ErrorResponse({
    int? code,
    String? name,
    String? message,
    Details? details,
    String? stack,
  }) = _ErrorResponse;

  factory ErrorResponse.fromJson(Map<String, dynamic> json) => _$ErrorResponseFromJson(json);
}

@freezed
abstract class Details with _$Details {
  const factory Details() = _Details;

  factory Details.fromJson(Map<String, dynamic> json) => _$DetailsFromJson(json);
}
