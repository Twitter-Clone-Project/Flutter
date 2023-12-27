import 'package:flutter_test/flutter_test.dart';
import 'package:x_clone/features/tweet/data/models/tweet_response.dart';
import 'package:x_clone/features/tweet/data/states/tweet_state.dart';

void main() {
  group('TweetState', () {
    test('equality', () {
      const tweetState1 = TweetState(
        retweetrsList: RetweetersList(data: []),
        likersList: LikersList(data: []),
        errorMessage: null,
        loading: true,
        screenIndex: 0,
        isLiked: false,
      );

      const tweetState2 = TweetState(
        retweetrsList: RetweetersList(data: []),
        likersList: LikersList(data: []),
        errorMessage: null,
        loading: true,
        screenIndex: 0,
        isLiked: false,
      );

      expect(tweetState1, tweetState2);
    });

    test('custom error message', () {
      const tweetState = TweetState(
        // ... set other default values ...
        errorMessage: 'Custom error message',
      );

      expect(tweetState.errorMessage, 'Custom error message');
    });

  });
}
