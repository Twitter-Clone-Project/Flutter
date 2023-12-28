import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:x_clone/theme/app_text_style.dart';
import 'package:x_clone/theme/app_colors.dart';

import '../../../../app/routes.dart';
import '../../../../theme/app_assets.dart';
import '../../../auth/data/providers/auth_provider.dart';
import '../../data/providers/home_provider.dart';

/// A widget that represents the main drawer of the application.
/// The main drawer displays the user's profile information, such as their name, username, number of followers, and number of followings.
/// It also provides navigation options to the user, such as accessing their profile and settings.
class MainDrawer extends ConsumerWidget {
  const MainDrawer({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final auth = ref.watch(authNotifierProvider);
    String _userName = auth.user?.name ?? '';
    String _userUserName = '@${auth.user?.username ?? ''}';
    String _numberOfFollowing =
        ref.watch(authNotifierProvider).user!.followingsCount ?? '0';
    String _numberOfFollowers =
        ref.watch(authNotifierProvider).user!.followersCount ?? '0';
    return SafeArea(
      child: Drawer(
        backgroundColor: AppColors.pureBlack,
        elevation: 0,
        child: Container(
          padding: const EdgeInsets.all(20),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    InkWell(
                      onTap: () {
                        Navigator.pushNamed(context, Routes.profileScreen,
                            arguments: auth.user?.username);
                      },
                      child: ClipOval(
                        child: CachedNetworkImage(
                          width: 40,
                          height: 40,
                          fit: BoxFit.cover,
                          imageUrl: ref
                              .watch(authNotifierProvider)
                              .user!
                              .imageUrl ?? 'https://kady-twitter-images.s3.amazonaws.com/defaultProfile.jpg',
                          placeholder: (context, url) => Image.asset(
                              AppAssets.whiteLogo,
                              fit: BoxFit.cover),
                          errorWidget: (context, url, error) =>
                              Image.asset(AppAssets.whiteLogo,
                                  fit: BoxFit.cover),
                        ),
                      ),
                    ),
                    const Spacer(),
                    IconButton(
                        onPressed: () {}, icon: const Icon(Icons.more_vert))
                  ],
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.01),
                Text(_userName,
                    style: AppTextStyle.textThemeDark.headline6!
                        .copyWith(fontWeight: FontWeight.bold)),
                const SizedBox(height: 2),
                Text(
                  _userUserName,
                  style: AppTextStyle.textThemeDark.subtitle1!
                      .copyWith(color: AppColors.lightThinTextGray),
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                Row(
                  children: [
                    Text(
                      '$_numberOfFollowing',
                      style: AppTextStyle.textThemeDark.bodyText1!
                          .copyWith(fontWeight: FontWeight.bold),
                    ),
                    Text(
                      ' Following',
                      style: AppTextStyle.textThemeDark.bodyText1!
                          .copyWith(color: AppColors.lightThinTextGray),
                    ),
                    Text(
                      '  $_numberOfFollowers',
                      style: AppTextStyle.textThemeDark.bodyText1!.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      ' Followers',
                      style: AppTextStyle.textThemeDark.bodyText1!
                          .copyWith(color: AppColors.lightThinTextGray),
                    ),
                  ],
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.03),
                const Divider(thickness: 1.5),
                SizedBox(height: MediaQuery.of(context).size.height * 0.015),
                ListTile(
                  contentPadding: EdgeInsets.symmetric(
                      vertical: MediaQuery.of(context).size.width * 0.01,
                      horizontal: 0),
                  leading: Icon(
                    Icons.person_outline_outlined,
                    size: 30,
                    color: Theme.of(context).colorScheme.onBackground,
                  ),
                  title: InkWell(
                    onTap: () {
                      Navigator.pushNamed(context, Routes.profileScreen,
                          arguments: auth.user?.username);
                    },
                    child: Text(
                      'Profile',
                      style: AppTextStyle.textThemeDark.headline5!
                          .copyWith(fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    Navigator.pushNamed(context, Routes.settingsScreen);
                  },
                  child: ListTile(
                    contentPadding: EdgeInsets.symmetric(
                        vertical: MediaQuery.of(context).size.width * 0.01,
                        horizontal: 0),
                    leading: Icon(
                      Icons.settings,
                      size: 30,
                      color: Theme.of(context).colorScheme.onBackground,
                    ),
                    title: Text(
                      'Settings',
                      style: AppTextStyle.textThemeDark.headline5!
                          .copyWith(fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                ListTile(
                  contentPadding: EdgeInsets.symmetric(
                      vertical: MediaQuery.of(context).size.width * 0.01,
                      horizontal: 0),
                  leading: Icon(
                    Icons.logout,
                    size: 30,
                    color: Theme.of(context).colorScheme.onBackground,
                  ),
                  title: InkWell(
                    onTap: () {
                      ref.read(homeNotifierProvider.notifier).changePageIndex(0);
                      ref.read(authNotifierProvider.notifier).logout();
                    },
                    child: Text(
                      'Logout',
                      style: AppTextStyle.textThemeDark.headline5!
                          .copyWith(fontWeight: FontWeight.bold),
                    ),
                  ),
                ),

              ],
            ),
          ),
        ),
      ),
    );
  }
}
