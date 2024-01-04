import 'package:x_clone/features/Profile/data/model/user_profile.dart';
import 'package:x_clone/features/home/data/models/home_response.dart';
import 'package:x_clone/features/tweet/data/models/tweet_response.dart';
import 'package:x_clone/web_services/web_services.dart';
import 'package:dio/dio.dart';
import 'package:path/path.dart' as path;
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// Abstract class representing a profile repository.
///
/// This class defines the contract for fetching and updating user profiles.
abstract class ProfileRepository {
  /// Fetches the user profile data for a given username.
  ///
  /// Returns the [UserProfile] if the request is successful, otherwise returns null.
  Future<UserProfile?> fetchUserProfileData({required String username});

  /// Retrieves the tweets of a user.
  ///
  /// Returns the [ProfileTweetsResponse] containing the tweets if the request is successful.
  /// Throws an exception with the error message if the request fails.
  getUserTweets(String username, int page);

  /// Adds a new tweet.
  ///
  /// Returns the [Tweet] if the tweet is added successfully.
  /// The [tweetText] parameter is the text content of the tweet.
  /// The [media] parameter is a list of media files attached to the tweet.
  /// The [trends] parameter is a list of trending topics associated with the tweet.
  Future<Tweet> addTweet(
      {String? tweetText, List<MultipartFile>? media, List<String>? trends});

  /// Updates the user profile.
  ///
  /// Returns the updated [UserProfile] if the update is successful.
  /// The [profilePhoto] parameter is the path to the profile photo file.
  /// The [bannerPhoto] parameter is the path to the banner photo file.
  /// The [name] parameter is the new name of the user.
  /// The [bio] parameter is the new biography of the user.
  /// The [website] parameter is the new website URL of the user.
  /// The [location] parameter is the new location of the user.
  /// The [birthDate] parameter is the new birth date of the user.
  /// The [removeBannerPhoto] parameter indicates whether to remove the banner photo.
  Future<UserProfile?> updateProfile(
      {String? profilePhoto,
      String? bannerPhoto,
      String? name,
      String? bio,
      String? website,
      String? location,
      String? birthDate,
      bool? removeBannerPhoto});

  /// Retrieves the liked tweets of a user.
  ///
  /// Returns the [ProfileLikedTweetsResponse] containing the liked tweets if the request is successful.
  /// Returns an empty [ProfileLikedTweetsResponse] if the user has no liked tweets.
  getUserLikedTweets(String username, int page);

  /// Follows a user.
  ///
  /// Returns true if the user is successfully followed.
  /// The [username] parameter is the username of the user to follow.
  Future<bool?> followUser({
    required String username,
  });

  /// Unfollows a user.
  ///
  /// Returns true if the user is successfully unfollowed.
  /// The [username] parameter is the username of the user to unfollow.
  Future<bool?> unfollowUser({
    required String username,
  });

  /// Mutes a user.
  ///
  /// Returns true if the user is successfully muted.
  /// The [username] parameter is the username of the user to mute.
  Future<bool?> muteUser({
    required String username,
  });

  /// Unmutes a user.
  ///
  /// Returns true if the user is successfully unmuted.
  /// The [username] parameter is the username of the user to unmute.
  Future<bool?> unmuteUser({
    required String username,
  });

  /// Blocks a user.
  ///
  /// Returns true if the user is successfully blocked.
  /// The [username] parameter is the username of the user to block.
  Future<bool?> blockUser({
    required String username,
  });

  /// Unblocks a user.
  ///
  /// Returns true if the user is successfully unblocked.
  /// The [username] parameter is the username of the user to unblock.
  Future<bool?> unblockUser({
    required String username,
  });

  /// Fetches the followers data for a given username.
  ///
  /// Returns the [FollowersList] containing the followers data if the request is successful.
  Future<FollowersList> fetchFollowersData({required String username});

  /// Fetches the followings data for a given username.
  ///
  /// Returns the [FollowingsList] containing the followings data if the request is successful.
  Future<FollowingsList> fetchFollowingsData({required String username});

  /// Fetches the repliers data for a given tweet ID.
  ///
  /// The [tweetId] parameter is the ID of the tweet.
  fetchRepliersData({required String tweetId});
}

