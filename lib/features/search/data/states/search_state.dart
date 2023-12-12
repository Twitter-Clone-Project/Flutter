import 'package:freezed_annotation/freezed_annotation.dart';

import '../models/search_response.dart';
part 'search_state.freezed.dart';

@freezed
class SearchState with _$SearchState {
  const factory SearchState({
    @Default(TrendingList(data: [])) TrendingList trendingList,
    @Default(null) String? errorMessage,
    @Default(true) bool loading,
    @Default(0) int screenIndex,
  }) = _SearchState;
}
