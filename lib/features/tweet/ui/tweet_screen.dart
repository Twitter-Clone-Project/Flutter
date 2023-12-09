import 'dart:io';

import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:x_clone/features/auth/data/providers/auth_provider.dart';
import 'package:x_clone/features/home/data/providers/home_provider.dart';
import 'package:x_clone/features/tweet/data/models/tweet_response.dart';
import 'package:x_clone/features/tweet/data/providers/tweet_provider.dart';
import 'package:x_clone/features/tweet/ui/widgets/addReply.dart';
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
    Future.delayed(
      const Duration(seconds: 0),
      () {
        ref
            .read(homeNotifierProvider.notifier)
            .getRepliers(tweetId: widget.tweet!.id ?? '');
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final userProvider = ref.watch(authNotifierProvider);
    final homeProvider = ref.watch(homeNotifierProvider);
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
      body: Container(
        padding: const EdgeInsets.all(15),
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
                child: SingleChildScrollView(
              child: Column(
                children: [
                  TweetComponent(
                    tweet: widget.tweet!,
                    index: widget.index!,
                  ),
                  homeProvider.loading
                      ? const Center(child: CircularProgressIndicator())
                      : Column(
                          children: homeProvider.repliersList.data!
                              .map<Widget>(
                                (reply) => Reply(
                                  replier: reply,
                                ),
                              )
                              .toList(),
                        ),
                ],
              ),
            )),
            AddReply(
              tweet: widget.tweet!,
              index: widget.index!,
            ),
          ],
        ),
      ),
    );
  }
}