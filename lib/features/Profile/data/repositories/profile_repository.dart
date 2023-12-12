import 'package:x_clone/features/Profile/data/model/user_profile.dart';
import 'package:x_clone/web_services/web_services.dart';
import 'package:dio/dio.dart';
import 'package:path/path.dart' as path;
import 'package:flutter_riverpod/flutter_riverpod.dart';

abstract class ProfileRepository {
  Future<UserProfile?> fetchUserProfileData({required String username});

  getUserTweets(String username, int page);

  Future<UserProfile?> updateProfile({
    String? profilePhoto,
    String? bannerPhoto,
    String? name,
    String? bio,
    String? website,
    String? location,
    String? birthDate,
  });
  getUserLikedTweets(String username, int page);

  Future<bool?> followUser({
    required String username,
  });

  Future<bool?> unfollowUser({
    required String username,
  });

  Future<bool?> muteUser({
    required String username,
  });

  Future<bool?> unmuteUser({
    required String username,
  });

  Future<bool?> blockUser({
    required String username,
  });

  Future<bool?> unblockUser({
    required String username,
  });

  Future<FollowersList> fetchFollowersData({required String username});
}

class ProfileRepositoryImpl implements ProfileRepository {
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

  @override
  getUserTweets(String username, int page) async {
    try {
      var response =
          await HttpClient.dio.get(EndPoints.getUserTweets(username, page));

      if (response.statusCode == 200 || response.statusCode == 201) {
        return ProfileTweetsResponse.fromJson(response.data);
      }
      return const ProfileTweetsResponse(data: [], total: 0);
    } catch (e) {
      rethrow;
    }
  }

  @override
  getUserLikedTweets(String username, int page) async {
    try {
      var response = await HttpClient.dio.get(EndPoints.getUserLikedTweets(username, page));
      if (response.statusCode == 200 || response.statusCode == 201) {
        return ProfileTweetsResponse.fromJson(response.data);
      }
      return const ProfileTweetsResponse(data: [], total: 0);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<UserProfile?> updateProfile({
    String? profilePhoto,
    String? bannerPhoto,
    String? name,
    String? bio,
    String? website,
    String? location,
    String? birthDate,
  }) async {
    try {
      FormData data = FormData.fromMap({
        "name": name,
      });

      data.fields.add(MapEntry("birthDate", birthDate?? ""));
      data.fields.add(MapEntry("bio", bio?? ""));
      data.fields.add(MapEntry("location", location?? ""));
      data.fields.add(MapEntry("website", website?? ""));


      if (profilePhoto != null) {
        var file = await MultipartFile.fromFile(
          profilePhoto,
          filename: path.basename(profilePhoto),
        );
        data.files.add(MapEntry("profilePhoto", file));
      }

      if (bannerPhoto != null) {
        var file = await MultipartFile.fromFile(
          bannerPhoto,
          filename: path.basename(bannerPhoto),
        );
        var isUpdated = "TRUE";
        data.files.add(MapEntry("bannerPhoto", file));
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

  @override
  Future<bool?> unfollowUser({required String username}) async {
    try {
      var response = await HttpClient.dio.delete(EndPoints.unfollowUser(username));
      if (response.statusCode == 200 || response.statusCode == 201) {
        return true;
      }
      throw (response.data["message"]);
    } catch (e) {
      rethrow;
    }
  }

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

  @override
  Future<bool?> unmuteUser({required String username}) async {
    try {
      var response = await HttpClient.dio.delete(EndPoints.unmuteUser(username));
      if (response.statusCode == 200 || response.statusCode == 201) {
        return true;
      }
      throw (response.data["message"]);
    } catch (e) {
      rethrow;
    }
  }

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

  @override
  Future<bool?> unblockUser({required String username}) async {
    try {
      var response = await HttpClient.dio.delete(EndPoints.unblockUser(username));
      if (response.statusCode == 200 || response.statusCode == 201) {
        return true;
      }
      throw (response.data["message"]);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<FollowersList> fetchFollowersData({required String username}) async {
    try {
      var response = await HttpClient.dio.get(EndPoints.getFollowersData(username));

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

}

final profileRepositoryProvider = Provider<ProfileRepository>((ref) {
  return ProfileRepositoryImpl();
});
