import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:x_clone/features/tweet/data/models/tweet_response.dart';
import 'package:x_clone/features/tweet/data/repositories/tweet_repository.dart';
import 'package:x_clone/features/tweet/data/states/tweet_state.dart';

class TweetNotifierProvider extends StateNotifier<TweetState> {
  TweetNotifierProvider(this.tweetRepository, [TweetState? state])
      : super(state ?? const TweetState()) {
    init();
  }
  final TweetRepository tweetRepository;
  init() {}

  changePageIndex(index) {
    state = state.copyWith(screenIndex: index);
  }

  Future<void> getLikers() async {
    state = state.copyWith(
      loading: true,
    );
    final LikersList likers = await tweetRepository.fetchLikersData();
    if (likers.data != null) {
      state = state.copyWith(
        likersList: likers,
        loading: false,
      );
    } else {
      state = state.copyWith(
        errorMessage: 'Failed to fetch likers',
        loading: false,
      );
    }
  }
}

final tweetNotifierProvider =
    StateNotifierProvider<TweetNotifierProvider, TweetState>((ref) {
  final tweetRepository = ref.watch(tweetRepositoryProvider);
  return TweetNotifierProvider(tweetRepository);
});
