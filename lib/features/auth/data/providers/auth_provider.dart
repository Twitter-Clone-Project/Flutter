import 'package:x_clone/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../../../../app/app_keys.dart';
import '../../../../web_services/interceptors/main_interceptor.dart';
import '../model/user.dart';
import '../repositories/auth_repository.dart';
import '../states/auth_state.dart';

final authNotifierProvider =
    StateNotifierProvider<AuthStateNotifier, AuthState>((ref) {
  final repo = ref.watch(authRepositoryProvider);
  return AuthStateNotifier(repo, null);
});

class AuthStateNotifier extends StateNotifier<AuthState> {
  final AuthRepository _repo;

  AuthStateNotifier(this._repo,
      [AuthState? state])
      : super(state ?? const AuthState()) {
    checkAuthStatus();
    // onFcmTokenRefresh();
  }

  Future<void> checkAuthStatus() async {
    try {
      final User? user = _repo.getUserData();

      // if authenticated, update state accordingly
      if (user != null) {
        state = state.copyWith(
          user: user,
          isLogin: true,
        );
      } else if (getMobileNumber() != null) {
        state = state.copyWith(
        );
      } else {
        state = state.copyWith(
        );
      }
    } catch (_) {}
  }

  bool isUserLoggedIn() {
    return state.user != null;
  }
login(){
    state = state.copyWith(
      loading: true,
      errorMessage: '',
    );
}

  // login({required String phone}) async {
  //   // try {
  //     state = state.copyWith(loading: true, errorMessage: '');
  //
  //     final result = await _repo.login(phone: phone);
  //     state = state.copyWith(loading: false, errorMessage: '');
  //
  //     return result;
  //   // } catch (e) {
  //   //   state = state.copyWith(errorMessage: e.toString(), loading: false);
  //   //   return false;
  //   // }
  // }
  //
  // register(
  //     {required String username,
  //     required String email,required String mobile}) async {
  //   try {
  //     state = state.copyWith(loading: true, errorMessage: '');
  //
  //     final result = await _repo.register(
  //         username: username,
  //         email: email,
  //         mobile: mobile,
  //         );
  //     state = state.copyWith(loading: false, errorMessage: '');
  //
  //     return result;
  //   } catch (e) {
  //     state = state.copyWith(errorMessage: e.toString(), loading: false);
  //     return -1;
  //   }
  // }
  //
  // Future<bool>updateUser(
  //     {
  //       String? name,
  //       String? phone
  //     }) async {
  //   try {
  //     state = state.copyWith(loading: true, errorMessage: '');
  //
  //     final user = await _repo.updateUser(
  //       phone: phone,
  //       name: name,
  //     );
  //     _onUserLoggedIn(user);
  //     return true;
  //   } catch (e) {
  //     state = state.copyWith(errorMessage: e.toString(), loading: false);
  //     return false;
  //   }
  // }
  // void _onUserLoggedIn(User? user) {
  //   state = state.copyWith(
  //       loading: false, user: user, errorMessage: '', isLogin: true);
  // }

  getMobileNumber() {
    return _repo.getMobileNumber();
  }

  getToken() {
    return _repo.getToken();
  }


  Future<void> logout() async {
    // state = state.copyWith(
    //   loading: false,
    //   errorMessage: '',
    // );

    //we do not need to wait here
    _repo.deleteAuthStorage();
    _repo.deleteTokenCachedData();

    MainInterceptor.logout();

    state = state.copyWith(
      user: null,
      isLogin: false,
      loading: false,
    );
  }

  Future<void> onFcmTokenRefresh() async {
    try {
      // eventBus.on<UpdateFcmTokenEvent>().listen((event) {
      //   updateFcmToken(event.token);
      // });
    } catch (_) {}
  }

  Future<void> updateFcmToken(String? token) async {
    try {
      // final fcmToken = token ?? await _notificationsHandler.getFcmToken();

      // updateUserProfile(
      //     personalData: state.personalData.copyWith(deviceToken: fcmToken),
      //     isUpdatingFcmToken: true);
    } catch (_) {}
  }

  void resetErrorMessage() {
    state = state.copyWith(loading: false, errorMessage: "");
  }}

