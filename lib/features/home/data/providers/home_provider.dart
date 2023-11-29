import 'package:flutter_riverpod/flutter_riverpod.dart';

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

  addTweet({
    required String tweetText,
    String? attachments

  }) async {
    try {
      // Add the logic for adding a tweet using homeRepository
      await homeRepository.addTweet(tweetText: tweetText, attachments: attachments);

      // If successful, you may want to trigger a refresh of the timeline
      getTimelineData(page: 1);
    } catch (e) {
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
