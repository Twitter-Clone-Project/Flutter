import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:x_clone/features/auth/data/model/user.dart';
import 'package:x_clone/features/tweet/data/models/tweet_response.dart';

import '../models/home_response.dart';
import '../repositories/home_repository.dart';
import '../states/home_state.dart';

class HomeNotifierProvider extends StateNotifier<HomeState> {
  HomeNotifierProvider(this.homeRepository) : super(const HomeState()) {
    init();
  }

  final HomeRepository homeRepository;

  init() {
    getTimelineData(page: 1);
  }

  getTimelineData({
    required int page,
  }) async {
    try {
      if (page == 1) {
        state = state.copyWith(loading: true);
      }
      final HomeResponse homeResponse = await homeRepository.getTimeline(page);
      final List<Tweet> tweets;

      if (page == 1) {
        tweets = homeResponse.data;
      } else {
        final oldList = List<Tweet>.from(state.homeResponse.data);
        oldList.addAll(homeResponse.data);
        tweets = oldList;
      }
      state = state.copyWith(
          homeResponse: state.homeResponse
              .copyWith(data: tweets, total: homeResponse.total),
          loading: false);
      return homeResponse;
    } catch (e) {
      state = state.copyWith(loading: false, errorMessage: e.toString());
      return const HomeResponse(data: [], total: 0);
    }
  }

  Future<bool> addLike({required String tweetId}) async {
    try {
      bool response = await homeRepository.addLike(tweetId: tweetId);
      List<Tweet> tweetlist = List.from(state.homeResponse.data);
      for (int i = 0; i < tweetlist.length; i++) {
        if (tweetlist[i].id == tweetId) {
          print("founded from home");
          tweetlist[i] = tweetlist[i].copyWith(
            isLiked: true,
            likesCount: tweetlist[i].likesCount! + 1,
          );
        }
      }
      state = state.copyWith(
        homeResponse: state.homeResponse.copyWith(data: tweetlist),
        loading: false,
      );
      if (!response) {
        for (int i = 0; i < tweetlist.length; i++) {
          if (tweetlist[i].id == tweetId) {
            tweetlist[i] = tweetlist[i].copyWith(
              isLiked: false,
              likesCount: tweetlist[i].likesCount! - 1,
            );
          }
        }
        state = state.copyWith(
          homeResponse: state.homeResponse.copyWith(data: tweetlist),
          loading: false,
        );
      }
      return response;
    } catch (e) {
      return false;
    }
  }

  Future<bool> deleteLike({required String tweetId}) async {
    try {
      bool response = await homeRepository.deleteLike(tweetId: tweetId);
      List<Tweet> tweetlist = List.from(state.homeResponse.data);
      for (int i = 0; i < tweetlist.length; i++) {
        if (tweetlist[i].id == tweetId) {
          tweetlist[i] = tweetlist[i].copyWith(
            isLiked: false,
            likesCount: tweetlist[i].likesCount! - 1,
          );
        }
      }
      state = state.copyWith(
        homeResponse: state.homeResponse.copyWith(data: tweetlist),
        loading: false,
      );
      if (!response) {
        for (int i = 0; i < tweetlist.length; i++) {
          if (tweetlist[i].id == tweetId) {
            tweetlist[i] = tweetlist[i].copyWith(
              isLiked: true,
              likesCount: tweetlist[i].likesCount! + 1,
            );
          }
        }
        state = state.copyWith(
          homeResponse: state.homeResponse.copyWith(data: tweetlist),
          loading: false,
        );
      }
      return response;
    } catch (e) {
      return false;
    }
  }

  addRetweet({required String tweetId}) async {
    try {
      homeRepository.addRetweet(tweetId: tweetId);
      List<Tweet> tweetlist = List.from(state.homeResponse.data);
      for (int i = 0; i < tweetlist.length; i++) {
        if (tweetlist[i].id == tweetId) {
          tweetlist[i] = tweetlist[i].copyWith(
            isRetweeted: true,
            retweetsCount: tweetlist[i].retweetsCount! + 1,
          );
        }
      }
      state = state.copyWith(
        homeResponse: state.homeResponse.copyWith(data: tweetlist),
        loading: false,
      );
      return true;
    } catch (e) {
      return false;
    }
  }

  deleteRetweet({required String tweetId}) async {
    try {
      homeRepository.deleteRetweet(tweetId: tweetId);
      List<Tweet> tweetlist = List.from(state.homeResponse.data);
      for (int i = 0; i < tweetlist.length; i++) {
        if (tweetlist[i].id == tweetId) {
          tweetlist[i] = tweetlist[i].copyWith(
            isRetweeted: false,
            retweetsCount: tweetlist[i].retweetsCount! - 1,
          );
        }
      }
      state = state.copyWith(
        homeResponse: state.homeResponse.copyWith(data: tweetlist),
        loading: false,
      );
      return true;
    } catch (e) {
      return false;
    }
  }

