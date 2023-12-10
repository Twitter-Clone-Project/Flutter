import 'package:dio/dio.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:x_clone/features/tweet/data/models/tweet_response.dart';
import 'package:x_clone/web_services/web_services.dart';

import '../models/home_response.dart';

abstract class HomeRepository {
  getTimeline(int page);
  addLike({required String tweetId});
  deleteLike({required String tweetId});
  addRetweet({required String tweetId});
  deleteRetweet({required String tweetId});
  addReply({required String tweetId, required String replyText});
  fetchRepliersData({required String tweetId});
  Future<void> addTweet({String? tweetText, List<MultipartFile>? attachments});
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

  @override
  Future<void> addReply(
      {required String tweetId, required String replyText}) async {
    final data = {"text": replyText};
    try {
      var response = await HttpClient.dio.post(
        EndPoints.addReply(tweetId),
        data: data,
      );
      if (response.statusCode == 200 || response.statusCode == 201) {
      } else {
        throw (response.data["message"]);
      }
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<void> addTweet(
      {String? tweetText, List<MultipartFile>? attachments}) async {
    FormData formData = FormData();

    if (tweetText != null) {
      formData.fields.add(MapEntry('tweetText', tweetText));
    }

    if (attachments != null) {
      for (var attachment in attachments) {
        formData.files.add(MapEntry(
          'attachments',
          attachment,
        ));
      }
    }
    try {
      var response = await HttpClient.dio.post(
        EndPoints.addTweet,
        data: formData,
      );
      if (response.statusCode == 200 || response.statusCode == 201) {
      } else {
        throw (response.data["message"]);
      }
    } catch (e) {
      rethrow;
    }
  }
}

final homeRepositoryProvider = Provider<HomeRepository>((ref) {
  return HomeRepositoryImpl();
});
