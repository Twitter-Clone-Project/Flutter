import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:x_clone/features/auth/data/model/user.dart';
import 'package:x_clone/features/search/data/models/search_response.dart';
import 'package:x_clone/features/search/data/repositories/search_repository.dart';
import 'package:x_clone/features/search/data/states/search_state.dart';
import 'package:x_clone/features/tweet/data/models/tweet_response.dart';
import 'package:x_clone/features/tweet/data/repositories/tweet_repository.dart';
import 'package:x_clone/features/tweet/data/states/tweet_state.dart';

import '../../../home/data/models/home_response.dart';

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
    try {
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
    } catch (e) {
        state = state.copyWith(
          usersList: UsersList(data: []),
          loading: false,
        );
    }
  }

  Future<void> getSearchedTweets({required String query}) async {
    state = state.copyWith(
      loading: true,
    );
    final TweetList tweets =
    await searchRepository.searchTweets(query: query);
    if (tweets.data != null) {
      state = state.copyWith(
        tweetList: tweets,
        loading: false,
      );
    } else {
      state = state.copyWith(
        errorMessage: 'Failed to fetch users',
        loading: false,
      );
    }
  }

  Future<void> resetSearchedUsers() async {
    state = state.copyWith(
      usersList: const UsersList(data: []),
      // Assuming UsersList has a factory method for an empty state
      loading: false,
      errorMessage: null,
    );
  }


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
    //       profileImageURL: replierUser.profileImageURL,
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

final searchNotifierProvider =
    StateNotifierProvider<SearchNotifierProvider, SearchState>(
  (ref) {
    final searchRepository = ref.watch(searchRepositoryProvider);
    return SearchNotifierProvider(searchRepository);
  },
);
