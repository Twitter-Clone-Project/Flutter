import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:x_clone/features/auth/widgets/auth_field.dart';
import 'package:x_clone/features/auth/widgets/custom_button.dart';
import 'package:x_clone/features/auth/widgets/custom_text.dart';
import 'package:x_clone/theme/palette.dart';
import 'package:x_clone/constants/constants.dart';

// Define a `Login` widget, which is the login screen.
class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

// State class for the `Login` widget.
class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);

    final verticalPadding = mediaQuery.size.height * 0.05;
    final horizontalPadding = mediaQuery.size.width * 0.03;

    return Scaffold(
      // Create an AppBar at the top of the screen, with a Twitter logo
      appBar: AppBar(
        title:
            SvgPicture.asset(AssetsConstants.twitterLogo, color: Colors.white),
        centerTitle: true,
        backgroundColor: Colors.black,
      ),
      // The main body of the screen is organized as a column.
      body: Column(
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
                AuthField(labelText: "Email"), // Input field for email.
                SizedBox(height: 0.025 * MediaQuery.of(context).size.height),
                AuthField(labelText: "Password"), // Input field for password.
              ],
            ),
          ),
          // Action Buttons Section
          Column(
            children: [
              Divider(
                height: mediaQuery.size.height * 0.002,
                color: Palette.greyColor,
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
    );
  }
}

void main() {
  runApp(const MaterialApp(
    home: Login(),
  ));
}
