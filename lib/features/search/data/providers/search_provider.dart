import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:x_clone/features/auth/data/model/user.dart';
import 'package:x_clone/features/search/data/models/search_response.dart';
import 'package:x_clone/features/search/data/repositories/search_repository.dart';
import 'package:x_clone/features/search/data/states/search_state.dart';
import 'package:x_clone/features/tweet/data/models/tweet_response.dart';
import 'package:x_clone/features/tweet/data/repositories/tweet_repository.dart';
import 'package:x_clone/features/tweet/data/states/tweet_state.dart';

class SearchNotifierProvider extends StateNotifier<SearchState> {
  SearchNotifierProvider(this.searchRepository, [SearchState? state])
      : super(state ?? const SearchState()) {
    init();
  }
  final SearchRepository searchRepository;
  init() {}
  changePageIndex(index) {
    state = state.copyWith(screenIndex: index);
  }

  Future<void> fetchTrendingData() async {
    state = state.copyWith(
      loading: true,
    );
    final TrendingList trending = await searchRepository.fetchTrendingData();
    if (trending.data != null) {
      state = state.copyWith(
        trendingList: trending,
        loading: false,
      );
    } else {
      state = state.copyWith(
        errorMessage: 'Failed to fetch trendingData',
        loading: false,
      );
    }
  }

  Future<void> getSearchedUsers({required String query}) async {
    state = state.copyWith(
      loading: true,
    );
    final UsersList users =
    await searchRepository.searchUsers(query: query);
    if (users.data != null) {
      state = state.copyWith(
        usersList: users,
        loading: false,
      );
    } else {
      state = state.copyWith(
        errorMessage: 'Failed to fetch users',
        loading: false,
      );
    }
  }

}

final searchNotifierProvider =
    StateNotifierProvider<SearchNotifierProvider, SearchState>(
  (ref) {
    final searchRepository = ref.watch(searchRepositoryProvider);
    return SearchNotifierProvider(searchRepository);
  },
);
