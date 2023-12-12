import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:x_clone/app/routes.dart';
import 'package:x_clone/features/Profile/data/providers/profile_provider.dart';
import 'package:x_clone/features/auth/ui/widgets/custom_button.dart';
import 'package:x_clone/theme/app_colors.dart';
import 'package:x_clone/theme/app_text_style.dart';

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
          ? const Center(child: CircularProgressIndicator(color: AppColors.whiteColor,
        strokeWidth: 1,))
          : ListView.builder(
        itemCount: profileProv.followingsList.data!.length,
        itemBuilder: (context, index) {
          final following =
          ref.watch(profileNotifierProvider).followingsList.data![index];
          return ListTile(
            leading: GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, Routes.profileScreen,
                    arguments: following.username);
              },
              child: CircleAvatar(
                backgroundColor: AppColors.whiteColor,
                backgroundImage: NetworkImage(following.imageUrl ?? ''),
                radius: 20,
              ),
            ),
            title: Text(
              following.name!,
              style: AppTextStyle.textThemeDark.bodyLarge!.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            subtitle: Text(
              '@${following.username}',
              style: AppTextStyle.textThemeDark.bodyLarge!.copyWith(
                color: AppColors.lightGray,
              ),
            ),
            trailing: following.isFollowing!
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
