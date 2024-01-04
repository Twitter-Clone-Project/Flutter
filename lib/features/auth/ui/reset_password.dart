import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:x_clone/app/app_keys.dart';
import 'package:x_clone/features/auth/ui/widgets/auth_field.dart';
import 'package:x_clone/features/auth/ui/widgets/custom_button.dart';
import 'package:x_clone/features/auth/ui/widgets/custom_text.dart';

import '../../../app/routes.dart';
import '../../../app/widgets/text_field.dart';
import '../../../theme/app_assets.dart';
import '../../../theme/app_colors.dart';
import '../../../utils/utils.dart';
import '../data/providers/auth_provider.dart';

/// A screen widget for resetting the password.
///
/// This widget allows the user to reset their password by providing a new password
/// and confirming it. It includes form validation for password length and matching
/// password confirmation. The widget also provides a cancel button to navigate back
/// to the previous screen and a done button to submit the new password.
///
/// Example usage:
/// ```dart
/// ResetPasswordScreen(
///   email: 'example@example.com',
/// )
/// ```
class ResetPasswordScreen extends StatefulHookConsumerWidget {
  final String email;
  const ResetPasswordScreen({Key? key,required this.email}) : super(key: key);

  @override
  ConsumerState<ResetPasswordScreen> createState() =>
      _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends ConsumerState<ResetPasswordScreen> {
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _passwordConfirmationController = TextEditingController();
  bool obscureTextNewPassword = true;
  bool obscureTextConfirmPassword = true;

  @override
  Widget build(BuildContext context) {
    final auth = ref.watch(authNotifierProvider);
    return Scaffold(
      appBar: AppBar(
        leadingWidth: 80,
        leading: TextButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: const CustomText(
            'Cancel',
            textSize: CustomTextSize.medium,
            color: AppColors.whiteColor,
          ),
        ),
        title: SvgPicture.asset(
          AppAssets.logo,
          height: 40,
          width: 40,
          colorFilter: const ColorFilter.mode(AppColors.whiteColor, BlendMode.srcIn),
        ),
        centerTitle: true,
        backgroundColor: AppColors.pureBlack,
      ),
      body: Form(
        key: AppKeys.resetFormKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: EdgeInsets.only(
                left: MediaQuery.of(context).size.width * 0.05,
                right: MediaQuery.of(context).size.width * 0.05,
                top: MediaQuery.of(context).size.height * 0.025,
                bottom: MediaQuery.of(context).size.height * 0.01,
              ),
              child: const CustomText(
                "Find your X account",
                textSize: CustomTextSize.large,
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.1,
            ),
            Container(
              margin: EdgeInsets.only(
                left: MediaQuery.of(context).size.width * 0.05,
                right: MediaQuery.of(context).size.width * 0.05,
              ),
              child: AuthField(
                labelText: "New Password",
                obscureText: obscureTextNewPassword,
                controller: _passwordController,
                suffixIcon: IconButton(
                  onPressed: () => setState(() {
                    obscureTextNewPassword = !obscureTextNewPassword;
                  }),
                  icon: Icon(
                    obscureTextNewPassword
                        ? Icons.visibility
                        : Icons.visibility_off,
                    color: AppColors.borderDarkGray,
                  ),
                ),
                validator: (value) {
                  if(value!.isEmpty){
                    return "Password cannot be empty";
                  }
                  if(value.length < 6){
                    return "Password length should be 6 or more";
                  }
                  return null;
                },
              ),
            ),
            SizedBox(height: 0.025 * MediaQuery.of(context).size.height),
            Container(
              margin: EdgeInsets.only(
                left: MediaQuery.of(context).size.width * 0.05,
                right: MediaQuery.of(context).size.width * 0.05,
              ),
              child: AuthField(
                controller: _passwordConfirmationController,
                obscureText: obscureTextConfirmPassword,
                suffixIcon: IconButton(
                  onPressed: () => setState(() {
                    obscureTextConfirmPassword = !obscureTextConfirmPassword;
                  }),

                  icon: Icon(
                    obscureTextConfirmPassword
                        ? Icons.visibility
                        : Icons.visibility_off,
                    color: AppColors.borderDarkGray,
                  ),
                ),
                labelText: "New Password Confirmation",
                validator: (value) {
                  if(value!.isEmpty){
                    return "Confirmation cannot be empty";
                  }
                  if(value != _passwordController.text){
                    print(value);
                    print(_passwordController.text);
                    return "Password and confirmation should be same";
                  }
                  return null;
                },
              ),
            ),
            const Spacer(),
            Container(
              alignment: Alignment.bottomRight,
              margin: EdgeInsets.only(
                left: MediaQuery.of(context).size.width * 0.05,
                right: MediaQuery.of(context).size.width * 0.05,
                bottom: MediaQuery.of(context).size.height * 0.02,
              ),
              child: SizedBox(
                width: MediaQuery.of(context).size.width * 0.3,
                child:auth.forgetPasswordLoading?
                const CircularProgressIndicator(
                  color: AppColors.whiteColor,
                  strokeWidth: 1,
                ):CustomButton(
                    filled: true,
                    text: 'Done',
                    onPressed: () async {
                      // Perform password reset logic here
                      if (AppKeys.resetFormKey.currentState!.validate()) {
                        final result = await ref.read(authNotifierProvider.notifier).resetPassword(
                          email: widget.email,
                          password: _passwordController.text,
                          passwordConfirm: _passwordConfirmationController.text,
                        );

                        if (result) {
                          Navigator.pushNamedAndRemoveUntil(context, Routes.initRoute, (route) => false);
                        }
                      }
                    }
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
