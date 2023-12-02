import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:x_clone/features/tweet/data/providers/tweet_provider.dart';
import 'package:x_clone/features/tweet/ui/widgets/reply.dart';
import 'package:x_clone/features/tweet/ui/widgets/tweet.dart';
import 'package:x_clone/theme/app_colors.dart';
import 'package:x_clone/theme/app_text_style.dart';
import '../../home/data/models/home_response.dart';

class TweetScreen extends StatefulHookConsumerWidget {
  TweetScreen({super.key, required this.tweet, required this.index});
  Tweet? tweet;
  int? index;

  @override
  ConsumerState<TweetScreen> createState() => _TweetScreenState();
}

class _TweetScreenState extends ConsumerState<TweetScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // var data = ModalRoute.of(context)!.settings.arguments as Map;
    // widget.tweet = data["tweet"] as Tweet?;
    // widget.index = data["index"] as int?;
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
    return Scaffold(
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
          bottom: const PreferredSize(
            preferredSize: Size.fromHeight(1.0),
            child: Divider(color: AppColors.whiteColor, thickness: 0.1),
          ),
        ),
        body: Column(
          children: [
            TweetComponent(
              tweet: widget.tweet!,
              index: widget.index!,
            ),
            tweetprov.loading
                ? const Center(child: CircularProgressIndicator())
                : Expanded(
                    child: ListView.builder(
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
                  ),
          ],
        ));
  }
}
