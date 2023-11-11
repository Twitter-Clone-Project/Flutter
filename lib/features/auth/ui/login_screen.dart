import 'package:flutter_svg/svg.dart';
import 'package:x_clone/app/app_keys.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:x_clone/features/auth/ui/widgets/auth_field.dart';
import 'package:x_clone/features/auth/ui/widgets/custom_button.dart';
import 'package:x_clone/features/auth/ui/widgets/custom_text.dart';

import '../../../app/routes.dart';
import '../../../theme/app_assets.dart';
import '../../../theme/app_colors.dart';
import '../../../utils/utils.dart';
import '../data/providers/auth_provider.dart';

class LoginScreen extends StatefulHookConsumerWidget {
  const LoginScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _LoginScreenState();
}

class _LoginScreenState extends ConsumerState<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool obscureText = true;

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final verticalPadding = mediaQuery.size.height * 0.05;
    final horizontalPadding = mediaQuery.size.width * 0.03;
    final auth = ref.watch(authNotifierProvider);

    ref.listen(authNotifierProvider.select((value) => value.errorMessage),
        (previous, nextErrorMessage) {
      if (nextErrorMessage != null && nextErrorMessage != '') {
        AppSnackbar.show(buildSnackBar(text: nextErrorMessage));
      }
    });
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
        key: AppKeys.loginFormKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // User Credentials Section
            Padding(
              padding: EdgeInsets.symmetric(
                vertical: verticalPadding,
                horizontal: horizontalPadding,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // helper Text
                  const CustomText("Join the conversation!",
                      textSize: CustomTextSize.large),
                  SizedBox(height: 0.075 * MediaQuery.of(context).size.height),
                  AuthField(labelText: "Email",
                    controller:_emailController,
                    validator: (value){
                      if(value!.isEmpty){
                        return "Email cannot be empty";
                      }
                      if(isEmailValid(value) == false){
                        return "Email is not valid";
                      }
                      return null;
                    },
                  ), // Input field for email.
                  SizedBox(height: 0.025 * MediaQuery.of(context).size.height),
                  AuthField(
                      labelText: "Password",
                    controller:_passwordController,
                      obscureText: obscureText,
                      suffixIcon: IconButton(
                        onPressed: () => setState(() {
                          obscureText = !obscureText;
                        }),
                        icon: Icon(
                          obscureText
                              ? Icons.visibility
                              : Icons.visibility_off,
                          color: AppColors.borderDarkGray,
                        ),
                      ),
                      validator: (value){
                        if(value!.isEmpty){
                          return "Password cannot be empty";
                        }
                        if(value.length < 6){
                          return "Password length should be 6 or more";
                        }
                        return null;
                      }
                  ), // Input field for password.
                ],
              ),
            ),
            // Action Buttons Section
            Column(
              children: [
                Divider(
                  height: mediaQuery.size.height * 0.002,
                  color: AppColors.borderDarkGray,
                ),
                Padding(
                  padding: EdgeInsets.all(mediaQuery.size.width * 0.03),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // Button for "Forgot Password?" action.
                      CustomButton(
                        text: 'Forgot Password?',
                        onPressed: () {
                          Navigator.pushNamed(context, Routes.forgetPasswordScreen);
                        },
                        filled: false,
                      ),
                      // Button for the login action.
                      auth.loginLoading?
                      const CircularProgressIndicator(
                        color: AppColors.whiteColor,
                        strokeWidth: 1,
                      ):
                      CustomButton(
                        text: 'Login',
                        onPressed: () async {
                          if (auth.loginLoading) return;
                          if (AppKeys.loginFormKey.currentState!
                              .validate()) {
                            final result = await ref
                                .read(authNotifierProvider.notifier)
                                .login(
                                email: _emailController.text,
                                password: _passwordController.text,
                            );
                            if (result) {
                              Navigator.pushNamedAndRemoveUntil(context, Routes.initRoute, (route) => false);
                            }
                          }
                        },
                        filled: true,
                      ),
                    ],
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
