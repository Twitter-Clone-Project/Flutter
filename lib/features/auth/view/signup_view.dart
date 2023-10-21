import 'package:flutter/material.dart';

import '../widgets/custom_button.dart';
import '../widgets/custom_text.dart';
import 'package:x_clone/constants/assets_constants.dart';
class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  DateTime ?selectedDate ;

  Future<void> _selectDate(BuildContext context) async{
    final DateTime picked = (await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(1950),
        lastDate: DateTime.now()
    )
    )!;
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
      });
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const CustomText(
              "Create your account",
              textSize: CustomTextSize.large,
              color: Color.fromARGB(255, 0, 0, 0),
            ),
            TextField(
              controller: _nameController,
              decoration: const InputDecoration(
                labelText: 'Full Name',
              ),
            ),
            SizedBox(height: 0.025 * MediaQuery.of(context).size.height),
            TextField(
              controller: _emailController,
              decoration: const InputDecoration(
                labelText: 'Email',
              ),
            ),
            SizedBox(height: 0.025 * MediaQuery.of(context).size.height),
            TextField(
              controller: _passwordController,
              decoration: const InputDecoration(
                labelText: 'Password',
              ),
            ),
            SizedBox(height: 0.029 * MediaQuery.of(context).size.height),
            TextButton(
              onPressed: () {
                _selectDate(context); // Call the date picker when the button is pressed.
              },
              child: const Text("Select Date of Birth",
                style: TextStyle(fontSize: 16,color: Colors.black),
              ),
            ),
            SizedBox(height: 0.0029 * MediaQuery.of(context).size.height),
            CustomButton(
              onPressed:() {String name = _nameController.text;
              String email = _emailController.text;
              String password = _passwordController.text;
              String? dateOfBirth = selectedDate?.toLocal().toString();
              print('Signing up: Name: $name, Email: $email, Password: $password, Date of Birth: $dateOfBirth');// to be deleted
              } ,//<TODO> validate the name and the Email
              text: 'Sign up',
              //<TODO> send the verification code
            ),
            SizedBox(height: 0.0029 * MediaQuery.of(context).size.height),
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
            CustomButton(
              text: "Sign up with Google",
              onPressed: (){
                //<TODO> connect with the google account
              },
              filled: false,
              svgIcon: AssetsConstants.googleIcon,
            ),
            SizedBox(height: 0.0029 * MediaQuery.of(context).size.height),
            CustomButton(
              text: "Sign up with Facebook",
              onPressed: (){
                //<TODO> connect with the facebook account
              },
              filled: false,
              svgIcon: AssetsConstants.facebookIcon,
            ),
            SizedBox(height: 0.0029 * MediaQuery.of(context).size.height),
            CustomButton(
              text: "Sign up with Github",
              onPressed: (){
                //<TODO> connect with the github account
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
      ),
    );
  }
}

void main() {
  runApp(const MaterialApp(
    home: SignUp(),
  ));
}
