import 'package:flutter/material.dart';
import 'package:x_clone/features/auth/widgets/custom_button.dart';
import 'package:x_clone/theme/app_theme.dart';
import 'package:x_clone/theme/palette.dart';
import 'features/auth/widgets/auth_field.dart';
import 'features/auth/widgets/custom_text.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'X-Clone ',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Palette.blueColor),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'X-Clone Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            /** ### MOU ###
             * CustomText with Large title size and black color
             */
            Container(
              alignment: Alignment.centerLeft, // Align content to the left
              margin: EdgeInsets.only(left: 20, right: 20),
              // Specify left and right margins
              child: const CustomText(
                "Need another\naccount?",
                textSize: CustomTextSize.large,
                color: Colors.black,
              ),
            ),
            /** ### MOU ###
             * CustomText with Medium size and grey color
             */
            Container(
              margin: const EdgeInsets.only(left: 20, right: 20),
              // Specify left and right margins
              child: const CustomText(
                "Whether you need another account for work or just don't want your mom seeing your spicy takes, we got you. ",
                textSize: CustomTextSize.medium,
                color: Colors.black45,
              ),
            ),
            /** ### MOU ###
             * Test AuthField if you passed an error message to it
             */
            Container(
              margin: const EdgeInsets.only(left: 20, right: 20,top: 16),
              child: const AuthField(errorText: "error message", labelText: "Email"),
            ),
            /** ### MOU ###
             * Test AuthField without passing an error message
             */
            Container(
              margin: const EdgeInsets.only(left: 20, right: 20,top: 16),
              child: const AuthField(errorText: null, labelText: "Password"),
            ),
            /** ### MOU ###
             * CustomText with small size and grey color
             */
            Container(
              margin: const EdgeInsets.only(left: 20, right: 20,top: 16),
              // Specify left and right margins
              child: const CustomText(
                "By signing up, you agree to our Terms, Privacy Policy, and Cookie Use.",
                textSize: CustomTextSize.small,
                color: Colors.black45,
              ),
            ),
            /** ### MOU ###
             * Filled button without an image
             */
            Container(
              margin: const EdgeInsets.only(left: 20, right: 20,top: 16),
              child: CustomButton(
                onPressed: () => (),
                text: "Create account",
                filled: true,
              ),
            ),
            /** ### MOU ###
             * Outlined button with an image
             */
            Container(
              margin: const EdgeInsets.only(left: 20, right: 20,top: 16),
              child: CustomButton(
                onPressed: () => (),
                text: "Continue with Google",
                filled: false,
                imageAsset: 'assets/images/google_logo.png',
              ),
            ),
            const Row(
                children: <Widget>[
                  Expanded(
                      child: Divider()
                  ),

                  Text("OR"),

                  Expanded(
                      child: Divider()
                  ),
                ]
            )
          ],
        ),
      ),
    );
  }
}