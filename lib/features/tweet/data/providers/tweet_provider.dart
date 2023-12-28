import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:x_clone/features/auth/data/model/user.dart';
import 'package:x_clone/features/tweet/data/models/tweet_response.dart';
import 'package:x_clone/features/tweet/data/repositories/tweet_repository.dart';
import 'package:x_clone/features/tweet/data/states/tweet_state.dart';

/// A provider class that manages the state and business logic related to tweets.
class TweetNotifierProvider extends StateNotifier<TweetState> {
  TweetNotifierProvider(this.tweetRepository, [TweetState? state])
      : super(state ?? const TweetState()) {
    init();
  }

  final TweetRepository tweetRepository;

  /// Initializes the provider.
  init() {}

  /// Changes the current page index.
  ///
  /// This function updates the [TweetState] by setting the [screenIndex] to the specified [index].
  ///
  /// Example usage:
  /// ```dart
  /// tweetNotifierProvider.changePageIndex(2);
  /// ```
  changePageIndex(index) {
    state = state.copyWith(screenIndex: index);
  }

  /// Retrieves the likers of a tweet.
  ///
  /// This function fetches the likers data from the [tweetRepository] using the specified [tweetId].
  /// If the data is successfully fetched, it updates the [TweetState] by setting the [likersList] to the fetched data.
  /// Otherwise, it sets the [errorMessage] to 'Failed to fetch likers'.
  ///
  /// Example usage:
  /// ```dart
  /// await tweetNotifierProvider.getLikers(tweetId: '123');
  /// ```
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

  /// Retrieves the retweeters of a tweet.
  ///
  /// This function fetches the retweeters data from the [tweetRepository] using the specified [tweetId].
  /// If the data is successfully fetched, it updates the [TweetState] by setting the [retweetersList] to the fetched data.
  /// Otherwise, it sets the [errorMessage] to 'Failed to fetch likers'.
  ///
  /// Example usage:
  /// ```dart
  /// await tweetNotifierProvider.getRetweeters(tweetId: '123');
  /// ```
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
}

/// A provider instance of [TweetNotifierProvider] that can be used to access the tweet-related state and functions.
final tweetNotifierProvider =
    StateNotifierProvider<TweetNotifierProvider, TweetState>(
  (ref) {
    final tweetRepository = ref.watch(tweetRepositoryProvider);
    return TweetNotifierProvider(tweetRepository);
  },
);
