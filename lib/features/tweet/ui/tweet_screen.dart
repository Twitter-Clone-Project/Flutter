import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:x_clone/app/widgets/tweet_icon_button.dart';
import 'package:x_clone/features/tweet/data/providers/tweet_provider.dart';
import 'package:x_clone/features/tweet/ui/reply.dart';
import 'package:x_clone/theme/app_assets.dart';
import 'package:x_clone/theme/app_colors.dart';
import 'package:x_clone/theme/app_text_style.dart';

class TweetScreen extends StatefulHookConsumerWidget {
  const TweetScreen({super.key, required this.tweetId});
  final String tweetId;
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
        ref.read(tweetNotifierProvider.notifier).getRepliers(tweetId: widget.tweetId);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final tweetprov = ref.watch(tweetNotifierProvider);
    return Scaffold(
        body: Column(
      children: [
        SizedBox(height: 100),
        tweetprov.loading
            ? Center(child: CircularProgressIndicator())
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
    ));
  }
}
