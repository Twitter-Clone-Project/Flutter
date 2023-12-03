import 'package:dio/dio.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:x_clone/web_services/web_services.dart';

import '../models/home_response.dart';

abstract class HomeRepository {
  getTimeline(int page);
  addLike({required String tweetId});
  deleteLike({required String tweetId});
  addRetweet({required String tweetId});
  deleteRetweet({required String tweetId});
}

class HomeRepositoryImpl implements HomeRepository {
  @override
  getTimeline(int page) async {
    try {
      var response = await HttpClient.dio.get(EndPoints.getTimelineData(page));

      if (response.statusCode == 200 || response.statusCode == 201) {
        return HomeResponse.fromJson(response.data);
      }
      return const HomeResponse(data: [], total: 0);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<void> addLike({required String tweetId}) async {
    try {
      var response = await HttpClient.dio.post(EndPoints.addLike(tweetId));
      if (response.statusCode == 200 || response.statusCode == 201) {}
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<void> deleteLike({required String tweetId}) async {
    try {
      var response = await HttpClient.dio.delete(EndPoints.deleteLike(tweetId));
      if (response.statusCode == 200 || response.statusCode == 201) {}
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<void> addRetweet({required String tweetId}) async {
    try {
      var response = await HttpClient.dio.post(EndPoints.addRetweet(tweetId));
      if (response.statusCode == 200 || response.statusCode == 201) {}
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<void> deleteRetweet({required String tweetId}) async {
    try {
      var response =
          await HttpClient.dio.delete(EndPoints.deleteRetweet(tweetId));
      if (response.statusCode == 200 || response.statusCode == 201) {}
    } catch (e) {
      rethrow;
    }
  }
}

final homeRepositoryProvider = Provider<HomeRepository>((ref) {
  return HomeRepositoryImpl();
});
