import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:x_clone/app/app_keys.dart';
import 'package:x_clone/features/auth/data/providers/auth_provider.dart';
import 'package:x_clone/theme/app_colors.dart';
import 'package:x_clone/theme/app_text_style.dart';

class UsernameScreen extends StatefulHookConsumerWidget {
  const UsernameScreen({super.key});
  @override
  ConsumerState<UsernameScreen> createState() => _UsernameScreenState();
}

class _UsernameScreenState extends ConsumerState<UsernameScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _userNameController = TextEditingController(
        text: ref.read(authNotifierProvider).user!.username ?? "");
    _userNameeController = TextEditingController(
        text: ref.read(authNotifierProvider).user!.username ?? "");
    Future.delayed(const Duration(seconds: 0), () {});
  }

  late TextEditingController _userNameController;
  late TextEditingController _userNameeController;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 65,
        backgroundColor: AppColors.pureBlack,
        title: const Text(
          'Change username',
          style: TextStyle(
            color: AppColors.whiteColor,
            fontSize: 22,
            fontFamily: 'Chirp',
          ),
        ),
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_sharp,
            color: AppColors.whiteColor,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        bottom: const PreferredSize(
          preferredSize: Size.fromHeight(1.0),
          child: Divider(color: AppColors.whiteColor, thickness: 0.1),
        ),
      ),
      body: Column(
        children: [
          Form(
            key: AppKeys.updateUserNameFormKey,
            child: Expanded(
              child: Column(
                children: [
                  ListTile(
                    contentPadding:
                        const EdgeInsets.symmetric(vertical: 0, horizontal: 16),
                    title: Text(
                      "Current",
                      style: AppTextStyle.textThemeDark.bodyLarge!
                          .copyWith(color: AppColors.lightThinTextGray),
                    ),
                    subtitle: TextFormField(
                      enabled: false,
                      controller: _userNameeController,
                      validator: (value) {
                        if (value != null) return null;
                        if (value!.isEmpty) {
                          return null;
                        }
                        return null;
                      },
                    ),
                  ),
                  ListTile(
                    contentPadding:
                        const EdgeInsets.symmetric(vertical: 0, horizontal: 16),
                    title: Text(
                      "New",
                      style: AppTextStyle.textThemeDark.bodyLarge!
                          .copyWith(color: AppColors.lightThinTextGray),
                    ),
                    subtitle: TextFormField(
                      controller: _userNameController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter a value';
                        } else if (value.length < 4) {
                          return 'Should be more than 4 characters';
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                        errorStyle:
                            TextStyle(color: Colors.red), // Error text color
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Divider(thickness: 0.5, color: AppColors.lightThinTextGray),
          Padding(
            padding: const EdgeInsets.all(5.0),
            child: Row(
              children: [
                Spacer(),
                TextButton(
                  onPressed: () {
                    if (AppKeys.updateUserNameFormKey.currentState!
                        .validate()) {
                      var result = ref
                          .read(authNotifierProvider.notifier)
                          .updateUsername(
                              newUsername: _userNameController.text);
                    }
                    Navigator.of(context).pop();
                  },
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(
                        AppColors.primaryColor),
                    foregroundColor:
                        MaterialStateProperty.all<Color>(AppColors.whiteColor),
                  ),
                  child: Text(
                    'Done',
                    style: AppTextStyle.textThemeDark.bodyMedium,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
