import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:x_clone/app/routes.dart';
import 'package:x_clone/features/home/ui/widget/main_drawer_widget.dart';
import 'package:x_clone/theme/app_assets.dart';
import 'package:x_clone/theme/app_colors.dart';

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
    ];

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            backgroundColor: AppColors.pureBlack,
            actions: [
              GestureDetector(
                onTap: () {
                  Scaffold.of(context).openDrawer();
                },
                child: const Padding(
                  padding: EdgeInsets.only(left: 5),
                  child: CircleAvatar(
                    backgroundColor: AppColors.whiteColor,
                    //backgroundImage: userImage?.image,
                    radius: 18,
                  ),
                ),
              ),
              const Spacer(),
            ],
            pinned: false,
            floating: true,
            expandedHeight: 0, // Set to 0 to hide the flexible space
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                return Tweets[index];
              },
              childCount: Tweets.length,
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: AppColors.primaryColor,
        onPressed: () {
          Navigator.pushNamed(context, Routes.addTweet);
        },
        child: const Icon(
          Icons.add,
          color: AppColors.whiteColor,
        ),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
