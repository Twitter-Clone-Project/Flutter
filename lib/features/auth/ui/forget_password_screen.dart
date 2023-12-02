import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:x_clone/features/auth/ui/widgets/auth_field.dart';
import 'package:x_clone/features/auth/ui/widgets/custom_button.dart';
import 'package:x_clone/features/auth/ui/widgets/custom_text.dart';

import '../../../app/app_keys.dart';
import '../../../app/routes.dart';
import '../../../app/widgets/text_field.dart';
import '../../../theme/app_assets.dart';
import '../../../theme/app_colors.dart';
import '../../../utils/utils.dart';
import '../data/providers/auth_provider.dart';

class ForgetPasswordScreen extends StatefulHookConsumerWidget {
  const ForgetPasswordScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<ForgetPasswordScreen> createState() =>
      _ForgetPasswordScreenState();
}

class _ForgetPasswordScreenState extends ConsumerState<ForgetPasswordScreen> {
  final TextEditingController _emailController = TextEditingController();

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
          colorFilter:
              const ColorFilter.mode(AppColors.whiteColor, BlendMode.srcIn),
        ),
        centerTitle: true,
        backgroundColor: AppColors.pureBlack,
      ),
      body: Form(
        key: AppKeys.forgetFormKey,
        child: SingleChildScrollView(
          child: SizedBox(
            height: MediaQuery.of(context).size.height - 120,
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
                    labelText: "Email address",
                    controller: _emailController,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Email cannot be empty";
                      }
                      if (!isEmailValid(value)) {
                        return "Email is not valid";
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
                  child: auth.forgetPasswordLoading
                      ? const CircularProgressIndicator(
                          color: AppColors.whiteColor,
                          strokeWidth: 1,
                        )
                      : SizedBox(
                          width: MediaQuery.of(context).size.width * 0.3,
                          child: CustomButton(
                              filled: true,
                              text: 'Next',
                              onPressed: () async {
                                if (AppKeys.forgetFormKey.currentState!
                                    .validate()) {
                                  final result = await ref
                                      .read(authNotifierProvider.notifier)
                                      .forgetPassword(
                                        email: _emailController.text,
                                      );

                                  if (result) {
                                    Navigator.pushNamed(
                                        context, Routes.verifyOtpScreen,
                                        arguments: {
                                          "email": _emailController.text,
                                          "isSignUp": false
                                        });
                                  }
                                }
                              }),
                        ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
