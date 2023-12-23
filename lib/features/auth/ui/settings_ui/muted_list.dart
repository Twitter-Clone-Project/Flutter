import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:x_clone/app/routes.dart';
import 'package:x_clone/features/auth/data/providers/auth_provider.dart';
import 'package:x_clone/features/auth/ui/widgets/custom_button.dart';
import 'package:x_clone/features/tweet/data/providers/tweet_provider.dart';
import 'package:x_clone/theme/app_colors.dart';
import 'package:x_clone/theme/app_text_style.dart';

import '../../../../theme/app_assets.dart';

class MutersScreen extends StatefulHookConsumerWidget {
  const MutersScreen({super.key});
  @override
  ConsumerState<MutersScreen> createState() => _MutersScreenState();
}

class _MutersScreenState extends ConsumerState<MutersScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(const Duration(seconds: 0), () {
      ref.read(authNotifierProvider.notifier).getMutedUsers();
    });
  }

  @override
  Widget build(BuildContext context) {
    final authprov = ref.watch(authNotifierProvider);
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 65,
        backgroundColor: AppColors.pureBlack,
        title: const Text(
          'Muted Users',
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
      body: authprov.loading!
          ? Center(child: CircularProgressIndicator())
          : ListView.builder(
        itemCount: authprov.mutersList.users!.length,
        itemBuilder: (context, index) {
          final muter =
          ref.watch(authNotifierProvider).mutersList.users![index];
          return ListTile(
            leading: GestureDetector(
              onTap: () {
                //Navigator.pushNamed(context, Routes.profileScreen,
                //     arguments: ref
                //         .watch(tweetNotifierProvider)
                //         .likersList
                //         .data![index]
                //         .screenName);
              },
              child: ClipOval(
                child: CachedNetworkImage(
                  width: 40,
                  height: 40,
                  fit: BoxFit.cover,
                  imageUrl: ref
                      .watch(authNotifierProvider)
                      .mutersList
                      .users![index]
                      .imageUrl ?? '',
                  placeholder: (context, url) => Image.asset(
                      AppAssets.whiteLogo,
                      fit: BoxFit.cover),
                  errorWidget: (context, url, error) =>
                      Image.asset(AppAssets.whiteLogo,
                          fit: BoxFit.cover),
                ),
              ),
            ),
            title: Text(
              muter.name!,
              style: AppTextStyle.textThemeDark.bodyLarge!.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            subtitle: Text(
              '@${muter.username}',
              style: AppTextStyle.textThemeDark.bodyLarge!.copyWith(
                color: AppColors.lightGray,
              ),
            ),
          );
        },
      ),
    );
  }
}