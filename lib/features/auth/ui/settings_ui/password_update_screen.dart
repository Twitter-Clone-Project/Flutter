import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:x_clone/app/app_keys.dart';
import 'package:x_clone/app/routes.dart';
import 'package:x_clone/features/auth/data/providers/auth_provider.dart';
import 'package:x_clone/features/auth/ui/widgets/custom_button.dart';
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
                    obscureText: true,
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
              SizedBox(height: 16),
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
                    obscureText: true,
                    // Set this to true to hide the entered text
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
              SizedBox(height: 16),
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
                    obscureText: true,
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
              SizedBox(height: 16),
            ],
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 16.0),
            child: CustomButton(
              horizontalPadding: 10,
              onPressed: () async {
                // Mark the function as async
                final currentPassword = _currentPasswordController.text;
                final newPassword = _newPasswordController.text;
                final confirmPassword = _confirmPasswordController.text;

                // Validate individual form fields
                if (AppKeys.currentPasswordFormKey.currentState!.validate() &&
                    AppKeys.newPasswordFormKey.currentState!.validate() &&
                    AppKeys.confirmPasswordFormKey.currentState!.validate()) {
                  // Additional checks
                  if (newPassword != confirmPassword) {
                    // Display an error if the "New password" and "Confirm password" do not match
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(
                            'New password and Confirm password must match.'),
                      ),
                    );
                    return;
                  }

                  // Perform the update password logic if all checks pass
                  final result = await ref
                      .read(authNotifierProvider.notifier)
                      .updatePassword(
                        currentPassword: currentPassword,
                        newPassword: newPassword,
                        newPasswordConfirm: confirmPassword,
                      );

                  if (result == true) {
                    Navigator.of(context).pop();
                    showFlushbar(
                      context,
                      result,
                      "Password updated successfully",
                      "Updating password failed, please try again",
                    );
                  } else {
                    showFlushbar(
                      context,
                      result,
                      "Password updated successfully",
                      "Updating password failed",
                    );
                  }
                }
              },
              text: "Update Password",
            ),
          ),
        ],
      ),
    );
  }

  void showFlushbar(
      BuildContext context, bool success, String successful, String failed) {
    Flushbar(
      message: success ? successful : failed,
      duration: const Duration(seconds: 3),
      backgroundColor: success ? AppColors.TwitterBlue : AppColors.warningColor,
    ).show(context);
  }
}
