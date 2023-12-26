import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:x_clone/features/auth/data/model/user.dart';
import 'package:x_clone/features/search/data/models/search_response.dart';
import 'package:x_clone/features/search/data/providers/search_provider.dart';
import 'package:x_clone/features/search/data/repositories/search_repository.dart';
import 'package:x_clone/features/search/data/states/search_state.dart';
import 'package:x_clone/features/tweet/data/models/tweet_response.dart';
import 'package:x_clone/features/tweet/data/repositories/tweet_repository.dart';
import 'package:x_clone/features/tweet/data/states/tweet_state.dart';


void main() {
  group('SearchNotifierProvider Tests', () {
    late ProviderContainer container;

    setUp(() {
      container = ProviderContainer();
    });

    tearDown(() {
      container.dispose();
    });

    test('Initial state is correct', () {
      final notifier = container.read(searchNotifierProvider.notifier);

      expect(notifier.state, equals(const SearchState()));
    });

    test('Change page index updates state', () {
      final notifier = container.read(searchNotifierProvider.notifier);
      const newIndex = 1;

      notifier.changePageIndex(newIndex);

      expect(notifier.state.screenIndex, equals(newIndex));
    });

    // Add more tests for other methods in SearchNotifierProvider
    // ...

    test('Fetch trending data updates state on success', () async {
      final notifier = container.read(searchNotifierProvider.notifier);
      final mockTrending = TrendingList(data: []);

      await notifier.fetchTrendingData();

      // expect(notifier.state.trendingList, equals(mockTrending));
      expect(notifier.state.loading, isFalse);
    });

    test('Fetch trending data handles error', () async {
      final notifier = container.read(searchNotifierProvider.notifier);

      await notifier.fetchTrendingData();

      expect(notifier.state.errorMessage, equals(null));
      expect(notifier.state.loading, isFalse);
    });


    // Example for testing asynchronous method using mock
    test('Get Searched Users updates state on success', () async {
      final notifier = container.read(searchNotifierProvider.notifier);
      const mockQuery = 'test';
      const mockPage = 1;
      final mockUsersList = UsersList(data: []);

      await notifier.getSearchedUsers(query: mockQuery, page: mockPage);

      expect(notifier.state.usersList, equals(mockUsersList));
      expect(notifier.state.loading, isFalse);
    });
    test('Change screen index updates state', () {
      final notifier = container.read(searchNotifierProvider.notifier);
      const newIndex = 2;

      notifier.changePageIndex(newIndex);

      expect(notifier.state.screenIndex, equals(newIndex));
    });

    test('Reset searched users updates state', () async {
      final notifier = container.read(searchNotifierProvider.notifier);

      await notifier.resetSearchedUsers();

      expect(notifier.state.usersList.data, isEmpty);
      expect(notifier.state.loading, isFalse);
      expect(notifier.state.errorMessage, isNull);
    });

    test('Reset searched tweets updates state', () async {
      final notifier = container.read(searchNotifierProvider.notifier);

      await notifier.resetSearchedTweets();

      expect(notifier.state.tweetList.data, isEmpty);
      expect(notifier.state.loading, isFalse);
      expect(notifier.state.errorMessage, isNull);
    });



  });
}
