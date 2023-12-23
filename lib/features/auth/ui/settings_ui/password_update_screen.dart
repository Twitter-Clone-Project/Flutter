import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:x_clone/app/app_keys.dart';
import 'package:x_clone/app/routes.dart';
import 'package:x_clone/features/auth/data/providers/auth_provider.dart';
import 'package:x_clone/theme/app_colors.dart';
import 'package:x_clone/theme/app_text_style.dart';

class PasswordScreen extends StatefulHookConsumerWidget {
  const PasswordScreen({super.key});
  @override
  ConsumerState<PasswordScreen> createState() => _PasswordScreenState();
}

class _PasswordScreenState extends ConsumerState<PasswordScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(const Duration(seconds: 0), () {});
  }

  final TextEditingController _currentPasswordController =
      TextEditingController();
  final TextEditingController _newPasswordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 65,
        backgroundColor: AppColors.pureBlack,
        title: const Text(
          'Change password',
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
          Column(
            children: [
              Form(
                key: AppKeys.currentPasswordFormKey,
                child: ListTile(
                  contentPadding:
                      const EdgeInsets.symmetric(vertical: 0, horizontal: 16),
                  title: Text(
                    "Current password",
                    style: AppTextStyle.textThemeDark.bodyLarge!
                        .copyWith(color: AppColors.lightThinTextGray),
                  ),
                  subtitle: TextFormField(
                    controller: _currentPasswordController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter a value';
                      } else if (value.length < 4) {
                        return 'Should be more than 4 characters';
                      }
                      return null;
                    },
                    decoration: const InputDecoration(
                      errorStyle:
                          TextStyle(color: Colors.red), // Error text color
                    ),
                  ),
                ),
              ),
              Form(
                key: AppKeys.newPasswordFormKey,
                child: ListTile(
                  contentPadding:
                      const EdgeInsets.symmetric(vertical: 0, horizontal: 16),
                  title: Text(
                    "New password",
                    style: AppTextStyle.textThemeDark.bodyLarge!
                        .copyWith(color: AppColors.lightThinTextGray),
                  ),
                  subtitle: TextFormField(
                    controller: _newPasswordController,
                    // validator: (value) {
                    //   if (value == null || value.isEmpty) {
                    //     return 'Please enter a value';
                    //   } else if (value.length < 8) {
                    //     return 'Your password needs to be at least 8 characters. Please enter a longer one.';
                    //   }
                    //   return null;
                    // },
                    decoration: const InputDecoration(
                      errorStyle:
                          TextStyle(color: Colors.red), // Error text color
                    ),
                  ),
                ),
              ),
              Form(
                key: AppKeys.confirmPasswordFormKey,
                child: ListTile(
                  contentPadding:
                      const EdgeInsets.symmetric(vertical: 0, horizontal: 16),
                  title: Text(
                    "Confirm password",
                    style: AppTextStyle.textThemeDark.bodyLarge!
                        .copyWith(color: AppColors.lightThinTextGray),
                  ),
                  subtitle: TextFormField(
                    controller: _confirmPasswordController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter a value';
                      } else if (value.length < 8) {
                        return 'Your password needs to be at least 8 characters. Please enter a longer one.';
                      }
                      return null;
                    },
                    decoration: const InputDecoration(
                      errorStyle:
                          TextStyle(color: Colors.red), // Error text color
                    ),
                  ),
                ),
              ),
            ],
          ),
          TextButton(
            onPressed: () {
              if (AppKeys.newPasswordFormKey.currentState!.validate() &&
                  AppKeys.confirmPasswordFormKey.currentState!.validate()) {
                if (_newPasswordController.text ==
                    _confirmPasswordController.text) {
                  final result =
                      ref.read(authNotifierProvider.notifier).updatePassword(
                            currentPassword: _currentPasswordController.text,
                            newPassword: _newPasswordController.text,
                            newPasswordConfirm: _confirmPasswordController.text,
                          );
                  print("==========testProvider============");
                  print(result);
                  if (result == true) {
                    Navigator.of(context).pop();
                  }
                }
              }
            },
            style: ButtonStyle(
              backgroundColor:
                  MaterialStateProperty.all<Color>(AppColors.primaryColor),
              foregroundColor:
                  MaterialStateProperty.all<Color>(AppColors.whiteColor),
            ),
            child: Text(
              '  Update password  ',
              style: AppTextStyle.textThemeDark.bodyLarge!
                  .copyWith(fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }
}
