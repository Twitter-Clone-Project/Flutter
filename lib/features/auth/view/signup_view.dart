import 'package:flutter/material.dart';
import '../widgets/custom_button.dart';
import '../widgets/custom_text.dart';
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
                const CustomText(
                  "Create your account",
                  textSize: CustomTextSize.large,
                  color: Color.fromARGB(255, 0, 0, 0),
                ),
                SizedBox(height:0.075 * MediaQuery.of(context).size.height),
                const AuthField(labelText: "Name",maxLength: 50),
                SizedBox(height: 0.025 * MediaQuery.of(context).size.height),
                const AuthField(labelText: "Email"),
                SizedBox(height: 0.055 * MediaQuery.of(context).size.height),
                const AuthField(labelText: "Password"),

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
void main(){
  runApp(const MaterialApp(home: SignUp(),));
}

