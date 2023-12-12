import 'dart:convert';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'search_response.freezed.dart';
part 'search_response.g.dart';

@freezed
abstract class TrendData with _$TrendData {
  const factory TrendData({
    String? name,
  }) = _TrendData;

  factory TrendData.fromJson(Map<String, dynamic> json) =>
      _$TrendDataFromJson(json);
}

@freezed
abstract class TrendingList with _$TrendingList {
  const factory TrendingList({
    List<TrendData>? data,
  }) = _TrendingList;

  factory TrendingList.fromJson(Map<String, dynamic> json) =>
      _$TrendingListFromJson(json);
}

TrendingList trendResponseFromJson(String str) =>
    TrendingList.fromJson(json.decode(str));

String trendResponseToJson(TrendingList data) => json.encode(data.toJson());