/// Concrete implementation of the [ProfileRepository] interface.
///
/// This implementation uses the HttpClient.dio library for making HTTP requests.
class ProfileRepositoryImpl implements ProfileRepository {
  /// Fetches the user profile data for a given username.
  ///
  /// This function makes an HTTP GET request to retrieve the user profile data
  /// for the specified username. It expects the username as a required parameter.
  /// The function returns a [Future] that resolves to a [UserProfile] object.
  /// If the request is successful (status code 200 or 201), the function parses
  /// the response data and returns a [UserProfile] object. If the request fails,
  /// an exception is thrown with the error message from the response data.
  ///
  /// Example usage:
  /// ```dart
  /// var repository = ProfileRepository();
  /// var userProfile = await repository.fetchUserProfileData(username: 'john_doe');
  /// print('Username: ${userProfile.username}');
  /// ```
  @override
  Future<UserProfile> fetchUserProfileData({required String username}) async {
    try {
      var response =
          await HttpClient.dio.get(EndPoints.getUserProfile(username));

      if (response.statusCode == 200 || response.statusCode == 201) {
        var userProfile = UserProfile.fromJson(response.data["data"]["user"]);
        print("Username: ${userProfile.username}");

        return UserProfile.fromJson(response.data["data"]["user"]);
      } else {
        throw (response.data["message"]);
      }
    } catch (e) {
      rethrow;
    }
  }

  /// Retrieves the tweets of a user based on their username and page number.
  ///
  /// The [username] parameter specifies the username of the user whose tweets are to be retrieved.
  /// The [page] parameter specifies the page number of the tweets to be retrieved.
  ///
  /// Returns a [ProfileTweetsResponse] object containing the tweets of the user.
  ///
  /// Throws an exception if an error occurs during the API call.
  @override
  getUserTweets(String username, int page) async {
    try {
      var response =
          await HttpClient.dio.get(EndPoints.getUserTweets(username, page));

      if (response.statusCode == 200 || response.statusCode == 201) {
        return ProfileTweetsResponse.fromJson(response.data);
      }
      throw (response.data["message"]);
    } catch (e) {
      rethrow;
    }
  }

  /// Retrieves the liked tweets of a user.
  ///
  /// The [username] parameter specifies the username of the user whose liked tweets are to be retrieved.
  /// The [page] parameter specifies the page number of the liked tweets to be retrieved.
  ///
  /// Returns a [ProfileLikedTweetsResponse] object containing the liked tweets and the total count.
  /// If the request is successful, the liked tweets are returned in the [data] field of the response.
  /// If the request fails or there are no liked tweets, an empty list is returned in the [data] field and the [total] count is set to 0.
  ///
  /// Example usage:
  /// ```dart
  /// final repository = ProfileRepository();
  /// final response = await repository.getUserLikedTweets('john_doe', 1);
  ///
  /// if (response.total > 0) {
  ///   print('Liked tweets:');
  ///   for (var tweet in response.data) {
  ///     print('- ${tweet.text}');
  ///   }
  /// } else {
  ///   print('No liked tweets found.');
  /// }
  /// ```
  @override
  getUserLikedTweets(String username, int page) async {
    try {
      var response = await HttpClient.dio
          .get(EndPoints.getUserLikedTweets(username, page));
      if (response.statusCode == 200 || response.statusCode == 201) {
        return ProfileLikedTweetsResponse.fromJson(response.data);
      }
      return const ProfileLikedTweetsResponse(data: [], total: 0);
    } catch (e) {
      rethrow;
    }
  }

