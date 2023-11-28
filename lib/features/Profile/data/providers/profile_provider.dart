import 'package:flutter/material.dart';
import 'package:x_clone/features/Profile/data/model/user_profile.dart';
import 'package:x_clone/features/Profile/data/repositories/profile_repository.dart';
import 'package:x_clone/features/Profile/data/states/profile_state.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';

final userProfileProvider =
StateNotifierProvider<UserProfileNotifier, UserProfileState>((ref) {
  final repo = ref.watch(ProfileRepositoryProvider);
  return UserProfileNotifier(repo, null);
});

class UserProfileNotifier extends StateNotifier<UserProfileState> {
  final ProfileRepository _repo;

  UserProfileNotifier(this._repo, [UserProfileState? state])
      : super(state ?? const UserProfileState(isLoading: true)) {
    // Additional initialization if needed
  }

  Future<void> fetchUserProfile(String userId) async {
    try {
      state = state.copyWith(isLoading: true, error: null);
      final userProfile = await _repo.fetchUserProfileData(userId: userId);
      state = state.copyWith(isLoading: false, userProfile: userProfile);
    } catch (e) {
      state = state.copyWith(isLoading: false, error: e.toString());
    }
  }

  Future<void> updateUsername(String newUsername) async {
    try {
      state = state.copyWith(isLoading: true, error: null);
      final result = await _repo.updateUsername(newUsername: newUsername);
      if (result == true) {
        // Handle success if needed
      }
      state = state.copyWith(isLoading: false);
    } catch (e) {
      state = state.copyWith(isLoading: false, error: e.toString());
    }
  }

// Optional: Add methods for handling state modifications like resetErrorMessage
}
