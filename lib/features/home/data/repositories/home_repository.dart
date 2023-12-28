import 'package:dio/dio.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:x_clone/features/tweet/data/models/tweet_response.dart';
import 'package:x_clone/web_services/web_services.dart';

import '../models/home_response.dart';

/// Abstract class representing a home repository.
///
/// This class defines the contract for interacting with the home data source.
/// It provides methods for fetching timeline data, adding and deleting likes,
/// adding and deleting retweets, adding replies, fetching repliers data,
/// adding tweets, and deleting tweets and replies.
abstract class HomeRepository {
  /// Fetches the timeline data for a given page.
  ///
  /// The [page] parameter specifies the page number of the timeline data to fetch.
  /// Returns a list of tweets and the total number of tweets.
  getTimeline(int page);

  /// Adds a like to a tweet.
  ///
  /// The [tweetId] parameter specifies the ID of the tweet to add the like to.
  /// Returns `true` if the like was added successfully, `false` otherwise.
  Future<bool> addLike({required String tweetId});

  /// Deletes a like from a tweet.
  ///
  /// The [tweetId] parameter specifies the ID of the tweet to delete the like from.
  /// Returns `true` if the like was deleted successfully, `false` otherwise.
  Future<bool> deleteLike({required String tweetId});

  /// Adds a retweet to a tweet.
  ///
  /// The [tweetId] parameter specifies the ID of the tweet to add the retweet to.
  addRetweet({required String tweetId});

  /// Deletes a retweet from a tweet.
  ///
  /// The [tweetId] parameter specifies the ID of the tweet to delete the retweet from.
  deleteRetweet({required String tweetId});

  /// Adds a reply to a tweet.
  ///
  /// The [tweetId] parameter specifies the ID of the tweet to add the reply to.
  /// The [replyText] parameter specifies the text of the reply.
  addReply({required String tweetId, required String replyText});

  /// Fetches the repliers data for a tweet.
  ///
  /// The [tweetId] parameter specifies the ID of the tweet to fetch the repliers data for.
  /// Returns a list of repliers.
  fetchRepliersData({required String tweetId});

  /// Adds a tweet.
  ///
  /// The [tweetText] parameter specifies the text of the tweet.
  /// The [media] parameter specifies the media files attached to the tweet.
  /// The [trends] parameter specifies the trends associated with the tweet.
  /// Returns `void`.
  Future<void> addTweet(
      {String? tweetText, List<MultipartFile>? media, List<String>? trends});

  /// Deletes a tweet.
  ///
  /// The [tweetId] parameter specifies the ID of the tweet to delete.
  /// Returns `void`.
  deleteTweet({required String tweetId});

  /// Deletes a reply.
  ///
  /// The [tweetId] parameter specifies the ID of the tweet that the reply belongs to.
  /// The [replyId] parameter specifies the ID of the reply to delete.
  /// Returns `void`.
  deleteReply({required String tweetId, required String replyId});
}

/// Implementation of the [HomeRepository] interface.
///
/// This class provides the implementation for the methods defined in the [HomeRepository] interface.
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
  Future<bool> addLike({required String tweetId}) async {
    try {
      var response = await HttpClient.dio.post(EndPoints.addLike(tweetId));
      if (response.statusCode == 200 || response.statusCode == 201) {
        return true;
      }
      return false;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<bool> deleteLike({required String tweetId}) async {
    try {
      var response = await HttpClient.dio.delete(EndPoints.deleteLike(tweetId));
      if (response.statusCode == 200 || response.statusCode == 201) {
        return true;
      }
      return false;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<void> deleteTweet({required String tweetId}) async {
    try {
      var response =
          await HttpClient.dio.delete(EndPoints.deleteTweet(tweetId));
      if (response.statusCode == 200 || response.statusCode == 201) {}
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<void> deleteReply(
      {required String tweetId, required String replyId}) async {
    try {
      var response =
          await HttpClient.dio.delete(EndPoints.deleteReply(tweetId, replyId));
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
  addReply({required String tweetId, required String replyText}) async {
    final data = {"text": replyText};
    try {
      var response = await HttpClient.dio.post(
        EndPoints.addReply(tweetId),
        data: data,
      );
      if (response.statusCode == 200 || response.statusCode == 201) {
        return ReplierData.fromJson(response.data["data"]);
      } else {
        throw (response.data["message"]);
      }
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<void> addTweet(
      {String? tweetText,
      List<MultipartFile>? media,
      List<String>? trends}) async {
    FormData formData = FormData();
    if (tweetText != null) {
      formData.fields.add(MapEntry('tweetText', tweetText));
    }
    if (trends != null) {
      for (var trend in trends) {
        formData.fields.add(MapEntry(
          'trends',
          trend,
        ));
      }
    }
    if (media != null) {
      for (var attachment in media) {
        formData.files.add(MapEntry(
          'media',
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
