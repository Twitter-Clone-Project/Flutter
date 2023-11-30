import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:x_clone/features/auth/ui/widgets/custom_button.dart';
import 'package:x_clone/features/tweet/data/providers/tweet_provider.dart';
import 'package:x_clone/theme/app_colors.dart';
import 'package:x_clone/theme/app_text_style.dart';

class RetweetersScreen extends StatefulHookConsumerWidget {
  const RetweetersScreen({super.key, this.tweetId});
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
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.pureBlack,
        title: Text(
          'Reposted by',
          style: AppTextStyle.textThemeDark.headlineSmall!
              .copyWith(color: AppColors.whiteColor),
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
      ),
      body: tweetprov.loading
          ? Center(child: CircularProgressIndicator())
          : ListView.builder(
              itemCount: tweetprov.retweetrsList.data!.length,
              itemBuilder: (context, index) {
                final retweeter = tweetprov.retweetrsList.data![index];
                return ListTile(
                    leading: GestureDetector(
                      onTap: () {
                        // go to user profile
                      },
                      child: const CircleAvatar(
                        backgroundColor: AppColors.whiteColor,
                        // backgroundImage:Image.network(retweeter.profileImageURL!).image,
                        radius: 20,
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
                    trailing: retweeter.isFollowed!
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
                            child:
                                CustomButton(text: 'Follow', onPressed: () {}),
                          ));
              },
            ),
    );
  }
}
