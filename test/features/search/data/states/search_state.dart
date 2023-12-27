import 'package:flutter_test/flutter_test.dart';
import 'package:x_clone/features/search/data/models/search_response.dart';
import 'package:x_clone/features/search/data/states/search_state.dart';

void main() {
  group('SearchState', () {
    test('equality', () {
      const searchState1 = SearchState(
        trendingList: TrendingList(data: []),
        usersList: UsersList(data: []),
        tweetList: TweetList(data: []),
        errorMessage: null,
        loading: true,
        tweetsIndex: 0,
        usersIndex: 0,
        screenIndex: 0,
      );

      const searchState2 = SearchState(
        trendingList: TrendingList(data: []),
        usersList: UsersList(data: []),
        tweetList: TweetList(data: []),
        errorMessage: null,
        loading: true,
        tweetsIndex: 0,
        usersIndex: 0,
        screenIndex: 0,
      );

      expect(searchState1, searchState2);
    });

    test('custom error message', () {
      const searchState = SearchState(
        errorMessage: 'Custom error message',
      );

      expect(searchState.errorMessage, 'Custom error message');
    });

  });
}
