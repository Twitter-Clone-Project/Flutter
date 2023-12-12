import 'package:x_clone/features/Profile/ui/editprofile_screen.dart';
import 'package:x_clone/features/Profile/ui/full_screen_image.dart';
import 'package:x_clone/features/home/data/models/home_response.dart';
import 'package:flutter/material.dart';
import 'package:x_clone/features/home/ui/add_tweet_screen.dart';

import 'package:x_clone/features/tweet/ui/likers_screen.dart';
import 'package:x_clone/features/tweet/ui/retweeters_screen.dart';
import 'package:x_clone/features/tweet/ui/tweet_screen.dart';
import '../features/auth/ui/auth_screen.dart';
import '../features/auth/ui/forget_password_screen.dart';
import '../features/auth/ui/intro_screen.dart';
import '../features/auth/ui/login_screen.dart';
import '../features/auth/ui/reCAPTCHA.dart';
import '../features/auth/ui/reset_password.dart';
import '../features/auth/ui/signup_screen.dart';
import '../features/auth/ui/verify_otp_screen.dart';
import '../features/home/ui/home_screen.dart';
import '../features/home/ui/navigation_screen.dart';
import '../features/Profile/ui/profile_screen.dart';

class Routes {
  static const String initRoute = "/";
  static const String introScreen = "/intro";
  static const String loginScreen = "/login";
  static const String registerScreen = "/register";
  static const String homeScreen = "/home";
  static const String navigationScreen = "/navigation";
  static const String forgetPasswordScreen = "/forget_password";
  static const String verifyOtpScreen = "/verifyOtp";
  static const String resetPasswordScreen = "/resetPassword";
  static const String addTweet = "/addTweet";
  static const String profileScreen = "/profileScreen";
  static const String editProfileScreen = "/editProfileScreen";
  static const String fullScreenImage = "/fullScreenImage";


  static const String reCAPTCHAscreen = "/reCAPTCHA";
  static const String tweetScreen = "/tweetScreen";
  static const String retweetersScreen = "/retweetersScreen";
  static const String likersScreen = "/likersScreen";


  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case initRoute:
        return MaterialPageRoute(builder: (_) => const AuthScreen());
      case introScreen:
        return MaterialPageRoute(builder: (_) => const IntroScreen());
      case addTweet:
        return MaterialPageRoute(builder: (_) => const AddTweetScreen());
      case homeScreen:
        return MaterialPageRoute(builder: (_) => const HomeScreen());
      case loginScreen:
        return MaterialPageRoute(builder: (_) => const LoginScreen());
      case forgetPasswordScreen:
        return MaterialPageRoute(builder: (_) => const ForgetPasswordScreen());
      case registerScreen:
        return MaterialPageRoute(builder: (_) => const RegisterScreen());
      case reCAPTCHAscreen:
        return MaterialPageRoute(builder: (_) => const reCAPTCHA());
      case tweetScreen:
        var data = settings.arguments as Map;
        return MaterialPageRoute(
            builder: (_) =>
                TweetScreen(tweet: data["tweet"], index: data["index"]));
      case retweetersScreen:
        var data = settings.arguments as String;
        return MaterialPageRoute(
            builder: (_) => RetweetersScreen(
                  tweetId: data,
                ));
      case likersScreen:
        var data = settings.arguments as String;
        return MaterialPageRoute(
            builder: (_) => LikersScreen(
                  tweetId: data,
                ));
      case resetPasswordScreen:
        var data = settings.arguments as String;
        return MaterialPageRoute(
            builder: (_) => ResetPasswordScreen(
                  email: data,
                ));
      case navigationScreen:
        return MaterialPageRoute(builder: (_) => const NavigationScreen());
      case verifyOtpScreen:
        var data = settings.arguments as Map;
        return MaterialPageRoute(
            builder: (_) => VerifyOtpScreen(
                  isSignUp: data["isSignUp"],
                  email: data["email"],
                ));
      case profileScreen:
        var data = settings.arguments as String;
        return MaterialPageRoute(
            builder: (_) => ProfileScreen(
              username: data,
            ));
      case fullScreenImage:
        var data = settings.arguments as Map<String, String>; // Correct type
        return MaterialPageRoute(
            builder: (_) => FullScreenImage(
              imageUrl: data["imageUrl"]!, // Accessing the correct key
            ));

      case editProfileScreen:
        return MaterialPageRoute(builder: (_) => const EditProfileScreen());
      default:
        return MaterialPageRoute(
            builder: (_) => Scaffold(
                  body: Center(
                    child: Text('No route defined for ${settings.name}'),
                  ),
                ));
    }
  }

  static Widget buildPage(RouteSettings settings) {
    switch (settings.name) {
      default:
        return const SizedBox.shrink();
    }
  }
}
