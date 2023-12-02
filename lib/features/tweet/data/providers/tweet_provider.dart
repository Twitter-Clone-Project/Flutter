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

  Future<void> getLikers({required String tweetId}) async {
    state = state.copyWith(
      loading: true,
    );
    final LikersList likers =
        await tweetRepository.fetchLikersData(tweetId: tweetId);
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

  Future<void> getRetweeters({required String tweetId}) async {
    state = state.copyWith(
      loading: true,
    );
    final RetweetersList retweeters =
        await tweetRepository.fetchRetweetersData(tweetId: tweetId);
    if (retweeters.data != null) {
      state = state.copyWith(
        retweetrsList: retweeters,
        loading: false,
      );
    } else {
      state = state.copyWith(
        errorMessage: 'Failed to fetch likers',
        loading: false,
      );
    }
  }

  Future<void> getRepliers({required String tweetId}) async {
    try {
      state = state.copyWith(
        loading: true,
      );
      final RepliersList repliers =
          await tweetRepository.fetchRepliersData(tweetId: tweetId);

      if (repliers.data != null) {
        state = state.copyWith(
          repliersList: repliers,
          loading: false,
        );
      } else {
        state = state.copyWith(
          errorMessage: 'Failed to fetch likers',
          loading: false,
        );
      }
    } catch (e) {
      state = state.copyWith(
        loading: false,
        //errorMessage: e.toString(),
        repliersList: const RepliersList(data: []),
      );
    }
  }
}

final tweetNotifierProvider =
    StateNotifierProvider<TweetNotifierProvider, TweetState>(
  (ref) {
    final tweetRepository = ref.watch(tweetRepositoryProvider);
    return TweetNotifierProvider(tweetRepository);
  },
);
