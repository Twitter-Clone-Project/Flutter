import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:x_clone/app/routes.dart';
import 'package:x_clone/features/Profile/data/providers/profile_provider.dart';
import 'package:x_clone/features/auth/ui/widgets/custom_button.dart';
import 'package:x_clone/theme/app_colors.dart';
import 'package:x_clone/theme/app_text_style.dart';

import '../../../theme/app_assets.dart';
import '../../auth/data/providers/auth_provider.dart';
import '../data/model/user_profile.dart';

/// A screen that displays the followers of a user.
///
/// This screen is responsible for showing a list of followers for a specific user.
/// It includes a refresh functionality and a back button to navigate back to the previous screen.
class FollowersScreen extends StatefulHookConsumerWidget {
  const FollowersScreen({super.key, required this.username});
  final String username;

  @override
  _FollowersScreenState createState() => _FollowersScreenState();
}

class _FollowersScreenState extends ConsumerState<FollowersScreen> {
  final RefreshController _controller = RefreshController();

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 0), () {
      _onRefresh();
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
          'Followers',
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
              itemCount: profileProv.followersList.data!.length,
              itemBuilder: (context, index) {
                final follower = ref
                    .watch(profileNotifierProvider)
                    .followersList
                    .data![index];
                return Column(
                  children: [
                    ListTile(
                      title: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          follower.isFollowing!
                              ? Row(
                                  children: [
                                    Container(
                                      margin: const EdgeInsets.only(bottom: 8),
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
                                  Navigator.pushNamed(
                                      context, Routes.profileScreen,
                                      arguments: follower.username);
                                },
                                child: ClipOval(
                                  child: CachedNetworkImage(
                                    width: 32,
                                    height: 32,
                                    fit: BoxFit.cover,
                                    imageUrl: follower.imageUrl ??
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
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      follower.name!,
                                      style: AppTextStyle
                                          .textThemeDark.bodyLarge!
                                          .copyWith(
                                        fontWeight: FontWeight.bold,
                                      ),
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                    Text(
                                      '@${follower.username}',
                                      style: AppTextStyle
                                          .textThemeDark.bodyLarge!
                                          .copyWith(
                                        color: AppColors.lightGray,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      // trailing: buildTrailingWidget(follower, context),
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

  Widget? buildTrailingWidget(FollowerData follower, BuildContext context) {
    if (follower.username == ref.watch(authNotifierProvider).user?.username) {
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
            text: follower.isFollowing! ? 'Following' : 'Follow',
            onPressed: () async {
              ref
                  .read(profileNotifierProvider.notifier)
                  .toggleFollowStatus(follower.username!);
              _onRefresh();
            },
            filled: false,
          ),
        ],
      ),
    );
  }

  loadData() async {
    await ref
        .read(profileNotifierProvider.notifier)
        .getFollowers(username: widget.username);
  }

  void _onRefresh() async {
    await loadData();
    _controller.refreshCompleted();
  }
}
