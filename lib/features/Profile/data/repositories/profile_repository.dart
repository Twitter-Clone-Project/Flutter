import 'package:x_clone/features/Profile/data/model/user_profile.dart';
import 'package:x_clone/web_services/web_services.dart';
import 'package:dio/dio.dart';
import 'package:path/path.dart' as path;
import 'package:flutter_riverpod/flutter_riverpod.dart';

abstract class ProfileRepository {
  Future<UserProfile?> fetchUserProfileData({required String username});

  getUserTweets(String userId, int page);

  Future<UserProfile?> updateProfile({
    String? profilePhoto,
    String? bannerPhoto,
    String? name,
    String? bio,
    String? website,
    String? location,
    String? birthDate,
  });
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
  getUserTweets(String userId, int page) async {
    try {
      var response =
          await HttpClient.dio.get(EndPoints.getUserTweets(userId, page));

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
        "bio": bio,
        "website": website,
        "location": location,
      });

      if (birthDate != null) {
        data.fields.add(MapEntry("birthDate", birthDate));
      }
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
      }

      var response =
          await HttpClient.dio.patch(EndPoints.updateProfile, data: data);

      if (response.statusCode == 200 || response.statusCode == 201) {
        return UserProfile.fromJson(response.data["data"]);
      }
      throw (response.data["message"]);
    } catch (e) {
      rethrow;
    }
  }
  //
  // @override
  // Future<bool?> updateUsername({required String newUsername}) async {
  //   try {
  //     final data = {
  //       "username": newUsername,
  //     };
  //     var response = await HttpClient.dio.patch(
  //       EndPoints.updateUsername,
  //       data: data,
  //     );
  //
  //     if (response.statusCode == 200) {
  //       return true;
  //     } else {
  //       throw (response.data["message"]);
  //     }
  //   } catch (e) {
  //     throw e.toString();
  //   }
  // }
  //
  // @override
  // Future<bool?> updateEmail({required String newEmail}) async {
  //   try {
  //     final data = {
  //       "email": newEmail,
  //     };
  //     var response = await HttpClient.dio.patch(
  //       EndPoints.updateEmail,
  //       data: data,
  //     );
  //
  //     if (response.statusCode == 200) {
  //       return true;
  //     } else {
  //       throw (response.data["message"]);
  //     }
  //   } catch (e) {
  //     throw e.toString();
  //   }
  // }
}

final profileRepositoryProvider = Provider<ProfileRepository>((ref) {
  return ProfileRepositoryImpl();
});
