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
// login(){
//     // state = state.copyWith(
//     //   loading: true,
//     //   errorMessage: '',
//     // );
// }

  login({required String email,required String password}) async {
    try {
      state = state.copyWith(loginLoading: true, errorMessage: '');

      final user = await _repo.login(email: email, password: password);
      _onUserLoggedIn(user);

      state = state.copyWith(loginLoading: false, errorMessage: '');

      return true;
    } catch (e) {
      state = state.copyWith(errorMessage: e.toString(), loginLoading: false);
      return false;
    }
  }
  //
  register(
      {required String username,
        required String email,
        required String name,
        required String password,
        required String birthDate,
      }) async {
    try {
      state = state.copyWith(registerLoading: true, errorMessage: '');

      final user = await _repo.register(
        username: username,
        email: email,
        name: name,
        password: password,
        birthDate: birthDate,
          );
      _onUserLoggedIn(user);
      state = state.copyWith(registerLoading: false, errorMessage: '');

      return true;
    } catch (e) {
      state = state.copyWith(registerLoading: false, errorMessage: "");
      state = state.copyWith(errorMessage: e.toString());
      return false;
    }
  }
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
  void _onUserLoggedIn(User? user) {
    state = state.copyWith(
      googleLoading: false,
        registerLoading: false,
        loginLoading: false,
        user: user, errorMessage: '', isLogin: true);
  }

  getMobileNumber() {
    return _repo.getMobileNumber();
  }

  getToken() {
    return _repo.getToken();
  }

  confirmEmail({required String otp,required String email,required bool isSignup}) async {
    try {
      state = state.copyWith(otpLoading: true, errorMessage: '');

      final result =await _repo.confirmEmail(
        otp: otp,
          email: email
      );
      if(result ==true) {
        state = state.copyWith(otpLoading: false, errorMessage: '',
      user:isSignup? state.user!.copyWith(isConfirmed: true):state.user,
      );
      }

      return true;
    } catch (e) {
      state = state.copyWith(otpLoading: false, errorMessage: "");
      state = state.copyWith(errorMessage: e.toString());
      return false;
    }
  }


  resetPassword( {required String password,
    required String passwordConfirm,
    required String email,
  }) async {
    try {
      state = state.copyWith(resetPasswordLoading: true, );

      final result =await _repo.resetPassword(
        email: email, password: '', passwordConfirm: '',
      );
      if(result ==true) {
        state = state.copyWith(resetPasswordLoading: false,);
      }

      return true;
    } catch (e) {
      state = state.copyWith(resetPasswordLoading: false, errorMessage: "");
      state = state.copyWith(errorMessage: e.toString());
      return false;
    }
  }

  forgetPassword({required String email}) async {
    try {
      state = state.copyWith(forgetPasswordLoading: true, );

      final result =await _repo.forgetPassword(
        email: email,
      );
      if(result ==true) {
        state = state.copyWith(forgetPasswordLoading: false,);
      }

      return true;
    } catch (e) {
      state = state.copyWith(forgetPasswordLoading: false, errorMessage: "");
      state = state.copyWith(errorMessage: e.toString());
      return false;
    }
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
      registerLoading: false,
      loginLoading: false,
      googleLoading: false,
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

  // void resetErrorMessage() {
  //   state = state.copyWith(loading: false, errorMessage: "");
  // }

}

