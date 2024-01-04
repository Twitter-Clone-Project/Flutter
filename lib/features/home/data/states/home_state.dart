import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:x_clone/features/tweet/data/models/tweet_response.dart';

import '../models/home_response.dart';
part 'home_state.freezed.dart';

/// Represents the state of the home screen.
///
/// This class is used to manage the state of the home screen in the X_Clone app.
/// It contains various properties that represent different aspects of the screen's state,
/// such as the home response data, repliers list, error message, loading status,
/// screen index, and page index.
///
/// Example usage:
/// ```dart
/// HomeState state = HomeState(
///   homeResponse: HomeResponse(data: [], total: 0),
///   repliersList: RepliersList(data: []),
///   errorMessage: null,
///   loading: true,
///   screenIndex: 0,
///   pageIndex: 0,
/// );
/// ```
@freezed
class HomeState with _$HomeState {
  const factory HomeState({
    @Default(HomeResponse(data: [], total: 0)) HomeResponse homeResponse,
    @Default(RepliersList(data: [])) RepliersList repliersList,
    @Default(null) String? errorMessage,
    @Default(true) bool loading,
    @Default(0) int screenIndex,
    @Default(0) int pageIndex,
  }) = _HomeState;
}
