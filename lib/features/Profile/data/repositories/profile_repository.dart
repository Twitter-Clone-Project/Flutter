import 'package:x_clone/features/Profile/data/model/user_profile.dart';
import 'package:x_clone/web_services/web_services.dart';
import 'package:dio/dio.dart';
import 'package:path/path.dart' as path;
import 'package:flutter_riverpod/flutter_riverpod.dart';

abstract class ProfileRepository {
  Future<UserProfile?> fetchUserProfileData({required String username});

  // Future<bool?> updateUsername({required String newUsername});

  // Future<bool?> updateEmail({required String newEmail});

  Future<bool?> updateProfile(
      {String? profilePhoto,
        String? bannerPhoto,
        String? name,
        String? bio,
        String? website,
        String? location,
        String? birthDate,
      });
// UserProfile? getUserData();
}

class ProfileRepositoryImpl implements ProfileRepository {
  @override
  Future<UserProfile?> fetchUserProfileData({required String username}) async {
    try {
      var response =
      await HttpClient.dio.get(EndPoints.getUserProfile(username));

      if (response.statusCode == 200) {
        return UserProfile.fromJson(response.data);
      } else {
        throw (response.data["message"]);
      }
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<bool?> updateProfile({String? profilePhoto,
    String? bannerPhoto,
    String? name,
    String? bio,
    String? website,
    String? location,
    String? birthDate,
  }) async {
    try {
      FormData data = FormData.fromMap({
        "profilePhoto": await MultipartFile.fromFile(
          profilePhoto!, filename: path.basename(profilePhoto!),),
        "bannerPhoto": await MultipartFile.fromFile(
          bannerPhoto!, filename: path.basename(bannerPhoto!),),
        "name": name,
        "bio": bio,
        "website": website,
        "location": location,
        "birthDate": birthDate,
      });

      var response = await HttpClient.dio.post(
          EndPoints.updateProfile, data: data);
      if (response.statusCode == 200 || response.statusCode == 201) {
        return true;
      }
      throw(response.data["message"]);
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
  final ProfileRepositoryProvider = Provider<ProfileRepository>((ref) {
    return ProfileRepositoryImpl();
  });