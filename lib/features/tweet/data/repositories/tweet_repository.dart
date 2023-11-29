import 'package:dio/dio.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:x_clone/features/home/data/models/home_response.dart';
import 'package:x_clone/features/tweet/data/models/tweet_response.dart';
import 'package:x_clone/web_services/http_client.dart';

import '../../../../web_services/end_points.dart';

abstract class TweetRepository {
  Future<LikersList> fetchLikersData({required String tweetId});
  Future<RetweetersList> fetchRetweetersData({required String tweetId});
  Future<RepliersList> fetchRepliersData({required String tweetId});
}

class TweetRepositoryImpl implements TweetRepository {
  Future<LikersList> fetchLikersData({required String tweetId}) async {
    try {
      var response = await HttpClient.dio.get(EndPoints.getLikersData(tweetId));
      LikersList likersList = LikersList.fromJson(response.data);
      return likersList;
    } catch (e) {
      rethrow;
    }
  }

  Future<RetweetersList> fetchRetweetersData({required String tweetId}) async {
    try {
      var response = await HttpClient.dio.get(EndPoints.getRetweetersData(tweetId));

      RetweetersList retweetersList = RetweetersList.fromJson(response.data);
      return retweetersList;
    } catch (e) {
      rethrow;
    }
  }

  Future<RepliersList> fetchRepliersData({required String tweetId}) async {
    try {
      var response = await HttpClient.dio.get(EndPoints.getRepliersData(tweetId));
      RepliersList repliersList = RepliersList.fromJson(response.data);
      return repliersList;
    } catch (e) {
      rethrow;
    }
  }
}

final tweetRepositoryProvider = Provider<TweetRepository>((ref) {
  return TweetRepositoryImpl();
});
