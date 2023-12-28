import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:x_clone/features/tweet/data/models/tweet_response.dart';

import '../models/tweet_response.dart';
part 'tweet_state.freezed.dart';

/// Represents the state of a tweet.
///
/// This class is used to define the different properties and their default values
/// that make up the state of a tweet. It is used in conjunction with the `freezed`
/// package to generate immutable classes.
///
/// Example usage:
/// ```dart
/// final tweetState = TweetState(
///   retweetrsList: RetweetersList(data: []),
///   likersList: LikersList(data: []),
///   errorMessage: null,
///   loading: true,
///   screenIndex: 0,
///   isLiked: false,
/// );
/// ```
@freezed
class TweetState with _$TweetState {
  const factory TweetState({
    @Default(RetweetersList(data: [])) RetweetersList retweetrsList,
    @Default(LikersList(data: [])) LikersList likersList,
    @Default(null) String? errorMessage,
    @Default(true) bool loading,
    @Default(0) int screenIndex,
    @Default(false) bool? isLiked,
  }) = _TweetState;
}
