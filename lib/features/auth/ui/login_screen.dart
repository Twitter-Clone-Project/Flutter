import 'package:flutter_svg/svg.dart';
import 'package:x_clone/app/app_keys.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:x_clone/features/auth/ui/widgets/auth_field.dart';
import 'package:x_clone/features/auth/ui/widgets/custom_button.dart';
import 'package:x_clone/features/auth/ui/widgets/custom_text.dart';

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
  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);

    final verticalPadding = mediaQuery.size.height * 0.05;
    final horizontalPadding = mediaQuery.size.width * 0.03;

    ref.listen(authNotifierProvider.select((value) => value.errorMessage),
        (previous, nextErrorMessage) {
      if (nextErrorMessage != null && nextErrorMessage != '') {
        AppSnackbar.show(buildSnackBar(text: nextErrorMessage));
        Future.delayed(const Duration(seconds: 3), () {
          ref.read(authNotifierProvider.notifier).resetErrorMessage();
        });
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
                  const AuthField(labelText: "Email"), // Input field for email.
                  SizedBox(height: 0.025 * MediaQuery.of(context).size.height),
                  const AuthField(
                      labelText: "Password"), // Input field for password.
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
                        onPressed: () {},
                        filled: false,
                      ),
                      // Button for the login action.
                      CustomButton(
                        text: 'Login',
                        onPressed: () {},
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
