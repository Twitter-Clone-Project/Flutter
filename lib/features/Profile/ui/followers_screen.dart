import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:x_clone/app/routes.dart';
import 'package:x_clone/features/Profile/data/providers/profile_provider.dart';
import 'package:x_clone/features/auth/ui/widgets/custom_button.dart';
import 'package:x_clone/theme/app_colors.dart';
import 'package:x_clone/theme/app_text_style.dart';

class FollowersScreen extends StatefulHookConsumerWidget {
  const FollowersScreen({super.key, required this.username});
  final String username;

  @override
  _FollowersScreenState createState() => _FollowersScreenState();
}

class _FollowersScreenState extends ConsumerState<FollowersScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 0), () {
      ref
          .read(profileNotifierProvider.notifier)
          .getFollowers(username: widget.username!);
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
          ? const Center(child: CircularProgressIndicator(color: AppColors.whiteColor,
          strokeWidth: 1,))
          : ListView.builder(
        itemCount: profileProv.followersList.data!.length,
        itemBuilder: (context, index) {
          final follower =
          ref.watch(profileNotifierProvider).followersList.data![index];
          return ListTile(
            leading: GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, Routes.profileScreen,
                    arguments: follower.name);
              },
              child: CircleAvatar(
                backgroundColor: AppColors.whiteColor,
                backgroundImage: NetworkImage(follower.imageUrl ?? ''),
                radius: 20,
              ),
            ),
            title: Text(
              follower.name!,
              style: AppTextStyle.textThemeDark.bodyLarge!.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            subtitle: Text(
              '@${follower.username}',
              style: AppTextStyle.textThemeDark.bodyLarge!.copyWith(
                color: AppColors.lightGray,
              ),
            ),
            trailing: follower.isFollowing!
                ? Container(
              width: 120,
              height: 40,
              child: CustomButton(
                text: 'Following',
                onPressed: () {},
                filled: false,
              ),
            )
                : Container(
              width: 120,
              height: 40,
              child: CustomButton(text: 'Follow', onPressed: () {}),
            ),
          );
        },
      ),
    );
  }
}
