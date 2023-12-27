import 'package:x_clone/features/Profile/ui/editprofile_screen.dart';
import 'package:x_clone/features/Profile/ui/followers_screen.dart';
import 'package:x_clone/features/Profile/ui/followings_screen.dart';
import 'package:x_clone/features/Profile/ui/full_screen_image.dart';
import 'package:x_clone/features/auth/ui/settings_ui/blocked_list.dart';
import 'package:x_clone/features/auth/ui/settings_ui/email_update_screen.dart';
import 'package:x_clone/features/auth/ui/settings_ui/muted_list.dart';
import 'package:x_clone/features/auth/ui/settings_ui/password_update_screen.dart';
import 'package:x_clone/features/auth/ui/settings_ui/settings_screen.dart';
import 'package:x_clone/features/auth/ui/settings_ui/username_update_screen.dart';
import 'package:x_clone/features/chat/data/model/chats_response.dart';
import 'package:x_clone/features/chat/ui/chat_screen.dart';
import 'package:x_clone/features/home/data/models/home_response.dart';
import 'package:flutter/material.dart';
import 'package:x_clone/features/home/ui/add_tweet_screen.dart';
import 'package:x_clone/features/search/ui/search_allresults_screen.dart';
import 'package:x_clone/features/search/ui/search_results_screen.dart';

import 'package:x_clone/features/tweet/ui/likers_screen.dart';
import 'package:x_clone/features/tweet/ui/retweeters_screen.dart';
import 'package:x_clone/features/tweet/ui/tweet_screen.dart';
import '../features/auth/ui/auth_screen.dart';
import '../features/auth/ui/forget_password_screen.dart';
import '../features/auth/ui/intro_screen.dart';
import '../features/auth/ui/login_screen.dart';
import '../features/auth/ui/reCAPTCHA.dart';
import '../features/auth/ui/reset_password.dart';
import '../features/auth/ui/settings_ui/change_email_otp_screen.dart';
import '../features/auth/ui/signup_screen.dart';
import '../features/auth/ui/verify_otp_screen.dart';
import '../features/chat/ui/chat_search_screen.dart';
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
  static const String settingsScreen = "/settingsScreen";
  static const String usernameScreen = "/usernameScreen";
  static const String emailScreen = "/emailScreen";
  static const String passwordScreen = "/passwordScreen";

  static const String mutersScreen = "/mutersScreen";
  static const String blockersScreen = "/blockersScreen";

  static const String chatScreen = "/chatScreen";
  static const String chatSearchScreen = "/chatSearchScreen";

  static const String followersScreen = "/followersScreen";
  static const String followingsScreen = "/followingsScreen";

  static const String searchResultsScreen = "/searchResultsScreen";
  static const String searchAllResultsScreen = "/searchAllResultsScreen";
  static const String changeEmailOtpScreen = "/changeEmailOtpScreen";

  /// Generates the appropriate route based on the provided [settings].
  ///
  /// The [settings] parameter contains the name of the route and optional arguments.
  /// The method uses a switch statement to match the route name and returns the corresponding [Route].
  /// If no matching route is found, a default route is returned with a centered text widget displaying an error message.
  ///
  /// Example usage:
  /// ```dart
  /// Route<dynamic> route = generateRoute(RouteSettings(name: 'homeScreen'));
  /// Navigator.push(context, route);
  /// ```
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
      case chatScreen:
        Conversation data = settings.arguments as Conversation;
        return MaterialPageRoute(
            builder: (_) => ChatScreen(
                  conversation: data,
                ));
        return MaterialPageRoute(
            builder: (_) => ChatScreen(
                  conversation: data,
                ));
      case chatSearchScreen:
        return MaterialPageRoute(builder: (_) => const ChatSearchScreen());
      case changeEmailOtpScreen:
        var data = settings.arguments as String;
        return MaterialPageRoute(
            builder: (_) => ChangeEmailOtpScreen(
                  email: data,
                ));
      case registerScreen:
        return MaterialPageRoute(builder: (_) => const RegisterScreen());
      case reCAPTCHAscreen:
        return MaterialPageRoute(builder: (_) => const reCAPTCHA());
      case settingsScreen:
        return MaterialPageRoute(builder: (_) => const SettingsScreen());
      case usernameScreen:
        return MaterialPageRoute(builder: (_) => const UsernameScreen());
      case emailScreen:
        return MaterialPageRoute(builder: (_) => const EmailScreen());
      case mutersScreen:
        return MaterialPageRoute(builder: (_) => const MutersScreen());
      case blockersScreen:
        return MaterialPageRoute(builder: (_) => const BlockersScreen());
      case passwordScreen:
        return MaterialPageRoute(builder: (_) => const PasswordScreen());
      case tweetScreen:
        var data = settings.arguments as Map;
        return MaterialPageRoute(
            builder: (_) => TweetScreen(
                  tweet: data["tweet"],
                  index: data["index"],
                  whom: data["whom"],
                ));
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
      case followersScreen:
        var data = settings.arguments as Map<String, String?>;
        return MaterialPageRoute(
            builder: (_) => FollowersScreen(
                  username: data["username"]!,
                ));
      case followingsScreen:
        var data = settings.arguments as Map<String, String?>;
        return MaterialPageRoute(
            builder: (_) => FollowingsScreen(
                  username: data["username"]!,
                ));
      case fullScreenImage:
        var data = settings.arguments as Map<String, String>; // Correct type
        return MaterialPageRoute(
            builder: (_) => FullScreenImage(
                  imageUrl: data["imageUrl"]!, // Accessing the correct key
                ));
      case editProfileScreen:
        return MaterialPageRoute(builder: (_) => const EditProfileScreen());
      case searchResultsScreen:
        var data = settings.arguments as String;
        return MaterialPageRoute(
            builder: (_) => SearchResultsScreen(
                  query: data,
                ));
      case searchAllResultsScreen:
        var data = settings.arguments as String;
        return MaterialPageRoute(
            builder: (_) => SearchAllResultsScreen(
                  query: data,
                ));
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
