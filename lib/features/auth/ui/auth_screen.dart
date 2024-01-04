import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../home/ui/navigation_screen.dart';
import '../data/providers/auth_provider.dart';
import 'intro_screen.dart';

/// A screen widget that displays the authentication flow.
///
/// The [AuthScreen] widget is responsible for rendering the appropriate screen based on the user's authentication status.
/// If the user is logged in and their account is confirmed, it navigates to the [NavigationScreen].
/// Otherwise, it displays the [IntroScreen] to guide the user through the authentication process.
class AuthScreen extends StatelessWidget {
  const AuthScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, ref, child) {
        return ref.watch(authNotifierProvider
                        .select((value) => value.isLogin)) ==
                    true &&
                ref.watch(authNotifierProvider
                        .select((value) => value.user?.isConfirmed)) ==
                    true
            ? const NavigationScreen()
            : const IntroScreen();
      },
    );
  }
}