  Future<void> getRepliers({required String tweetId}) async {
    try {
      state = state.copyWith(
        loading: true,
      );
      final RepliersList repliers =
          await homeRepository.fetchRepliersData(tweetId: tweetId);
      List<Tweet> tweetlist = List.from(state.homeResponse.data);
      int tweetIndex = tweetlist.indexWhere((tweet) => tweet.id == tweetId);
      if (tweetIndex != -1) {
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
      }
    } catch (e) {
      state = state.copyWith(
        loading: false,
        //errorMessage: e.toString(),
        repliersList: const RepliersList(data: []),
      );
    }
  }

  // addTweet({String? tweetText, List<MultipartFile>? attachments}) async {
  //   List<String> trends = [];
  //   if (tweetText != null) {
  //     List<String> words = tweetText.split(' ');
  //     for (String word in words) {
  //       if (word.startsWith('#')) {
  //         trends.add(word.substring(1));
  //       }
  //     }
  //   }
  //   try {
  //     homeRepository.addTweet(
  //         tweetText: tweetText, media: attachments, trends: trends);
  //     return true;
  //   } catch (e) {
  //     return false;
  //     // Handle error
  //   }
  // }

  deleteTweet({required String tweetId}) async {
    try {
      homeRepository.deleteTweet(tweetId: tweetId);
      List<Tweet> tweetlist = List.from(state.homeResponse.data);
      int tweetIndex = tweetlist.indexWhere((tweet) => tweet.id == tweetId);
      if (tweetIndex != -1) {
        tweetlist.removeAt(tweetIndex);
        state = state.copyWith(
          homeResponse: state.homeResponse.copyWith(data: tweetlist),
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

  Future<ReplierData?> addReply({
    required String tweetId,
    required String replyText,
    required User replierUser,
  }) async {
    try {
      if (replyText.isNotEmpty) {
        final ReplierData replier = await homeRepository.addReply(
            tweetId: tweetId, replyText: replyText);
        List<Tweet> tweetlist = List.from(state.homeResponse.data);
        // int tweetIndex = tweetlist.indexWhere((tweet) => tweet.id == tweetId);
        RepliersList updatedList = const RepliersList(data: []);
        for (int i = 0; i < tweetlist.length; i++) {
          if (tweetlist[i].id == tweetId) {
            List<ReplierData> updatedRepliersList =
                List<ReplierData>.from(state.repliersList.data!);

            updatedRepliersList.add(replier);
            updatedList = RepliersList(data: updatedRepliersList);
            tweetlist[i] = tweetlist[i].copyWith(
              repliesCount: state.homeResponse.data[i].repliesCount! + 1,
            );
          }
        }
        state = state.copyWith(
          homeResponse: state.homeResponse.copyWith(data: tweetlist),
          loading: false,
          repliersList: updatedList,
        );
        return replier;
      }
    } catch (e) {
      throw e;
    }
  }

  deleteReply({required String tweetId, required String replyId}) async {
    try {
      homeRepository.deleteReply(tweetId: tweetId, replyId: replyId);
      List<Tweet> tweetlist = List.from(state.homeResponse.data);
      // int tweetIndex = tweetlist.indexWhere((tweet) => tweet.id == tweetId);
      RepliersList updatedList = const RepliersList(data: []);
      for (int i = 0; i < tweetlist.length; i++) {
        if (tweetlist[i].id == tweetId) {
          List<ReplierData> updatedRepliersList =
              List<ReplierData>.from(state.repliersList.data!);
          int replyIndex = updatedRepliersList
              .indexWhere((reply) => reply.replyId == replyId);
          updatedRepliersList.removeAt(replyIndex);

          updatedList = RepliersList(data: updatedRepliersList);
          tweetlist[i] = tweetlist[i].copyWith(
            repliesCount: state.homeResponse.data[i].repliesCount! - 1,
          );
        }
      }
      state = state.copyWith(
        homeResponse: state.homeResponse.copyWith(data: tweetlist),
        loading: false,
        repliersList: updatedList,
      );
      return true;
    } catch (e) {
      return false;
    }
  }

  changePageIndex(index) {
    state = state.copyWith(screenIndex: index);
  }
}

final homeNotifierProvider =
    StateNotifierProvider<HomeNotifierProvider, HomeState>((ref) {
  final homeRepository = ref.watch(homeRepositoryProvider);

  return HomeNotifierProvider(homeRepository);
});
