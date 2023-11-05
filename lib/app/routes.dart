import 'package:x_clone/features/home/data/models/home_response.dart';
import 'package:flutter/material.dart';
import '../features/auth/ui/auth_screen.dart';
import '../features/auth/ui/forget_password_screen.dart';
import '../features/auth/ui/intro_screen.dart';
import '../features/auth/ui/login_screen.dart';
import '../features/auth/ui/signup_screen.dart';
import '../features/auth/ui/verify_otp_screen.dart';
import '../features/home/ui/home_screen.dart';
import '../features/home/ui/navigation_screen.dart';



class Routes {
  static const String initRoute = "/";
  static const String introScreen = "/intro";
  static const String loginScreen = "/login";
  static const String registerScreen = "/register";
  static const String homeScreen = "/home";
  static const String navigationScreen = "/navigation";
  static const String forgetPasswordScreen = "/forget_password";


  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case initRoute:
        return MaterialPageRoute(builder: (_) => const AuthScreen());
        case introScreen:
        return MaterialPageRoute(builder: (_) => const IntroScreen());
      case homeScreen:
        return MaterialPageRoute(builder: (_) => const HomeScreen());
      case loginScreen:
        return MaterialPageRoute(builder: (_) => const LoginScreen());
      case registerScreen:
        return MaterialPageRoute(builder: (_) => const RegisterScreen());
      case navigationScreen:
        return MaterialPageRoute(builder: (_) => const NavigationScreen());
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