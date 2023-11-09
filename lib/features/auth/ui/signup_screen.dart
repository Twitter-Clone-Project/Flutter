import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:x_clone/features/auth/ui/widgets/auth_field.dart';
import 'package:x_clone/features/auth/ui/widgets/custom_button.dart';
import 'package:x_clone/features/auth/ui/widgets/custom_text.dart';

import '../../../app/app_keys.dart';
import '../../../app/routes.dart';
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
  DateTime? selectedDate;
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _userNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _dateOfBirthController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final auth = ref.watch(authNotifierProvider);
    ref.listen(authNotifierProvider.select((value) => value.errorMessage),
            (previous, nextErrorMessage) {
          if (nextErrorMessage != null && nextErrorMessage != '') {
            AppSnackbar.show(buildSnackBar(text: nextErrorMessage));
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
                    AuthField(controller: _nameController,labelText: "Name",maxLength: 50,
                    validator: (value){
                      if(value!.isEmpty){
                        return "Name cannot be empty";
                      }
                      return null;
                    },
                    ),
                    SizedBox(height:0.015 * MediaQuery.of(context).size.height),
                    AuthField(controller:_userNameController,labelText: "Username",maxLength: 50,
                      validator: (value){
                        if(value!.isEmpty){
                          return "Username cannot be empty";
                        }
                        if(isValidUsername(value) == false){
                          return "Username should be alphanumeric";
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 0.015 * MediaQuery.of(context).size.height),
                    AuthField(
                      controller:_emailController,labelText: "Email",
                      validator: (value){
                        if(value!.isEmpty){
                          return "Email cannot be empty";
                        }
                        if(isEmailValid(value) == false){
                          return "Email is not valid";
                        }
                        return null;
                      },

                    ),
                    SizedBox(height: 0.025 * MediaQuery.of(context).size.height),
                    GestureDetector(
                      onTap: () => _selectDate(context),
                      child: AbsorbPointer(
                        child: AuthField(controller:_dateOfBirthController,labelText: "Date of birth",
                          validator: (value){
                            if(value!.isEmpty){
                              return "Date of birth cannot be empty";
                            }
                            return null;
                          },

                        ),
                      ),
                    ),
                    SizedBox(height: 0.025 * MediaQuery.of(context).size.height),
                    AuthField(controller:_passwordController,labelText: "Password",
                    validator: (value){
                      if(value!.isEmpty){
                        return "Password cannot be empty";
                      }
                      if(value.length < 6){
                        return "Password length should be 6 or more";
                      }
                      return null;
                    },),
                    SizedBox(height: 0.049 * MediaQuery.of(context).size.height),
                    auth.registerLoading?
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
                      child: CustomButton(
                        onPressed:()  async {
                          if (auth.registerLoading) return;
                          if (AppKeys.registerFormKey.currentState!
                              .validate()) {
                            final result = await ref
                                .read(authNotifierProvider.notifier)
                                .register(
                                username: _userNameController.text,
                                email: _emailController.text,
                                password: _passwordController.text,
                                name: _nameController.text,
                                birthDate: _dateOfBirthController.text);

                            if (result) {
                              Navigator.pushNamedAndRemoveUntil(context, Routes.initRoute, (route) => false);
                            }
                          }
                        },
                        text: 'Sign up',
                      ),
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
  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate ?? DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );

    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
        _dateOfBirthController.text = DateFormat('yyyy-MM-dd').format(selectedDate!);

      });
    }
  }
}
