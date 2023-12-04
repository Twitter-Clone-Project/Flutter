import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:x_clone/theme/app_text_style.dart';
import 'package:x_clone/theme/app_colors.dart';

import '../../../../app/routes.dart';
import '../../../auth/data/providers/auth_provider.dart';

class MainDrawer extends ConsumerWidget {
  const MainDrawer({super.key});

  @override
  Widget build(BuildContext context,WidgetRef ref) {
    final auth = ref.watch(authNotifierProvider);
    String _userName = auth.user?.name??'';
    String _userUserName = '@${auth.user?.username??''}';
    int _numberOfFollowing = 13; // TODO: Provider to get it when changed
    int _numberOfFollowers = 0; // TODO: Provider to get it when changed

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
                        Navigator.pushNamed(
                            context, Routes.profileScreen);
                      },
                      child: CircleAvatar(
                        backgroundColor: const Color.fromARGB(255, 59, 158, 59),
                        child: Text(
                          _userName[0],
                          style: AppTextStyle.textThemeDark.headline6!
                              .copyWith(color: Colors.white, fontSize: 25),
                        ),
                        // Child : Sura aw awl harf mn esm el user
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
                  title: Text(
                    'Profile',
                    style: AppTextStyle.textThemeDark.headline5!
                        .copyWith(fontWeight: FontWeight.bold),
                  ),
                ),
                ListTile(
                  contentPadding: EdgeInsets.symmetric(
                      vertical: MediaQuery.of(context).size.width * 0.01,
                      horizontal: 0),
                  leading: Icon(
                    Icons.close,
                    size: 30,
                    color: Theme.of(context).colorScheme.onBackground,
                  ),
                  title: Text(
                    'Premium',
                    style: AppTextStyle.textThemeDark.headline5!
                        .copyWith(fontWeight: FontWeight.bold),
                  ),
                ),
                ListTile(
                  contentPadding: EdgeInsets.symmetric(
                      vertical: MediaQuery.of(context).size.width * 0.01,
                      horizontal: 0),
                  leading: Icon(
                    Icons.bookmark_outline_rounded,
                    size: 30,
                    color: Theme.of(context).colorScheme.onBackground,
                  ),
                  title: Text(
                    'Bookmarks',
                    style: AppTextStyle.textThemeDark.headline5!
                        .copyWith(fontWeight: FontWeight.bold),
                  ),
                ),
                ListTile(
                  contentPadding: EdgeInsets.symmetric(
                      vertical: MediaQuery.of(context).size.width * 0.01,
                      horizontal: 0),
                  leading: Icon(
                    Icons.list_alt_sharp,
                    size: 30,
                    color: Theme.of(context).colorScheme.onBackground,
                  ),
                  title: Text(
                    'Lists',
                    style: AppTextStyle.textThemeDark.headline5!
                        .copyWith(fontWeight: FontWeight.bold),
                  ),
                ),
                ListTile(
                  contentPadding: EdgeInsets.symmetric(
                      vertical: MediaQuery.of(context).size.width * 0.01,
                      horizontal: 0),
                  leading: Icon(
                    Icons.egg_rounded,
                    size: 30,
                    color: Theme.of(context).colorScheme.onBackground,
                  ),
                  title: Text(
                    'Spaces',
                    style: AppTextStyle.textThemeDark.headline5!
                        .copyWith(fontWeight: FontWeight.bold),
                  ),
                ),
                ListTile(
                  contentPadding: EdgeInsets.symmetric(
                      vertical: MediaQuery.of(context).size.width * 0.01,
                      horizontal: 0),
                  leading: Icon(
                    Icons.money,
                    size: 30,
                    color: Theme.of(context).colorScheme.onBackground,
                  ),
                  title: Text(
                    'Monetisation',
                    style: AppTextStyle.textThemeDark.headline5!
                        .copyWith(fontWeight: FontWeight.bold),
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.01,
                ),
                const Divider(thickness: 1.5),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.02,
                ),
                ListTile(
                  contentPadding: const EdgeInsets.all(0),
                  leading: Text(
                    'Professional Tools',
                    style: AppTextStyle.textThemeDark.bodyText1!
                        .copyWith(fontWeight: FontWeight.bold, fontSize: 19),
                  ),
                  trailing: const Icon(
                    Icons.keyboard_arrow_down_sharp,
                    size: 25,
                  ),
                ),
                ListTile(
                  contentPadding: const EdgeInsets.all(0),
                  leading: Text(
                    'Settings & Support',
                    style: AppTextStyle.textThemeDark.bodyText1!
                        .copyWith(fontWeight: FontWeight.bold, fontSize: 19),
                  ),
                  trailing: const Icon(
                    Icons.keyboard_arrow_down_sharp,
                    size: 25,
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
