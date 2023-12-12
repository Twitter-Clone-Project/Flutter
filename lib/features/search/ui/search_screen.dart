import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:x_clone/features/auth/ui/widgets/auth_field.dart';
import 'package:x_clone/features/auth/ui/widgets/custom_button.dart';

import '../../../app/routes.dart';

class SearchScreen extends StatefulHookConsumerWidget {
  const SearchScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _SearchScreenState();
}

class _SearchScreenState extends ConsumerState<SearchScreen> {
  TextEditingController _usernameController = TextEditingController();

  @override
  void initState() {
    Future.delayed(const Duration(seconds: 0), () {});

    super.initState();
  }

  void _goToProfile() {
    String username = _usernameController.text;
    if (username.isNotEmpty) {
      Navigator.pushNamed(context, Routes.profileScreen,
          arguments: username);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 12.0), // Adjust the value as needed
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Search Screen"),
                SizedBox(height: 20),
                AuthField(
                  labelText: "Username",
                  controller: _usernameController,
                ),
                SizedBox(height: 20),
                CustomButton(
                  text: "Go To Profile",
                  onPressed: _goToProfile,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
