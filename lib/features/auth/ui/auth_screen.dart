import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../home/ui/navigation_screen.dart';
import '../data/providers/auth_provider.dart';
import 'intro_screen.dart';


class AuthScreen extends StatelessWidget {
  const AuthScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (context, ref, child) {
      return ref
          .watch(authNotifierProvider.select((value) => value.isLogin))==false?const NavigationScreen():const IntroScreen();
    });
  }
}