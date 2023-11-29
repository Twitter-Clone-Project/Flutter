import 'package:dio/dio.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:x_clone/features/home/data/models/home_response.dart';
import 'package:x_clone/features/tweet/data/models/tweet_response.dart';
import 'package:x_clone/web_services/http_client.dart';

abstract class TweetRepository {
  Future<LikersList> fetchLikersData();
}

class TweetRepositoryImpl implements TweetRepository {
  Future<LikersList> fetchLikersData() async {
    try {
      var response = await HttpClient.dio.get("");

      LikersList likersList = LikersResponseFromJson(response.data);
      return likersList;
    } catch (e) {
      rethrow;
    }
  }
}

final tweetRepositoryProvider = Provider<TweetRepository>((ref) {
  return TweetRepositoryImpl();
});
