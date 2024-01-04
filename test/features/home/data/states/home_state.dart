import 'package:flutter_test/flutter_test.dart';
import 'package:x_clone/features/home/data/models/home_response.dart';
import 'package:x_clone/features/home/data/states/home_state.dart';
import 'package:x_clone/features/tweet/data/models/tweet_response.dart';

void main() {
  group('HomeState', () {
    test('equality', () {
      const homeState1 = HomeState(
        homeResponse: HomeResponse(data: [], total: 0),
        repliersList: RepliersList(data: []),
        errorMessage: null,
        loading: true,
        screenIndex: 0,
        pageIndex: 0,
      );

      const homeState2 = HomeState(
        homeResponse: HomeResponse(data: [], total: 0),
        repliersList: RepliersList(data: []),
        errorMessage: null,
        loading: true,
        screenIndex: 0,
        pageIndex: 0,
      );

      expect(homeState1, homeState2);
    });

    test('custom error message', () {
      const homeState = HomeState(
        // ... set other default values ...
        errorMessage: 'Custom error message',
      );

      expect(homeState.errorMessage, 'Custom error message');
    });

  });
}
