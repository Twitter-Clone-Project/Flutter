import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:x_clone/app/routes.dart';
import 'package:x_clone/features/auth/data/providers/auth_provider.dart';
import 'package:x_clone/features/auth/ui/widgets/custom_button.dart';
import 'package:x_clone/features/tweet/data/providers/tweet_provider.dart';
import 'package:x_clone/theme/app_colors.dart';
import 'package:x_clone/theme/app_text_style.dart';
import '../widgets/custom_text.dart';
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
          : authprov.mutersList.users!.isEmpty ?  Center(
        child: Text(
          "You haven't muted anyone.",
          style: const TextStyle(
            color:
            AppColors.whiteColor,
            fontSize: 22,
            fontFamily: 'Chirp',
          ),
        ),
      )
      : ListView.builder(
        itemCount: authprov.mutersList.users!.length,
        itemBuilder: (context, index) {
          final muter =
          ref.watch(authNotifierProvider).mutersList.users![index];

          return GestureDetector(
            onTap: () async {
              bool confirmUnblock = await showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    backgroundColor: AppColors.blackColor,
                    title: Text(
                      'Unmute ${muter.name}?',
                      style: const TextStyle(
                        fontSize: 18.0,
                        fontFamily: 'Chirp',
                        color: Colors.white,
                      ),
                    ),
                    content: const CustomText(
                      'Posts from this account will now be allowed in your Home timeline.',
                    ),
                    actions: <Widget>[
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).pop(false); // User canceled unblock
                        },
                        child: const Text(
                          'Cancel',
                          style: TextStyle(
                            fontSize: 14.0,
                            color: Colors.white,
                            fontFamily: 'Chirp',
                          ),
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).pop(true); // User confirmed unblock
                        },
                        child: const Text(
                          'Unmute',
                          style: TextStyle(
                            fontSize: 14.0,
                            color: Colors.white,
                            fontFamily: 'Chirp',
                          ),
                        ),
                      ),
                    ],
                  );
                },
              );

              // If the user confirmed unblock, then proceed
              if (confirmUnblock == true) {
                await ref
                    .read(authNotifierProvider.notifier)
                    .unmuteUser(muter.username!);
              }
            },
            child: ListTile(
              leading: ClipOval(
                child: CachedNetworkImage(
                  width: 40,
                  height: 40,
                  fit: BoxFit.cover,
                  imageUrl: ref.watch(authNotifierProvider).mutersList.users![index].imageUrl ?? 'https://kady-twitter-images.s3.amazonaws.com/defaultProfile.jpg',
                  placeholder: (context, url) => Container(
                    color: Color(AppColors.blackColor.value),
                  ),
                  errorWidget: (context, url, error) =>
                      Image.asset(AppAssets.whiteLogo,
                          fit: BoxFit.cover),
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
            ),
          );
        },
      ),
    );
  }
}