  /// Updates the user profile with the provided information.
  ///
  /// The [profilePhoto] parameter is the path to the profile photo file.
  /// The [bannerPhoto] parameter is the path to the banner photo file.
  /// The [name] parameter is the user's name.
  /// The [bio] parameter is the user's biography.
  /// The [website] parameter is the user's website URL.
  /// The [location] parameter is the user's location.
  /// The [birthDate] parameter is the user's birth date.
  /// The [removeBannerPhoto] parameter indicates whether to remove the banner photo.
  ///
  /// Returns the updated user profile if the update is successful, otherwise throws an error.
  @override
  Future<UserProfile?> updateProfile({
    String? profilePhoto,
    String? bannerPhoto,
    String? name,
    String? bio,
    String? website,
    String? location,
    String? birthDate,
    bool? removeBannerPhoto,
  }) async {
    try {
      FormData data = FormData.fromMap({
        "name": name,
      });

      if (birthDate != null && birthDate.isNotEmpty)
        data.fields.add(MapEntry("birthDate", birthDate ?? ""));
      if (bio != null && bio.isNotEmpty)
        data.fields.add(MapEntry("bio", bio ?? ""));
      if (location != null && location.isNotEmpty)
        data.fields.add(MapEntry("location", location ?? ""));
      if (website != null && website.isNotEmpty)
        data.fields.add(MapEntry("website", website));

      if (profilePhoto != null) {
        var file = await MultipartFile.fromFile(
          profilePhoto,
          filename: path.basename(profilePhoto),
        );
        data.files.add(MapEntry("profilePhoto", file));
      }

      if (bannerPhoto != null ||
          (removeBannerPhoto != null && removeBannerPhoto == true)) {
        MultipartFile? file;
        if (removeBannerPhoto != null && !removeBannerPhoto) {
          file = await MultipartFile.fromFile(
            bannerPhoto!,
            filename: path.basename(bannerPhoto),
          );
          data.files.add(MapEntry("bannerPhoto", file));
        }
        var isUpdated = "TRUE";
        data.fields.add(MapEntry("isUpdated", isUpdated));
      } else {
        var isUpdated = "FALSE";
        data.fields.add(MapEntry("isUpdated", isUpdated));
      }

      var response =
          await HttpClient.dio.patch(EndPoints.updateProfile, data: data);

      if (response.statusCode == 200 || response.statusCode == 201) {
        final userProfile = UserProfile.fromJson(response.data["data"]);

        return userProfile;
      }
      throw (response.data["message"]);
    } catch (e) {
      rethrow;
    }
  }

  /// Follows a user with the given username.
  ///
  /// Returns `true` if the user is successfully followed, otherwise returns `false`.
  /// Throws an exception with the error message if an error occurs.
  @override
  Future<bool?> followUser({required String username}) async {
    try {
      var response = await HttpClient.dio.post(EndPoints.followUser(username));
      if (response.statusCode == 200 || response.statusCode == 201) {
        return true;
      }
      throw (response.data["message"]);
    } catch (e) {
      rethrow;
    }
  }

  /// A repository class for managing profile-related data.
  /// Unfollows a user with the specified username.
  ///
  /// Returns `true` if the user was successfully unfollowed, otherwise returns `false`.
  /// Throws an exception with the error message if an error occurs.
  @override
  Future<bool?> unfollowUser({required String username}) async {
    try {
      var response =
          await HttpClient.dio.delete(EndPoints.unfollowUser(username));
      if (response.statusCode == 200 || response.statusCode == 201) {
        return true;
      }
      throw (response.data["message"]);
    } catch (e) {
      rethrow;
    }
  }

  /// Mutes a user with the given username.
  ///
  /// Returns `true` if the user was successfully muted, otherwise returns `false`.
  /// Throws an exception with the error message if an error occurs.
  @override
  Future<bool?> muteUser({required String username}) async {
    try {
      var response = await HttpClient.dio.post(EndPoints.muteUser(username));
      if (response.statusCode == 200 || response.statusCode == 201) {
        return true;
      }
      throw (response.data["message"]);
    } catch (e) {
      rethrow;
    }
  }

  /// Unmutes a user with the given [username].
  ///
  /// Returns a [Future] that completes with a [bool] value indicating whether the user was successfully unmuted or not.
  /// Throws an exception if an error occurs during the process.
  @override
  Future<bool?> unmuteUser({required String username}) async {
    try {
      var response =
          await HttpClient.dio.delete(EndPoints.unmuteUser(username));
      if (response.statusCode == 200 || response.statusCode == 201) {
        return true;
      }
      throw (response.data["message"]);
    } catch (e) {
      rethrow;
    }
  }

  /// Blocks a user with the given username.
  ///
  /// Returns `true` if the user is successfully blocked, otherwise returns `false`.
  ///
  /// Throws an exception if an error occurs during the blocking process.
  @override
  Future<bool?> blockUser({required String username}) async {
    try {
      var response = await HttpClient.dio.post(EndPoints.blockUser(username));
      if (response.statusCode == 200 || response.statusCode == 201) {
        return true;
      }
      throw (response.data["message"]);
    } catch (e) {
      rethrow;
    }
  }

