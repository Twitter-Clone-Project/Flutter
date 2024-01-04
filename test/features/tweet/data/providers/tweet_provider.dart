import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:x_clone/features/tweet/data/models/tweet_response.dart';
import 'package:x_clone/features/tweet/data/providers/tweet_provider.dart';
import 'package:x_clone/features/tweet/data/repositories/tweet_repository.dart';
import 'package:x_clone/features/tweet/data/states/tweet_state.dart';

class MockTweetRepository extends Mock implements TweetRepository {}

void main() {
  group('TweetNotifierProvider Tests', () {
    late ProviderContainer container;
    late MockTweetRepository mockTweetRepository;

    setUp(() {
      container = ProviderContainer();
      mockTweetRepository = MockTweetRepository();
    });

    tearDown(() {
      container.dispose();
    });

    test('Initial state is correct', () {
      final notifier = container.read(tweetNotifierProvider.notifier);

      expect(notifier.state, equals(const TweetState()));
    });

    test('Change page index updates state', () {
      final notifier = container.read(tweetNotifierProvider.notifier);
      const newIndex = 1;

      notifier.changePageIndex(newIndex);

      expect(notifier.state.screenIndex, equals(newIndex));
    });

    test('Get likers updates state on success', () async {
      final notifier = container.read(tweetNotifierProvider.notifier);
      const mockTweetId = '123';
      final mockLikersList = LikersList(data: []);

      await notifier.getLikers(tweetId: mockTweetId);

      expect(notifier.state.likersList, equals(mockLikersList));
      expect(notifier.state.loading, isFalse);
    });

    test('Get likers handles error', () async {
      final notifier = container.read(tweetNotifierProvider.notifier);
      const mockTweetId = '123';

      await notifier.getLikers(tweetId: mockTweetId);

      expect(notifier.state.errorMessage, equals('Failed to fetch likers'));
      expect(notifier.state.loading, isFalse);
    });

    test('Get retweeters updates state on success', () async {
      final notifier = container.read(tweetNotifierProvider.notifier);
      const mockTweetId = '123';
      final mockRetweetersList = RetweetersList(data: []);

      await notifier.getRetweeters(tweetId: mockTweetId);

      expect(notifier.state.retweetrsList, equals(mockRetweetersList));
      expect(notifier.state.loading, isFalse);
    });

    test('Get retweeters handles error', () async {
      final notifier = container.read(tweetNotifierProvider.notifier);
      const mockTweetId = '123';

      await notifier.getRetweeters(tweetId: mockTweetId);

      expect(notifier.state.errorMessage, equals('Failed to fetch likers'));
      expect(notifier.state.loading, isFalse);
    });
  });
}
