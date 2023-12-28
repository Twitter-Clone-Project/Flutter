import 'dart:io';

import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:x_clone/features/Profile/data/providers/profile_provider.dart';
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

/// A screen widget that displays a tweet and its replies.
///
/// This widget is responsible for rendering the UI of a tweet screen, including the tweet itself,
/// the list of replies, and the ability to add a new reply. It also handles the initialization
/// of the screen by fetching the replies based on the tweet and the user's profile.
class TweetScreen extends StatefulHookConsumerWidget {
  TweetScreen(
      {super.key,
      required this.tweet,
      required this.index,
      required this.whom});
  Tweet tweet;
  int index;
  int whom;

  @override
  ConsumerState<TweetScreen> createState() => _TweetScreenState();
}

class _TweetScreenState extends ConsumerState<TweetScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    // Fetch the replies based on the tweet and the user's profile.
    Future.delayed(
      const Duration(seconds: 0),
      () {
        widget.whom == 0
            ? ref
                .read(homeNotifierProvider.notifier)
                .getRepliers(tweetId: widget.tweet.id ?? '')
            : ref
                .read(profileNotifierProvider.notifier)
                .getRepliers(tweetId: widget.tweet.id ?? '');
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final userProvider = ref.watch(authNotifierProvider);
    final homeProvider = ref.watch(homeNotifierProvider);

    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 65,
        backgroundColor: AppColors.pureBlack,
        title: const Text(
          'Post',
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
                  // Display the tweet component.
                  TweetComponent(
                    tweet: widget.tweet,
                    index: widget.index,
                    whom: widget.whom, // 0 -> Home , 1-> Profile
                    inMyProfile:
                        ref.read(authNotifierProvider).user!.username ==
                                ref
                                    .read(profileNotifierProvider)
                                    .userProfile
                                    .username
                            ? 1
                            : 0,
//if i am in myProfile-> 1 , Other profile-> 1
                  ),
                  // Display the list of replies based on the context.
                  widget.whom == 0
                      ? homeProvider.loading
                          ? const Center(child: CircularProgressIndicator())
                          : Column(
                              children: ref
                                  .watch(homeNotifierProvider)
                                  .repliersList
                                  .data!
                                  .map<Widget>(
                                    (reply) => Reply(
                                      replier: reply,
                                      whom: widget.whom,
                                    ),
                                  )
                                  .toList(),
                            )
                      : widget.whom == 1
                          ? ref.watch(profileNotifierProvider).loading
                              ? const Center(child: CircularProgressIndicator())
                              : Column(
                                  children: ref
                                      .watch(profileNotifierProvider)
                                      .ProfileTweetsRepliersList
                                      .data!
                                      .map<Widget>(
                                        (reply) => Reply(
                                          replier: reply,
                                          whom: widget.whom,
                                        ),
                                      )
                                      .toList(),
                                )
                          : ref.watch(profileNotifierProvider).loading
                              ? const Center(child: CircularProgressIndicator())
                              : Column(
                                  children: ref
                                      .watch(profileNotifierProvider)
                                      .ProfileLikedTweetsRepliersList
                                      .data!
                                      .map<Widget>(
                                        (reply) => Reply(
                                          replier: reply,
                                          whom: widget.whom,
                                        ),
                                      )
                                      .toList(),
                                ),
                ],
              ),
            )),
            AddReply(
              tweet: widget.tweet,
              index: widget.index,
              whom: widget.whom,
            ),
          ],
        ),
      ),
    );
  }
}
