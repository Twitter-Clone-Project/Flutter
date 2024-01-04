import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:x_clone/features/auth/data/model/user.dart';
import 'package:x_clone/features/search/data/models/search_response.dart';
import 'package:x_clone/features/search/data/repositories/search_repository.dart';
import 'package:x_clone/features/search/data/states/search_state.dart';
import 'package:x_clone/features/tweet/data/models/tweet_response.dart';
import 'package:x_clone/features/tweet/data/repositories/tweet_repository.dart';
import 'package:x_clone/features/tweet/data/states/tweet_state.dart';

import '../../../home/data/models/home_response.dart';

/// A notifier provider for managing the state of search-related features.
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

  /// Fetches trending data.
  ///
  /// This function updates the state of the provider by setting the [loading]
  /// flag to true, then fetches the trending data from the [searchRepository].
  /// If the data is successfully fetched, it updates the [trendingList] and sets
  /// the [loading] flag to false. If an error occurs during the fetch, it sets
  /// the [errorMessage] and [loading] flag accordingly.
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


  /// Searches for users based on the provided query and page number.
  ///
  /// This function searches for users using the [searchRepository] by providing
  /// the [query] and [page] number. It updates the state of the provider by setting
  /// the [loading] flag to true and the [usersIndex] to 0 if it's the first page.
  /// If the search is successful, it updates the [usersList] with the fetched data,
  /// sets the [loading] flag to false, and updates the [usersIndex] to the current page.
  /// If an error occurs during the search, it sets the [errorMessage], [loading] flag,
  /// and returns an empty [UsersList].
  getSearchedUsers({
    required String query,
    required int page,
  }) async {
    try {
      if (page == 1) {
        state = state.copyWith(loading: true, usersIndex: 0);
      }
      final UsersList usersList =
          await searchRepository.searchUsers(query: query, page: page);
      final List<UserData> users;

      if (page == 1) {
        users = usersList.data;
      } else {
        final oldList = List<UserData>.from(state.usersList.data);
        oldList.addAll(usersList.data);
        users = oldList;
      }
      state = state.copyWith(
        usersList: state.usersList
            .copyWith(data: users, total: usersList.total),
        loading: false,
        usersIndex: page,
      );
      return usersList;
    } catch (e) {
      state =
          state.copyWith(loading: false, errorMessage: e.toString());
      return const UsersList(data: [], total: 0);
    }
  }

  
  /// Searches for tweets based on the provided query and page number.
  ///
  /// This function searches for tweets using the [searchRepository] by providing
  /// the [query] and [page] number. It updates the state of the provider by setting
  /// the [loading] flag to true and the [tweetsIndex] to 0 if it's the first page.
  /// If the search is successful, it updates the [tweetList] with the fetched data,
  /// sets the [loading] flag to false, and updates the [tweetsIndex] to the current page.
  /// If an error occurs during the search, it sets the [errorMessage], [loading] flag,
  /// and returns an empty [TweetList].
  getSearchedTweets({
    required String query,
    required int page,
  }) async {
    try {
      if (page == 1) {
        state = state.copyWith(loading: true, tweetsIndex: 0);
      }
      final TweetList tweetList =
          await searchRepository.searchTweets(query: query, page: page);
      final List<Tweet> tweets;

      if (page == 1) {
        tweets = tweetList.data;
      } else {
        final oldList = List<Tweet>.from(state.tweetList.data);
        oldList.addAll(tweetList.data);
        tweets = oldList;
      }
      state = state.copyWith(
        tweetList: state.tweetList
            .copyWith(data: tweets, total: tweetList.total),
        loading: false,
        tweetsIndex: page,
      );
      return tweetList;
    } catch (e) {
      state =
          state.copyWith(loading: false, errorMessage: e.toString());
      return const TweetList(data: [], total: 0);
    }
  }

  /// Sets the loading state to true.
  ///
  /// This function updates the state of the provider by setting the [loading]
  /// flag to true and clears the [errorMessage].
  Future<void> loading() async {
    state = state.copyWith(
      loading: true,
      errorMessage: null,
    );
  }

  /// Resets the searched users list.
  ///
  /// This function updates the state of the provider by resetting the [usersList]
  /// to an empty state, setting the [loading] flag to false, and clearing the [errorMessage].
  Future<void> resetSearchedUsers() async {
    state = state.copyWith(
      usersList: const UsersList(data: []),
// Assuming UsersList has a factory method for an empty state
      loading: false,
      errorMessage: null,
    );
  }

  /// Resets the searched tweets list.
  ///
  /// This function updates the state of the provider by resetting the [tweetList]
  /// to an empty state, setting the [loading] flag to false, and clearing the [errorMessage].
  Future<void> resetSearchedTweets() async {
    state = state.copyWith(
      tweetList: const TweetList(data: []),
// Assuming UsersList has a factory method for an empty state
      loading: false,
      errorMessage: null,
    );
  }


  /// Adds a like to a tweet.
  ///
  /// This function adds a like to the tweet with the specified [tweetId]. It updates
  /// the state of the provider by modifying the corresponding tweet in the [tweetList]
  /// to set [isLiked] to true and increment [likesCount] by 1. If the tweet is found
  /// and updated successfully, it returns true. Otherwise, it returns false.
  addLike({required String tweetId}) async {
    try {
      List<Tweet> tweetlist = List.from(state.tweetList.data);
      int tweetIndex = tweetlist.indexWhere((tweet) => tweet.id == tweetId);
      if (tweetIndex != -1) {
        tweetlist[tweetIndex] = tweetlist[tweetIndex].copyWith(
          isLiked: true,
          likesCount: tweetlist[tweetIndex].likesCount! + 1,
        );
        state = state.copyWith(
          tweetList: state.tweetList.copyWith(data: tweetlist),
          loading: false,
        );
        return true;
      } else {
        return false;
      }
    } catch (e) {
      return false;
    }
  }

  /// Deletes a like from a tweet.
  ///
  /// This function deletes a like from the tweet with the specified [tweetId]. It updates
  /// the state of the provider by modifying the corresponding tweet in the [tweetList]
  /// to set [isLiked] to false and decrement [likesCount] by 1. If the tweet is found
  /// and updated successfully, it returns true. Otherwise, it returns false.
  deleteLike({required String tweetId}) async {
    try {
      List<Tweet> tweetlist = List.from(state.tweetList.data);
      int tweetIndex = tweetlist.indexWhere((tweet) => tweet.id == tweetId);

      if (tweetIndex != -1) {
        tweetlist[tweetIndex] = tweetlist[tweetIndex].copyWith(
          isLiked: false,
          likesCount: tweetlist[tweetIndex].likesCount! - 1,
        );
        state = state.copyWith(
          tweetList: state.tweetList.copyWith(data: tweetlist),
          loading: false,
        );
        return true;
      } else {
        return false;
      }
    } catch (e) {
      return false;
    }
  }

  /// Adds a retweet to a tweet.
  ///
  /// This function adds a retweet to the tweet with the specified [tweetId]. It updates
  /// the state of the provider by modifying the corresponding tweet in the [tweetList]
  /// to set [isRetweeted] to true and increment [retweetsCount] by 1. If the tweet is found
  /// and updated successfully, it returns true. Otherwise, it returns false.
  addRetweet({required String tweetId}) async {
    try {
      List<Tweet> tweetlist = List.from(state.tweetList.data);
      int tweetIndex = tweetlist.indexWhere((tweet) => tweet.id == tweetId);

      if (tweetIndex != -1) {
        tweetlist[tweetIndex] = tweetlist[tweetIndex].copyWith(
          isRetweeted: true,
          retweetsCount: tweetlist[tweetIndex].retweetsCount! + 1,
        );
        state = state.copyWith(
          tweetList: state.tweetList.copyWith(data: tweetlist),
          loading: false,
        );
        return true;
      } else {
        return false;
      }
    } catch (e) {
      return false;
    }
  }

  /// Deletes a retweet from a tweet.
  ///
  /// This function deletes a retweet from the tweet with the specified [tweetId]. It updates
  /// the state of the provider by modifying the corresponding tweet in the [tweetList]
  /// to set [isRetweeted] to false and decrement [retweetsCount] by 1. If the tweet is found
  /// and updated successfully, it returns true. Otherwise, it returns false.
  deleteRetweet({required String tweetId}) async {
    try {
      List<Tweet> tweetlist = List.from(state.tweetList.data);
      int tweetIndex = tweetlist.indexWhere((tweet) => tweet.id == tweetId);

        if (tweetIndex != -1) {
          tweetlist[tweetIndex] = tweetlist[tweetIndex].copyWith(
            isRetweeted: false,
            retweetsCount: tweetlist[tweetIndex].retweetsCount! - 1,
          );
          state = state.copyWith(
            tweetList: state.tweetList.copyWith(data: tweetlist),
            loading: false,
          );
          return true;
        } else {
          return false;
        }
      } catch (e) {
        return false;
      }
    }

    // Future<bool> addReply(
    //     {required String tweetId,
    //       required String replyText,
    //       required User replierUser,
    //       required int index}) async {
    //   try {
    //     if (replyText.isEmpty) {
    //       return false;
    //     }
    //     homeRepository.addReply(tweetId: tweetId, replyText: replyText);
    //     ReplierData replier = ReplierData(
    //       replyUserId: replierUser.userId,
    //       username: replierUser.username,
    //       imageUrl: replierUser.imageUrl,
    //       replyText: replyText,
    //     );
    //     List<ReplierData> updatedRepliersList =
    //     List<ReplierData>.from(state.repliersList.data!);
    //     updatedRepliersList.add(replier);
    //     RepliersList updatedList = RepliersList(data: updatedRepliersList);
    //     List<Tweet> tweetlist =
    //     List.from(state.homeResponse.data); // Create a new list
    //     tweetlist[index] = tweetlist[index].copyWith(
    //       repliesCount: state.homeResponse.data[index].repliesCount! + 1,
    //     );
    //     state = state.copyWith(
    //       homeResponse: state.homeResponse.copyWith(data: tweetlist),
    //       loading: false,
    //       repliersList: updatedList,
    //     );
    //     return true;
    //   } catch (e) {
    //     return false;
    //     // Handle error
    //   }
    // }

}

/// A provider that manages the state of search functionality.
///
/// This provider is responsible for handling the state of search functionality
/// in the application. It uses a [SearchRepository] to perform search operations
/// and updates the [SearchState] accordingly.
///
/// Example usage:
/// ```
/// final searchNotifier = useProvider(searchNotifierProvider);
///
/// // Perform a search
/// searchNotifier.search('keyword');
///
/// // Access the search results
/// final results = searchNotifier.state.results;
/// ```
final searchNotifierProvider =
    StateNotifierProvider<SearchNotifierProvider, SearchState>(
  (ref) {
    final searchRepository = ref.watch(searchRepositoryProvider);
    return SearchNotifierProvider(searchRepository);
  },
);
