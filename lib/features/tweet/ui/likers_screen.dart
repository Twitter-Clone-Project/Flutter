import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:x_clone/app/routes.dart';
import 'package:x_clone/features/auth/ui/widgets/custom_button.dart';
import 'package:x_clone/features/tweet/data/providers/tweet_provider.dart';
import 'package:x_clone/theme/app_colors.dart';
import 'package:x_clone/theme/app_text_style.dart';

import '../../../theme/app_assets.dart';

/// A screen that displays the list of users who have liked a tweet.
/// 
/// This screen is responsible for fetching and displaying the list of users who have liked a specific tweet.
/// It uses the `tweetNotifierProvider` to fetch the likers data and displays it in a `ListView.builder`.
/// The screen also provides a back button in the app bar to navigate back to the previous screen.
class LikersScreen extends StatefulHookConsumerWidget {
  const LikersScreen({super.key, required this.tweetId});
  final String? tweetId;

  @override
  ConsumerState<LikersScreen> createState() => _LikersScreenState();
}

class _LikersScreenState extends ConsumerState<LikersScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // Fetch the likers data after a delay of 0 seconds
    Future.delayed(const Duration(seconds: 0), () {
      ref
          .read(tweetNotifierProvider.notifier)
          .getLikers(tweetId: widget.tweetId!);
    });
  }

  @override
  Widget build(BuildContext context) {
    final tweetprov = ref.watch(tweetNotifierProvider);

    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 65,
        backgroundColor: AppColors.pureBlack,
        title: const Text(
          'Liked by',
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
      body: tweetprov.loading
          ? Center(child: CircularProgressIndicator())
          : ListView.builder(
              itemCount: tweetprov.likersList.data!.length,
              itemBuilder: (context, index) {
                final liker =
                    ref.watch(tweetNotifierProvider).likersList.data![index];
                return ListTile(
                  leading: GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, Routes.profileScreen,
                          arguments: ref
                              .watch(tweetNotifierProvider)
                              .likersList
                              .data![index]
                              .screenName);
                    },
                    child: ClipOval(
                      child: CachedNetworkImage(
                        width: 40,
                        height: 40,
                        fit: BoxFit.cover,
                        imageUrl: ref
                            .watch(tweetNotifierProvider)
                            .likersList
                            .data![index]
                            .imageUrl ?? 'https://kady-twitter-images.s3.amazonaws.com/defaultProfile.jpg',
                        placeholder: (context, url) => Container(
                          color: Color(0xFF333639),
                        ),
                        errorWidget: (context, url, error) =>
                            Image.asset(AppAssets.whiteLogo,
                                fit: BoxFit.cover),
                      ),
                    ),
                  ),
                  title: Text(
                    liker.name!,
                    style: AppTextStyle.textThemeDark.bodyLarge!.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  subtitle: Text(
                    '@${liker.screenName}',
                    style: AppTextStyle.textThemeDark.bodyLarge!.copyWith(
                      color: AppColors.lightGray,
                    ),
                  ),
                  // trailing: liker.isFollowed!
                  //     ? Container(
                  //         width: 120,
                  //         height: 40,
                  //         child: CustomButton(
                  //           text: 'Following',
                  //           onPressed: () {},
                  //           filled: false,
                  //         ),
                  //       )
                  //     : Container(
                  //         width: 120,
                  //         height: 40,
                  //         child: CustomButton(text: 'Follow', onPressed: () {}),
                  //       ),
                );
              },
            ),
    );
  }
}
