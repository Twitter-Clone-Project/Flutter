import 'package:x_clone/features/Profile/data/model/user_profile.dart';
import 'package:x_clone/web_services/web_services.dart';
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

abstract class ProfileRepository {
  Future<UserProfile?> fetchUserProfileData({required String userId});

  Future<bool?> updateUsername({required String newUsername});

  Future<bool?> updateEmail({required String newEmail});

  Future<bool?> updateProfile(
      {required String name,
      required String bio,
      required String website,
      required String location});

// UserProfile? getUserData();
}

class ProfileRepositoryImpl implements ProfileRepository {
  @override
  Future<UserProfile?> fetchUserProfileData({required String userId}) async {
    try {
      var response =
          await HttpClient.dio.get(EndPoints.getUserProfileUrl(userId));
      
      if (response.statusCode == 200) {
        return userProfileFromJson(response.data);
      } else {
        throw (response.data["message"]);
      }
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<bool?> updateUsername({required String newUsername}) async {
    try {
      final data = {
        "username": newUsername,
      };
      var response = await HttpClient.dio.patch(
        EndPoints.updateUsername,
        data: data,
      );

      if (response.statusCode == 200) {
        return true;
      } else {
        throw (response.data["message"]);
      }
    } catch (e) {
      throw e.toString();
    }
  }

  @override
  Future<bool?> updateEmail({required String newEmail}) async {
    try {
      final data = {
        "email": newEmail,
      };
      var response = await HttpClient.dio.patch(
        EndPoints.updateEmail,
        data: data,
      );

      if (response.statusCode == 200) {
        return true;
      } else {
        throw (response.data["message"]);
      }
    } catch (e) {
      throw e.toString();
    }
  }

  @override
  Future<bool?> updateProfile(
      {required String name,
      required String bio,
      required String website,
      required String location}) async {
    try {
      final data = {
        "name": name,
        "bio": bio,
        "website": website,
        "location": location,
      };
      var response = await HttpClient.dio.patch(
        EndPoints.updateProfile,
        data: data,
      );

      if (response.statusCode == 200) {
        return true;
      } else {
        throw (response.data["message"]);
      }
    } catch (e) {
      throw e.toString();
    }
  }
}

final ProfileRepositoryProvider = Provider<ProfileRepository>((ref) {
  return ProfileRepositoryImpl();
});
