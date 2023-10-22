import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:x_clone/constants/assets_constants.dart';
import 'package:x_clone/features/auth/widgets/auth_field.dart';
import 'package:x_clone/features/auth/widgets/custom_button.dart';
import 'package:x_clone/features/auth/widgets/custom_text.dart';

class ForgotPassword extends StatelessWidget {
  const ForgotPassword({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            //OnPress-> return back
          },
          icon: const Icon(
            Icons.close,
          ),
        ),
        title: SizedBox(
          width: MediaQuery.of(context).size.width * 0.7,
          child: SvgPicture.asset(
            AssetsConstants.twitterLogo,
          ),
        ),
      ),
      body: Column(
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
              color: Colors.black,
            ),
          ),
          Container(
            margin: EdgeInsets.only(
              left: MediaQuery.of(context).size.width * 0.05,
              right: MediaQuery.of(context).size.width * 0.05,
              bottom: MediaQuery.of(context).size.height * 0.02,
            ),
            child: const CustomText(
              "Enter the email, phone number, or username associated with your account to change your password.",
              textSize: CustomTextSize.medium,
              color: Colors.black45,
            ),
          ),
          Container(
            margin: EdgeInsets.only(
              left: MediaQuery.of(context).size.width * 0.05,
              right: MediaQuery.of(context).size.width * 0.05,
            ),
            child: const AuthField(
              errorText: null,
              labelText: "Email address, phone number or username",
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
              child: CustomButton(
                filled: true,
                text: 'Next',
                onPressed: () {},
              ),
            ),
          ),
        ],
      ),
    );
  }
}
