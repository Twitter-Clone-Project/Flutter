import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:x_clone/app/widgets/tweet_icon_button.dart';
import 'package:x_clone/features/tweet/data/providers/tweet_provider.dart';
import 'package:x_clone/features/tweet/ui/widgets/reply.dart';
import 'package:x_clone/features/tweet/ui/widgets/tweet.dart';
import 'package:x_clone/theme/app_assets.dart';
import 'package:x_clone/theme/app_colors.dart';
import 'package:x_clone/theme/app_text_style.dart';

import '../../../app/widgets/tweet_UI.dart';
import '../../home/data/models/home_response.dart';

class TweetScreen extends StatefulHookConsumerWidget {
  const TweetScreen({super.key, this.tweet});
  final Tweet? tweet;

  @override
  ConsumerState<TweetScreen> createState() => _TweetScreenState();
}

class _TweetScreenState extends ConsumerState<TweetScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(
      const Duration(seconds: 0),
      () {
        ref
            .read(tweetNotifierProvider.notifier)
            .getRepliers(tweetId: widget.tweet!.id ?? '');
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final tweetprov = ref.watch(tweetNotifierProvider);
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            backgroundColor: AppColors.pureBlack,
            title: Text(
              'Post',
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
          body: Column(
            children: [
              TweetComponent(
                tweet: widget.tweet!,
              ),
              tweetprov.loading
                  ? Center(child: CircularProgressIndicator())
                  : tweetprov.repliersList.data!.isEmpty
                      ? Center(
                          child: Text(
                          'There is no replies',
                          style: AppTextStyle.textThemeDark.bodyLarge,
                        ))
                      : ListView.builder(
                          itemCount: tweetprov.repliersList.data!.length,
                          itemBuilder: (context, index) {
                            final replier = tweetprov.repliersList.data![index];
                            return Reply(
                              likesCount: replier.likesCount,
                              text: replier.text,
                              userName: replier.userName,
                            );
                          },
                        ),
            ],
          )),
    );
  }
}
