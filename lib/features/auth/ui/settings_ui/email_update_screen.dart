import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:x_clone/app/app_keys.dart';
import 'package:x_clone/app/routes.dart';
import 'package:x_clone/features/Profile/data/providers/profile_provider.dart';
import 'package:x_clone/features/auth/data/providers/auth_provider.dart';
import 'package:x_clone/features/auth/ui/widgets/custom_button.dart';
import 'package:x_clone/features/home/data/providers/home_provider.dart';
import 'package:x_clone/features/tweet/data/providers/tweet_provider.dart';
import 'package:x_clone/theme/app_colors.dart';
import 'package:x_clone/theme/app_text_style.dart';

import '../../../../utils/utils.dart';

/// A screen widget for updating the user's email address.
///
/// This widget allows the user to change their current email address to a new one.
/// It provides a form with two input fields: one for the current email address and
/// another for the new email address. The user can enter the new email address and
/// validate it using the provided validation rules. If the validation is successful,
/// the user can tap the "Done" button to proceed with the email update process.
/// If the new email address is already associated with another account, an error
/// message will be displayed.
///
/// Example usage:
///
/// ```dart
/// EmailScreen(
///   key: Key('emailScreen'),
/// )
/// ```
class EmailScreen extends StatefulHookConsumerWidget {
  const EmailScreen({super.key});
  @override
  ConsumerState<EmailScreen> createState() => _EmailScreenState();
}

class _EmailScreenState extends ConsumerState<EmailScreen> {
  @override
  void initState() {
// TODO: implement initState
    super.initState();
    _emailController = TextEditingController(
        text: ref.read(authNotifierProvider).user!.email ?? "");
    _emaileController = TextEditingController(
        text: ref.read(authNotifierProvider).user!.email ?? "");
    Future.delayed(const Duration(seconds: 0), () {});
  }

  late TextEditingController _emailController;
  late TextEditingController _emaileController;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 65,
        backgroundColor: AppColors.pureBlack,
        title: const Text(
          'Change email',
          style: TextStyle(
            color: AppColors.whiteColor,
            fontSize: 22,
            fontFamily: 'Chirp',
          ),
        ),
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_sharp,
            color: AppColors.whiteColor,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        bottom: const PreferredSize(
          preferredSize: Size.fromHeight(1.0),
          child: Divider(color: AppColors.whiteColor, thickness: 0.1),
        ),
      ),
      body: Column(
        children: [
          Form(
            key: AppKeys.updateemailFormKey,
            child: Expanded(
              child: Column(
                children: [
                  ListTile(
                    contentPadding:
                        const EdgeInsets.symmetric(vertical: 0, horizontal: 16),
                    title: Text(
                      "Current",
                      style: AppTextStyle.textThemeDark.bodyLarge!
                          .copyWith(color: AppColors.lightThinTextGray),
                    ),
                    subtitle: TextFormField(
                      enabled: false,
                      controller: _emaileController,
                      validator: (value) {
                        if (value != null) return null;
                        if (value!.isEmpty) {
                          return null;
                        }
                        return null;
                      },
                    ),
                  ),
                  ListTile(
                    contentPadding:
                        const EdgeInsets.symmetric(vertical: 0, horizontal: 16),
                    title: Text(
                      "New",
                      style: AppTextStyle.textThemeDark.bodyLarge!
                          .copyWith(color: AppColors.lightThinTextGray),
                    ),
                    subtitle: TextFormField(
                      controller: _emailController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter a value';
                        } else if (value.length < 4) {
                          return 'Should be more than 4 characters';
                        }
                        return null;
                      },
                      decoration: const InputDecoration(
                        errorStyle:
                            TextStyle(color: Colors.red), // Error text color
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Divider(thickness: 0.5, color: AppColors.lightThinTextGray),
          Padding(
            padding: const EdgeInsets.all(5.0),
            child: Row(
              children: [
                Spacer(),
                TextButton(
                  onPressed: () async {
                    if (AppKeys.updateemailFormKey.currentState!.validate()) {
                      var result = await ref
                          .read(authNotifierProvider.notifier)
                          .isEmailFound(email: _emailController.text);

                      if (result == false) {
                        Navigator.pushNamed(
                            context, Routes.changeEmailOtpScreen,
                            arguments: _emailController.text);
                      } else {
                        AppSnackbar.show(
                            buildSnackBar(text: "Email already exist"));
                      }
                    }
                  },
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(
                        AppColors.primaryColor),
                    foregroundColor:
                        MaterialStateProperty.all<Color>(AppColors.whiteColor),
                  ),
                  child: Text(
                    'Done',
                    style: AppTextStyle.textThemeDark.bodyMedium,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
