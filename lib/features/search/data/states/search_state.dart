import 'package:freezed_annotation/freezed_annotation.dart';

import '../models/search_response.dart';
part 'search_state.freezed.dart';

/// Represents the state of the search feature.
///
/// This class is used to define the different states of the search feature,
/// including the trending list, users list, tweet list, error message,
/// loading status, and index values.
///
/// Example usage:
/// ```dart
/// SearchState state = SearchState(
///   trendingList: TrendingList(data: []),
///   usersList: UsersList(data: []),
///   tweetList: TweetList(data: []),
///   errorMessage: null,
///   loading: true,
///   tweetsIndex: 0,
///   usersIndex: 0,
///   screenIndex: 0,
/// );
/// ```
@freezed
class SearchState with _$SearchState {
  const factory SearchState({
    @Default(TrendingList(data: [])) TrendingList trendingList,
    @Default(UsersList(data: [])) UsersList usersList,
    @Default(TweetList(data: [])) TweetList tweetList,
    @Default(null) String? errorMessage,
    @Default(true) bool loading,
    @Default(0) int tweetsIndex,
    @Default(0) int usersIndex,
    @Default(0) int screenIndex,
  }) = _SearchState;
}
