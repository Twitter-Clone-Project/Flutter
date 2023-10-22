import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../widgets/custom_button.dart';
import '../widgets/custom_text.dart';
import 'package:x_clone/constants/assets_constants.dart';
import '../widgets/auth_field.dart';
class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  _SignUpState createState() => _SignUpState();
}
class _SignUpState extends State<SignUp> {
  // final TextEditingController _nameController = TextEditingController();
  // final TextEditingController _emailController = TextEditingController();
  // final TextEditingController _passwordController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child:SingleChildScrollView(
          child:SizedBox(
            height: MediaQuery.of(context).size.height - MediaQuery.of(context).padding.top,
            child:Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset(AssetsConstants.twitterLogo
                ),
                const CustomText(
                  "Create your account",
                  textSize: CustomTextSize.large,
                  color: Color.fromARGB(255, 0, 0, 0),
                ),
                SizedBox(height:0.025 * MediaQuery.of(context).size.height),
                const AuthField(labelText: "Full Name",maxLength: 50),
                SizedBox(height: 0.0025 * MediaQuery.of(context).size.height),
                const AuthField(labelText: "Email"),
                SizedBox(height: 0.025 * MediaQuery.of(context).size.height),
                const AuthField(labelText: "Password"),
                // SizedBox(height: 0.029 * MediaQuery.of(context).size.height),

                SizedBox(height: 0.049 * MediaQuery.of(context).size.height),
                CustomButton(
                  onPressed:() {
                    // String name = _nameController.text;
                    // String email = _emailController.text;
                    // String password = _passwordController.text;
                  } ,
                  text: 'Sign up',
                ),
                SizedBox(height: 0.029 * MediaQuery.of(context).size.height),
                const Row(
                    children: <Widget>[
                      Expanded(
                          child: Divider()
                      ),
                      Text("OR",style: TextStyle(fontSize: 20)),
                      Expanded(
                          child: Divider()
                      ),
                    ]
                ),
                SizedBox(height: 0.019 * MediaQuery.of(context).size.height),
                CustomButton(
                  text: "Sign up with Google",
                  onPressed: (){
                  },
                  filled: false,
                  svgIcon: AssetsConstants.googleIcon,
                ),
                SizedBox(height: 0.019 * MediaQuery.of(context).size.height),
                CustomButton(
                  text: "Sign up with Facebook",
                  onPressed: (){
                  },
                  filled: false,
                  svgIcon: AssetsConstants.facebookIcon,
                ),
                SizedBox(height: 0.019 * MediaQuery.of(context).size.height),
                CustomButton(
                  text: "Sign up with Github",
                  onPressed: (){
                  },
                  filled: false,
                  svgIcon: AssetsConstants.githubIcon,
                ),
                SizedBox(height: 0.009 * MediaQuery.of(context).size.height),
                const CustomText("By signing up, you agree to our Terms, Privacy Policy, and Cookie Use.",
                  textSize: CustomTextSize.small,
                  color: Colors.black45,
                )
              ],
            ),
          )
      ),
      )
    );
  }
}

