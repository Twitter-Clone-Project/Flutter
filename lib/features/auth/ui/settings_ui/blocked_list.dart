import 'package:another_flushbar/flushbar_route.dart';
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

/// A screen that displays a list of blocked users.
///
/// This screen is used to show a list of users that have been blocked by the current user.
/// It provides the functionality to unblock a user by tapping on their name.
/// The screen also displays a message if there are no blocked users.
class BlockersScreen extends StatefulHookConsumerWidget {
  const BlockersScreen({super.key});

  @override
  ConsumerState<BlockersScreen> createState() => _BlockersScreenState();
}

class _BlockersScreenState extends ConsumerState<BlockersScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(
      const Duration(seconds: 0),
      () {
        ref.read(authNotifierProvider.notifier).getBlockedUsers();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final authprov = ref.watch(authNotifierProvider);
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 65,
        backgroundColor: AppColors.pureBlack,
        title: const Text(
          'Blocked Users',
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
          : authprov.blockedList.users!.isEmpty
              ? Center(
                  child: Text(
                    "You haven't blocked anyone.",
                    style: const TextStyle(
                      color: AppColors.whiteColor,
                      fontSize: 22,
                      fontFamily: 'Chirp',
                    ),
                  ),
                )
              : ListView.builder(
                  itemCount: authprov.blockedList.users!.length,
                  itemBuilder: (context, index) {
                    final blocker = ref
                        .watch(authNotifierProvider)
                        .blockedList
                        .users![index];
                    return GestureDetector(
                      onTap: () async {
                        bool confirmUnblock = await showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              backgroundColor: AppColors.blackColor,
                              title: Text(
                                'Unblock ${blocker.name}?',
                                style: const TextStyle(
                                  fontSize: 18.0,
                                  fontFamily: 'Chirp',
                                  color: Colors.white,
                                ),
                              ),
                              content: const CustomText(
                                'They will be able to follow you and view your posts.',
                              ),
                              actions: <Widget>[
                                TextButton(
                                  onPressed: () {
                                    Navigator.of(context)
                                        .pop(false); // User canceled unblock
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
                                    Navigator.of(context)
                                        .pop(true); // User confirmed unblock
                                  },
                                  child: const Text(
                                    'Unblock',
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
                              .unblockUser(blocker.username!);
                        }
                      },
                      child: ListTile(
                        leading: ClipOval(
                          child: CachedNetworkImage(
                            width: 40,
                            height: 40,
                            fit: BoxFit.cover,
                            imageUrl: ref
                                    .watch(authNotifierProvider)
                                    .blockedList
                                    .users![index]
                                    .imageUrl ??
                                'https://kady-twitter-images.s3.amazonaws.com/defaultProfile.jpg',
                            placeholder: (context, url) => Container(
                              color: Color(AppColors.blackColor.value),
                            ),
                            errorWidget: (context, url, error) => Image.asset(
                                AppAssets.whiteLogo,
                                fit: BoxFit.cover),
                          ),
                        ),
                        title: Text(
                          blocker.name!,
                          style: AppTextStyle.textThemeDark.bodyLarge!.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        subtitle: Text(
                          '@${blocker.username}',
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
