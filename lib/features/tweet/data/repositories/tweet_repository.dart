import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:x_clone/features/tweet/data/models/tweet_response.dart';
import 'package:x_clone/web_services/http_client.dart';
import '../../../../web_services/end_points.dart';

abstract class TweetRepository {
  Future<LikersList> fetchLikersData({required String tweetId});
  Future<RetweetersList> fetchRetweetersData({required String tweetId});
  Future<RepliersList> fetchRepliersData({required String tweetId});
}

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

  @override
  Future<RepliersList> fetchRepliersData({required String tweetId}) async {
    try {
      var response =
          await HttpClient.dio.get(EndPoints.getRepliersData(tweetId));
      if (response.statusCode == 200 || response.statusCode == 201) {
        return RepliersList.fromJson(response.data);
      }
      return const RepliersList(data: []);
    } catch (e) {
      rethrow;
    }
  }
}

final tweetRepositoryProvider = Provider<TweetRepository>((ref) {
  return TweetRepositoryImpl();
});
