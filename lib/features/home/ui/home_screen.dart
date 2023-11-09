import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:x_clone/theme/app_assets.dart';

import '../../../app/widgets/animation/shimmer/shimmer_loading_anim.dart';
import '../data/providers/home_provider.dart';
import 'package:x_clone/app/widgets/tweet_UI.dart';

class HomeScreen extends StatefulHookConsumerWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen>
    with AutomaticKeepAliveClientMixin {
  @override
  void initState() {
    Future.delayed(const Duration(seconds: 0), () {
      // ref.read(homeNotifierProvider.notifier).getHomeData();
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    final homeProvider = ref.watch(homeNotifierProvider);
    List<TweetCompose> Tweets = [
      TweetCompose(
        date: '3h',
        username: 'Abdelrahman saber',
        commentCount: 5,
        likeCount: 10,
        retweetCount: 4,
        text: 'Ghaza was attacked by isrealian army  ',
        viewsCount: 3,
        handle: '@BinHani',
        verified: false,
        userImage: Image.asset('assets/images/EM.jpg'),
        //image: Test with any photo,
      ),
      TweetCompose(
        date: '3h',
        username: 'Abdelrahman saber',
        commentCount: 5,
        likeCount: 10,
        retweetCount: 4,
        text: 'Ghaza was attacked by isrealian army ',
        viewsCount: 3,
        handle: '@BinHani',
        verified: false,
        userImage: Image.asset('assets/images/EM.jpg'),
        //image: Test with any photo,
      ),
      TweetCompose(
        date: '3h',
        username: 'Abdelrahman saber',
        commentCount: 5,
        likeCount: 10,
        retweetCount: 4,
        text: 'Ghaza was attacked by isrealian army  ',
        viewsCount: 3,
        handle: '@BinHani',
        verified: false,
        userImage: Image.asset('assets/images/EM.jpg'),
        //image: Test with any photo,
      ),
    ];
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: ListView.builder(
            itemCount: Tweets.length,
            itemBuilder: (ctx, index) => Tweets[index],
          ),
        ),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
