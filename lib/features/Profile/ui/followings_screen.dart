import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:x_clone/app/routes.dart';
import 'package:x_clone/features/Profile/data/providers/profile_provider.dart';
import 'package:x_clone/features/auth/ui/widgets/custom_button.dart';
import 'package:x_clone/theme/app_colors.dart';
import 'package:x_clone/theme/app_text_style.dart';

import '../../../theme/app_assets.dart';
import '../../auth/data/providers/auth_provider.dart';
import '../data/model/user_profile.dart';

/// A screen widget that displays the list of users that the current user is following.
/// It provides a visual representation of the users' profile images, names, and follow status.
class FollowingsScreen extends StatefulHookConsumerWidget {
  const FollowingsScreen({super.key, required this.username});

  final String username;

  @override
  _FollowingsScreenState createState() => _FollowingsScreenState();
}

class _FollowingsScreenState extends ConsumerState<FollowingsScreen> {
  @override
  void initState() {
    super.initState();
    // Fetch the list of followings for the given username
    Future.delayed(const Duration(seconds: 0), () {
      ref
          .read(profileNotifierProvider.notifier)
          .getFollowings(username: widget.username);
    });
  }

  @override
  Widget build(BuildContext context) {
    final profileProv = ref.watch(profileNotifierProvider);
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 65,
        backgroundColor: AppColors.pureBlack,
        title: const Text(
          'Following',
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
      body: profileProv.loading
          ? const Center(
              child: CircularProgressIndicator(
              color: AppColors.whiteColor,
              strokeWidth: 1,
            ))
          : ListView.builder(
              itemCount: profileProv.followingsList.data!.length,
              itemBuilder: (context, index) {
                final following = ref
                    .watch(profileNotifierProvider)
                    .followingsList
                    .data![index];
                return Column(
                  children: [
                    ListTile(
                      title: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          following.isFollowing!
                              ? Row(
                                  children: [
                                    Container(
                                      margin: const EdgeInsets.only(bottom: 5),
                                      child: const Row(
                                        children: [
                                          Icon(
                                            Icons.person,
                                            size: 16,
                                            color: AppColors.lightGray,
                                          ),
                                          SizedBox(width: 4),
                                          Text(
                                            'Follows you',
                                            style: TextStyle(
                                                color: AppColors.lightGray,
                                                fontSize: 12),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                )
                              : const SizedBox.shrink(),
                          Row(
                            children: [
                              GestureDetector(
                                onTap: () {
                                  // Navigate to the profile screen of the selected user
                                  Navigator.pushNamed(
                                      context, Routes.profileScreen,
                                      arguments: following.username);
                                },
                                child: ClipOval(
                                  child: CachedNetworkImage(
                                    width: 32,
                                    height: 32,
                                    fit: BoxFit.cover,
                                    imageUrl: following.imageUrl ??
                                        'https://kady-twitter-images.s3.amazonaws.com/defaultProfile.jpg',
                                    placeholder: (context, url) => Container(
                                      color: Color(0xFF333639),
                                    ),
                                    errorWidget: (context, url, error) =>
                                        Image.asset(AppAssets.whiteLogo,
                                            fit: BoxFit.cover),
                                  ),
                                ),
                              ),
                              const SizedBox(width: 8),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    following.name!,
                                    style: AppTextStyle.textThemeDark.bodyLarge!
                                        .copyWith(
                                      fontWeight: FontWeight.bold,
                                    ),
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                  Text(
                                    '@${following.username}',
                                    style: AppTextStyle.textThemeDark.bodyLarge!
                                        .copyWith(
                                      color: AppColors.lightGray,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                      // trailing: buildTrailingWidget(following, context),
                    ),
                    const SizedBox(
                      height: 4,
                    ),
                    // const Divider(height: 1, thickness: 0.2, color: AppColors.lightThinTextGray), // Divider between items
                    // const SizedBox(height: 4,),
                  ],
                );
              },
            ),
    );
  }

  Widget? buildTrailingWidget(FollowingData following, BuildContext context) {
    if (following.username == ref.watch(authNotifierProvider).user?.username) {
      return null; // or any other widget if you don't want to show anything
    }

    return Container(
      width: 120,
      height: 40,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          CustomButton(
            horizontalPadding: 20,
            text: following.isFollowed! ? 'Following' : 'Follow',
            onPressed: () async {
              // ref.read(profileNotifierProvider.notifier)
              //     .toggleFollowStatus(follower.username!);
            },
            filled: following.isFollowed! ? false : true,
          ),
        ],
      ),
    );
  }
}