  /// Unblocks a user with the given username.
  ///
  /// Returns `true` if the user is successfully unblocked, otherwise returns `false`.
  /// Throws an exception with the error message if an error occurs.
  @override
  Future<bool?> unblockUser({required String username}) async {
    try {
      var response =
          await HttpClient.dio.delete(EndPoints.unblockUser(username));
      if (response.statusCode == 200 || response.statusCode == 201) {
        return true;
      }
      throw (response.data["message"]);
    } catch (e) {
      rethrow;
    }
  }

  /// Fetches followers data for a given username.
  ///
  /// This function makes an HTTP GET request to retrieve the followers data
  /// for the specified username. It expects the username as a required parameter.
  /// The function returns a [Future] that resolves to a [FollowersList] object
  /// containing a list of [FollowerData] objects.
  ///
  /// Example usage:
  /// ```dart
  /// var repository = ProfileRepository();
  /// var followersList = await repository.fetchFollowersData(username: 'john_doe');
  /// print(followersList.data.length); // prints the number of followers
  /// ```
  @override
  Future<FollowersList> fetchFollowersData({required String username}) async {
    try {
      var response =
          await HttpClient.dio.get(EndPoints.getFollowersData(username));

      if (response.statusCode == 200 || response.statusCode == 201) {
        List<dynamic> usersData = response.data["data"]["users"];
        List<FollowerData> followers = usersData
            .map((userData) => FollowerData.fromJson(userData))
            .toList();

        return FollowersList(data: followers);
      }
      return const FollowersList(data: []);
    } catch (e) {
      rethrow;
    }
  }

  /// Fetches followings data for a given username.
  ///
  /// The [username] parameter specifies the username for which the followings data
  /// needs to be fetched.
  ///
  /// Returns a [Future] that completes with a [FollowingsList] object containing
  /// the followings data.
  ///
  /// Throws an exception if an error occurs during the API call.
  @override
  Future<FollowingsList> fetchFollowingsData({required String username}) async {
    try {
      var response =
          await HttpClient.dio.get(EndPoints.getFollowingData(username));

      if (response.statusCode == 200 || response.statusCode == 201) {
        List<dynamic> usersData = response.data["data"]["users"];
        List<FollowingData> followings = usersData
            .map((userData) => FollowingData.fromJson(userData))
            .toList();

        return FollowingsList(data: followings);
      }
      return const FollowingsList(data: []);
    } catch (e) {
      rethrow;
    }
  }

  /// Fetches the repliers data for a specific tweet.
  ///
  /// This function makes an HTTP GET request to retrieve the repliers data
  /// for a given tweet ID. It returns a [Future] that resolves to a [RepliersList]
  /// object containing the fetched data.
  ///
  /// The [tweetId] parameter is required and specifies the ID of the tweet
  /// for which the repliers data should be fetched.
  ///
  /// Example usage:
  /// ```dart
  /// final repository = ProfileRepository();
  /// final repliersData = await repository.fetchRepliersData(tweetId: '123456789');
  /// print(repliersData.data);
  /// ```
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

  /// Adds a new tweet with optional media and trends.
  ///
  /// The [tweetText] parameter specifies the text content of the tweet.
  /// The [media] parameter is a list of media files to be attached to the tweet.
  /// The [trends] parameter is a list of trends associated with the tweet.
  ///
  /// Returns a [Future] that completes with the created [Tweet] object.
  ///
  /// Example usage:
  /// ```dart
  /// Tweet newTweet = await profileRepository.addTweet(
  ///   tweetText: 'Hello, world!',
  ///   media: [file1, file2],
  ///   trends: ['technology', 'programming'],
  /// );
  /// print(newTweet.text); // Output: Hello, world!
  /// ```
  @override
  Future<Tweet> addTweet(
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
        return Tweet.fromJson(response.data["data"]);
      } else {
        throw (response.data["message"]);
      }
    } catch (e) {
      rethrow;
    }
  }
}

final profileRepositoryProvider = Provider<ProfileRepository>((ref) {
  return ProfileRepositoryImpl();
});
