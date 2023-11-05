import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../models/home_response.dart';
part 'home_state.freezed.dart';

@freezed
class HomeState with _$HomeState {
  const factory HomeState({
    @Default(null) String? errorMessage,
    @Default(true) bool loading,
    @Default(0) int screenIndex,
  }) = _HomeState;
}
