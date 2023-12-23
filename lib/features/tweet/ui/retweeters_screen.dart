import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:x_clone/app/routes.dart';
import 'package:x_clone/features/auth/ui/widgets/custom_button.dart';
import 'package:x_clone/features/tweet/data/providers/tweet_provider.dart';
import 'package:x_clone/theme/app_colors.dart';
import 'package:x_clone/theme/app_text_style.dart';

import '../../../theme/app_assets.dart';

class RetweetersScreen extends StatefulHookConsumerWidget {
  const RetweetersScreen({super.key, required this.tweetId});
  final String? tweetId;
  @override
  ConsumerState<RetweetersScreen> createState() => _RetweetersScreenState();
}

class _RetweetersScreenState extends ConsumerState<RetweetersScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(const Duration(seconds: 0), () {
      ref
          .read(tweetNotifierProvider.notifier)
          .getRetweeters(tweetId: widget.tweetId!);
    });
  }

  @override
  Widget build(BuildContext context) {
    final tweetprov = ref.watch(tweetNotifierProvider);
    // print("===============sasa==================");
    // print(tweetprov.retweetrsList.data);
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 65,
        backgroundColor: AppColors.pureBlack,
        title: const Text(
          'Reposted by',
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
          ? const Center(child: CircularProgressIndicator())
          : ListView.builder(
              itemCount: tweetprov.retweetrsList.data!.length,
              itemBuilder: (context, index) {
                final retweeter = tweetprov.retweetrsList.data![index];
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
                            .retweetrsList
                            .data![index]
                            .profileImageURL ?? 'https://kady-twitter-images.s3.amazonaws.com/defaultProfile.jpg',
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
                    retweeter.name!,
                    style: AppTextStyle.textThemeDark.bodyLarge!.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  subtitle: Text(
                    '@${retweeter.screenName}',
                    style: AppTextStyle.textThemeDark.bodyLarge!.copyWith(
                      color: AppColors.lightGray,
                    ),
                  ),
                  // trailing: retweeter.isFollowed!
                  //     ? Container(
                  //         width: 100,
                  //         height: 40,
                  //         child: CustomButton(
                  //           text: 'Following',
                  //           onPressed: () {},
                  //           filled: false,
                  //         ),
                  //       )
                  //     : Container(
                  //         width: 100,
                  //         height: 40,
                  //         child: CustomButton(
                  //           text: 'Follow',
                  //           onPressed: () {},
                  //         ),
                  //       )
                );
              },
            ),
    );
  }
}
