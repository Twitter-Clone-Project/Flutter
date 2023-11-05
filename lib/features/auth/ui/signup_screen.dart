import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:x_clone/features/auth/ui/widgets/auth_field.dart';
import 'package:x_clone/features/auth/ui/widgets/custom_button.dart';
import 'package:x_clone/features/auth/ui/widgets/custom_text.dart';

import '../../../app/app_keys.dart';
import '../../../theme/app_assets.dart';
import '../../../theme/app_colors.dart';
import '../../../utils/utils.dart';
import '../data/providers/auth_provider.dart';

class RegisterScreen extends StatefulHookConsumerWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends ConsumerState<RegisterScreen> {


  @override
  Widget build(BuildContext context) {
    final auth = ref.watch(authNotifierProvider);
    ref.listen(authNotifierProvider.select((value) => value.errorMessage),
            (previous, nextErrorMessage) {
          if (nextErrorMessage != null && nextErrorMessage != '') {
            AppSnackbar.show(buildSnackBar(text: nextErrorMessage));
            Future.delayed(Duration(seconds: 3), () {
              ref.read(authNotifierProvider.notifier).resetErrorMessage();
            });
          }
        });
    return Scaffold(
        key: AppKeys.registerScaffoldKey,
      appBar: AppBar(
        leadingWidth: 80,
        leading: TextButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: CustomText(
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
          colorFilter:ColorFilter.mode(AppColors.whiteColor, BlendMode.srcIn),
        ),
        centerTitle: true,
        backgroundColor: AppColors.pureBlack,
      ),

      body: Form(
        key: AppKeys.registerFormKey,
        child:Padding(
          padding: const EdgeInsets.all(16.0),
          child:SingleChildScrollView(
              child:SizedBox(
                height: MediaQuery.of(context).size.height - MediaQuery.of(context).padding.top,
                child:Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const CustomText(
                      "Create your account",
                      textSize: CustomTextSize.large,
                    ),
                    SizedBox(height:0.075 * MediaQuery.of(context).size.height),
                    const AuthField(labelText: "Name",maxLength: 50),
                    SizedBox(height:0.025 * MediaQuery.of(context).size.height),
                    const AuthField(labelText: "Name",maxLength: 50),
                    SizedBox(height: 0.0025 * MediaQuery.of(context).size.height),
                    const AuthField(labelText: "Email"),
                    SizedBox(height: 0.025 * MediaQuery.of(context).size.height),
                    const AuthField(labelText: "Email"),
                    SizedBox(height: 0.055 * MediaQuery.of(context).size.height),
                    const AuthField(labelText: "Password"),
                    SizedBox(height: 0.049 * MediaQuery.of(context).size.height),
                    CustomButton(
                      onPressed:() {

                      } ,
                      text: 'Sign up',
                    ),
                    SizedBox(height: 0.029 * MediaQuery.of(context).size.height),
                    SizedBox(height: 0.009 * MediaQuery.of(context).size.height),
                    const CustomText("By signing up, you agree to our Terms, Privacy Policy, and Cookie Use.",
                      textSize: CustomTextSize.small,
                    )
                  ],
                ),
              )
          ),
        ),
      ),
    );
  }
}
