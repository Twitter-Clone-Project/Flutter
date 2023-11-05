import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:x_clone/features/auth/ui/widgets/custom_button.dart';
import 'package:x_clone/features/auth/ui/widgets/custom_text.dart';

import '../../../app/routes.dart';
import '../../../theme/app_assets.dart';
import '../../../theme/app_colors.dart';

class IntroScreen extends ConsumerWidget {
  const IntroScreen({super.key});

  @override
  Widget build(BuildContext context,WidgetRef ref) {
    return  SafeArea(
      child: Scaffold(
        appBar: AppBar(
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
        body: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: MediaQuery.of(context).size.height*0.2,),
              const CustomText("See what's happening\nin the world right now.",textSize: CustomTextSize.large),
              SizedBox(height: MediaQuery.of(context).size.height*0.2,),
              SizedBox(
                  height: 55,
                  child: CustomButton(text: "Continue with Google", onPressed: (){},svgIcon: AppAssets.googleIcon,)),
              SizedBox(height: MediaQuery.of(context).size.height*0.02,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                Container(
                  height: 1,
                  width: MediaQuery.of(context).size.width*0.4,
                  color: AppColors.lightGray,
                ),
                const CustomText("  OR  "),
                Container(
                  height: 1,
                  width: MediaQuery.of(context).size.width*0.4,
                  color: AppColors.lightGray,
                ),
              ],),
              SizedBox(height: MediaQuery.of(context).size.height*0.02,),
              SizedBox(
                  height: 55,
                  child: CustomButton(text: "Login", onPressed: (){
                    Navigator.pushNamed(context, Routes.loginScreen);
                  },)),
              const Spacer(),
              Row(
                children: [
                  const CustomText("Don't have an account yet?",color: AppColors.lightGray,),
                  TextButton(onPressed: (){
                    Navigator.pushNamed(context, Routes.registerScreen);
                  }, child:const CustomText("SignUp",color: AppColors.primaryColor,),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}