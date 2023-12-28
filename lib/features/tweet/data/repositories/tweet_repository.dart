import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:x_clone/features/tweet/data/models/tweet_response.dart';
import 'package:x_clone/web_services/http_client.dart';
import '../../../../web_services/end_points.dart';

/// Abstract class representing a Tweet Repository.
///
/// This class defines the contract for fetching likers and retweeters data for a tweet.
abstract class TweetRepository {
  
  /// Fetches the likers data for a tweet.
  ///
  /// Returns a [Future] that completes with a [LikersList] object containing the likers data.
  /// The [tweetId] parameter is the ID of the tweet for which to fetch the likers data.
  Future<LikersList> fetchLikersData({required String tweetId});
  
  /// Fetches the retweeters data for a tweet.
  ///
  /// Returns a [Future] that completes with a [RetweetersList] object containing the retweeters data.
  /// The [tweetId] parameter is the ID of the tweet for which to fetch the retweeters data.
  Future<RetweetersList> fetchRetweetersData({required String tweetId});
}

/// Implementation of the [TweetRepository] interface.
///
/// This class provides the implementation for fetching likers and retweeters data for a tweet.
class TweetRepositoryImpl implements TweetRepository {
  @override
  Future<LikersList> fetchLikersData({required String tweetId}) async {
    try {
      var response = await HttpClient.dio.get(EndPoints.getLikersData(tweetId));

      if (response.statusCode == 200 || response.statusCode == 201) {
        return LikersList.fromJson(response.data);
      }
      return const LikersList(data: []);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<RetweetersList> fetchRetweetersData({required String tweetId}) async {
    try {
      var response =
          await HttpClient.dio.get(EndPoints.getRetweetersData(tweetId));
      if (response.statusCode == 200 || response.statusCode == 201) {
        return RetweetersList.fromJson(response.data);
      }
      return const RetweetersList(data: []);
    } catch (e) {
      rethrow;
    }
  }
}

/// Provider for the [TweetRepository] instance.
///
/// This provider creates an instance of [TweetRepositoryImpl] and provides it to the dependent widgets.
final tweetRepositoryProvider = Provider<TweetRepository>((ref) {
  return TweetRepositoryImpl();
});
