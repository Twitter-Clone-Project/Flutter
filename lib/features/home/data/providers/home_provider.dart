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

  addLike({required String tweetId, required int index}) async {
    try {
      homeRepository.addLike(tweetId: tweetId);
      List<Tweet> tweetlist =
          List.from(state.homeResponse.data); // Create a new list
      tweetlist[index] = tweetlist[index].copyWith(
        isLiked: true,
        likesCount: state.homeResponse.data[index].likesCount! + 1,
      );
      state = state.copyWith(
        homeResponse: state.homeResponse.copyWith(data: tweetlist),
        loading: false,
      );
      return true;
    } catch (e) {
      return false;
      // Handle error
    }
  }

  deleteLike({required String tweetId, required int index}) async {
    try {
      homeRepository.deleteLike(tweetId: tweetId);
      List<Tweet> tweetlist =
          List.from(state.homeResponse.data); // Create a new list
      tweetlist[index] = tweetlist[index].copyWith(
        isLiked: false,
        likesCount: state.homeResponse.data[index].likesCount! - 1,
      );
      state = state.copyWith(
        homeResponse: state.homeResponse.copyWith(data: tweetlist),
        loading: false,
      );
      return true;
    } catch (e) {
      return false;
      // Handle error
    }
  }

  addRetweet({required String tweetId, required int index}) async {
    try {
      homeRepository.addRetweet(tweetId: tweetId);
      List<Tweet> tweetlist =
          List.from(state.homeResponse.data); // Create a new list
      tweetlist[index] = tweetlist[index].copyWith(
        isRetweeted: true,
        retweetsCount: state.homeResponse.data[index].retweetsCount! + 1,
      );
      state = state.copyWith(
        homeResponse: state.homeResponse.copyWith(data: tweetlist),
        loading: false,
      );
      return true;
    } catch (e) {
      return false;
      // Handle error
    }
  }

  deleteRetweet({required String tweetId, required int index}) async {
    try {
      homeRepository.deleteRetweet(tweetId: tweetId);
      List<Tweet> tweetlist =
          List.from(state.homeResponse.data); // Create a new list
      tweetlist[index] = tweetlist[index].copyWith(
        isRetweeted: false,
        retweetsCount: state.homeResponse.data[index].retweetsCount! - 1,
      );
      state = state.copyWith(
        homeResponse: state.homeResponse.copyWith(data: tweetlist),
        loading: false,
      );
      return true;
    } catch (e) {
      return false;
      // Handle error
    }
  }

  Future<bool> addReply(
      {required String tweetId,
      required String replyText,
      required User replierUser,
      required int index}) async {
    try {
      if (replyText.isEmpty) {
        return false;
      }
      homeRepository.addReply(tweetId: tweetId, replyText: replyText);
      ReplierData replier = ReplierData(
        replyUserId: replierUser.userId,
        username: replierUser.username,
        profileImageURL: replierUser.profileImageURL,
        replyText: replyText,
      );
      List<ReplierData> updatedRepliersList =
          List<ReplierData>.from(state.repliersList.data!);
      updatedRepliersList.add(replier);
      RepliersList updatedList = RepliersList(data: updatedRepliersList);
      List<Tweet> tweetlist =
          List.from(state.homeResponse.data); // Create a new list
      tweetlist[index] = tweetlist[index].copyWith(
        repliesCount: state.homeResponse.data[index].repliesCount! + 1,
      );
      state = state.copyWith(
        homeResponse: state.homeResponse.copyWith(data: tweetlist),
        loading: false,
        repliersList: updatedList,
      );
      return true;
    } catch (e) {
      return false;
      // Handle error
    }
  }

  Future<void> getRepliers({required String tweetId}) async {
    try {
      state = state.copyWith(
        loading: true,
      );
      final RepliersList repliers =
          await homeRepository.fetchRepliersData(tweetId: tweetId);

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

  addTweet({String? tweetText, List<MultipartFile>? attachments}) async {
    List<String> trends = [];
    if (tweetText != null) {
      List<String> words = tweetText.split(' ');
      for (String word in words) {
        if (word.startsWith('#')) {
          trends.add(word);
        }
      }
    }
    try {
      homeRepository.addTweet(
          tweetText: tweetText, media: attachments, trends: trends);
      return true;
    } catch (e) {
      return false;
      // Handle error
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
