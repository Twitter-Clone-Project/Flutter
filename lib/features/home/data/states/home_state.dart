import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:x_clone/features/tweet/data/models/tweet_response.dart';

import '../models/home_response.dart';
part 'home_state.freezed.dart';

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
