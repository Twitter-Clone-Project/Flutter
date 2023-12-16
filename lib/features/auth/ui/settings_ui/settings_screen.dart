import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:x_clone/app/routes.dart';
import 'package:x_clone/features/Profile/data/providers/profile_provider.dart';
import 'package:x_clone/features/auth/data/providers/auth_provider.dart';
import 'package:x_clone/features/auth/ui/widgets/custom_button.dart';
import 'package:x_clone/features/tweet/data/providers/tweet_provider.dart';
import 'package:x_clone/theme/app_colors.dart';
import 'package:x_clone/theme/app_text_style.dart';

class SettingsScreen extends StatefulHookConsumerWidget {
  const SettingsScreen({super.key});
  @override
  ConsumerState<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends ConsumerState<SettingsScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(const Duration(seconds: 0), () {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 65,
        backgroundColor: AppColors.pureBlack,
        title: const Text(
          'Settings',
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
      body: Column(children: [
        InkWell(
          onTap: () {
            Navigator.pushNamed(context, Routes.usernameScreen);
          },
          child: ListTile(
            title:
                Text("Username", style: AppTextStyle.textThemeDark.bodyLarge!),
            subtitle: Text(
              "@${ref.watch(authNotifierProvider).user!.username!}",
              style: AppTextStyle.textThemeDark.bodyLarge!
                  .copyWith(color: AppColors.lightThinTextGray),
            ),
          ),
        ),
        InkWell(
          onTap: () {
            Navigator.pushNamed(context, Routes.emailScreen);
          },
          child: ListTile(
            title: Text("Email Address",
                style: AppTextStyle.textThemeDark.bodyLarge!),
            subtitle: Text(
              "@${ref.watch(authNotifierProvider).user!.email}",
              style: AppTextStyle.textThemeDark.bodyLarge!
                  .copyWith(color: AppColors.lightThinTextGray),
            ),
          ),
        ),
        ListTile(
          title: Text("Change your password",
              style: AppTextStyle.textThemeDark.bodyLarge!),
          subtitle: Text(
            "Change your password at any time.",
            style: AppTextStyle.textThemeDark.bodyLarge!
                .copyWith(color: AppColors.lightThinTextGray),
          ),
        ),
        ListTile(
          title:
              Text("Muted Users", style: AppTextStyle.textThemeDark.bodyLarge!),
          subtitle: Text(
            "List of your muted users.",
            style: AppTextStyle.textThemeDark.bodyLarge!
                .copyWith(color: AppColors.lightThinTextGray),
          ),
        ),
        ListTile(
          title: Text(
            "Blocked Users",
            style: AppTextStyle.textThemeDark.bodyLarge!,
          ),
          subtitle: Text(
            "List of your blocked users.",
            style: AppTextStyle.textThemeDark.bodyLarge!
                .copyWith(color: AppColors.lightThinTextGray),
          ),
        )
      ]),
    );
  }
}
