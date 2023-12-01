import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:x_clone/features/auth/ui/widgets/auth_field.dart';
import 'package:x_clone/features/auth/ui/widgets/custom_button.dart';
import 'package:x_clone/features/auth/ui/widgets/custom_text.dart';


import '../../../app/app_keys.dart';
import '../../../app/routes.dart';
import '../../../theme/app_assets.dart';
import '../../../theme/app_colors.dart';
import '../../../utils/utils.dart';
import '../data/providers/auth_provider.dart';

class VerifyOtpScreen extends StatefulHookConsumerWidget{
 final bool isSignUp;
 final String email;
const VerifyOtpScreen({super.key,required this.isSignUp,required this.email});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => VerifyOtpScreenState();
}

class VerifyOtpScreenState extends ConsumerState<VerifyOtpScreen> {
  int _resendTimer = 120 ;// Set the initial timer duration in seconds
  late Timer _timer;
  final TextEditingController _otpController = TextEditingController();

  @override
  void initState() {
    super.initState();
    startResendTimer();
  }

  void startResendTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        if (_resendTimer > 0) {
          _resendTimer--;
        } else {
          _timer.cancel(); // Stop the timer when it reaches 0
        }
      });
    });
  }

  @override
  void dispose() {
    _timer.cancel(); // Cancel the timer when the widget is disposed
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    final auth = ref.watch(authNotifierProvider);
    ref.listen(authNotifierProvider.select((value) => value.errorMessage),
            (previous, nextErrorMessage) {
          if (nextErrorMessage != null && nextErrorMessage != '') {
            AppSnackbar.show(buildSnackBar(text: nextErrorMessage));
          }
        });
    return SafeArea(
      child: Scaffold(
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
          title:
          SvgPicture.asset(
            AppAssets.logo,
            height: 40,
            width: 40,
            colorFilter:const ColorFilter.mode(AppColors.whiteColor, BlendMode.srcIn),
          ),
          centerTitle: true,
          backgroundColor: AppColors.pureBlack,
        ),

        body:  Form(
          key: AppKeys.verifyOtpFormKey,
          child:Padding(
            padding: const EdgeInsets.all(16.0),
            child:SingleChildScrollView(
                child:SizedBox(
                  height: MediaQuery.of(context).size.height - MediaQuery.of(context).padding.top,
                  child:Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const CustomText(
                        "Check your email\nWe have sent you a otp code",
                        textSize: CustomTextSize.large,
                      ),
                      SizedBox(height:0.075 * MediaQuery.of(context).size.height),
                      AuthField(controller: _otpController,labelText: "OTP",maxLength: 8,
                        validator: (value){
                          if(value!.isEmpty){
                            return "OTP cannot be empty";
                          }
                          return null;
                        },
                      ),
                      Row(
                        children: [
                          const CustomText("Don't get OTP?",
                            textSize: CustomTextSize.small,
                          ),
                          TextButton(
                            onPressed: _resendTimer > 0
                                ? null // Disable the button when timer is active
                                : () {
                              ref.read(authNotifierProvider.notifier).resendOtp(email: widget.email).then((value) => AppSnackbar.show(buildSnackBar(text: value.toString(),backgroundColor: AppColors.primaryColor)));
                              setState(() {
                                _resendTimer = 120; // Reset the timer
                              });
                              startResendTimer(); // Start the timer
                            },
                            child: CustomText(
                              _resendTimer > 0
                                  ? '$_resendTimer second' // Display the remaining time
                                  : 'Resend!',
                              textSize: CustomTextSize.small,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height:0.015 * MediaQuery.of(context).size.height),
                      auth.otpLoading?
                      const SizedBox(
                        width: 55,
                        height: 55,
                        child: CircularProgressIndicator(
                          color: AppColors.whiteColor,
                          strokeWidth: 1,
                        ),
                      )
                          :SizedBox(
                        height: 55,
                        child:
                        CustomButton(
                          onPressed:()  async {
                            if (auth.registerLoading) return;
                            if (AppKeys.verifyOtpFormKey.currentState!
                                .validate()) {
                              final result = await ref
                                  .read(authNotifierProvider.notifier)
                                  .confirmEmail(
                                isSignup: widget.isSignUp,
                                  otp: _otpController.text,
                                email: widget.email
                                );

                              if (result) {
                                if(widget.isSignUp)
                                  Navigator.pushNamedAndRemoveUntil(context, Routes.initRoute, (route) => false);
                                else
                                  Navigator.pushNamed(context, Routes.resetPasswordScreen,arguments: widget.email);
                              }
                            }
                          },
                          text: 'Verify Otp',
                        ),
                      ),
                      SizedBox(height: 0.029 * MediaQuery.of(context).size.height),

                    ],
                  ),
                )
            ),
          ),
        ),
      ),
    );
  }

}


