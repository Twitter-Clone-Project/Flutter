import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:x_clone/features/auth/ui/widgets/custom_button.dart';
import 'package:x_clone/features/tweet/data/providers/tweet_provider.dart';
import 'package:x_clone/theme/app_colors.dart';
import 'package:x_clone/theme/app_text_style.dart';

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
        backgroundColor: AppColors.pureBlack,
        title: Text(
          'Liked by',
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
                final liker = tweetprov.likersList.data![index];
                return ListTile(
                    leading: GestureDetector(
                      onTap: () {
                        // go to user profile
                      },
                      child: const CircleAvatar(
                        backgroundColor: AppColors.whiteColor,
                        // backgroundImage:Image.network(liker.profileImageURL!).image,
                        radius: 20,
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
                    trailing: liker.isFollowed!
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
