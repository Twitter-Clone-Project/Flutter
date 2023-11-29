import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:x_clone/features/tweet/data/models/tweet_response.dart';

import '../models/tweet_response.dart';
part 'tweet_state.freezed.dart';

@freezed
class TweetState with _$TweetState {
  const factory TweetState({
    @Default(LikersList(data: [])) LikersList likersList,
    @Default(null) String? errorMessage,
    @Default(true) bool loading,
    @Default(0) int screenIndex,
  }) = _TweetState;
}
