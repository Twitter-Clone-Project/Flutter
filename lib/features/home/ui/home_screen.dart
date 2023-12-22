import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:x_clone/app/routes.dart';
import 'package:x_clone/features/auth/data/providers/auth_provider.dart';
import 'package:x_clone/theme/app_colors.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:x_clone/theme/app_text_style.dart';
import '../../../theme/app_assets.dart';
import '../data/models/home_response.dart';
import '../data/providers/home_provider.dart';
import 'package:x_clone/app/widgets/tweet_UI.dart';

class HomeScreen extends StatefulHookConsumerWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen>
    with AutomaticKeepAliveClientMixin {
  final RefreshController _controller = RefreshController();
  int pageIndex = 0;
  @override
  void initState() {
    Future.delayed(const Duration(seconds: 0), () {});
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return SafeArea(
      child: Scaffold(
        body: ref.watch(homeNotifierProvider).loading
            ? const Center(child: CircularProgressIndicator())
            : Column(
                children: [
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
                    child: Row(
                      children: [
                        InkWell(
                          onTap: () {
                            Scaffold.of(context).openDrawer();
                          },
                          child: CircleAvatar(
                              backgroundColor:
                                  const Color.fromARGB(255, 59, 158, 59),
                              backgroundImage: NetworkImage(ref
                                      .watch(authNotifierProvider)
                                      .user!
                                      .profileImageURL ??
                                  'https://kady-twitter-images.s3.amazonaws.com/defaultProfile.jpg'),
                              child: null),
                        ),
                        const Spacer(),
                        CircleAvatar(
                            backgroundColor:
                                const Color.fromARGB(255, 59, 158, 59),
                            backgroundImage: NetworkImage(
                                'https://img.freepik.com/free-vector/new-2023-twitter-logo-x-icon-design_1017-45418.jpg?size=338&ext=jpg&ga=GA1.1.1546980028.1702425600&semt=ais'),
                            child: null),
                        const Spacer(),
                        IconButton(
                          icon: const Icon(Icons.settings),
                          onPressed: () {
                            //TODO Settings
                          },
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: SizedBox(
                      height: double.infinity,
                      child: SmartRefresher(
                        controller: _controller,
                        enablePullDown: true,
                        enablePullUp: true,
                        footer: const ClassicFooter(
                          loadingText: 'Load for more',
                        ),
                        onLoading: _onLoading,
                        onRefresh: _onRefresh,
                        child: ref
                                .watch(homeNotifierProvider)
                                .homeResponse
                                .data!
                                .isEmpty
                            ? const Center(
                                child: Text("No Tweets"),
                              )
                            : ListView.separated(
                                itemCount: ref
                                    .watch(homeNotifierProvider)
                                    .homeResponse
                                    .data!
                                    .length,
                                itemBuilder:
                                    (BuildContext context, int index) =>
                                        InkWell(
                                  child: TweetCompose(
                                    tweet: ref
                                        .watch(homeNotifierProvider)
                                        .homeResponse
                                        .data![index],
                                    index: index,
                                    whom: 0, //0->Home , 1->Profile
                                  ),
                                  onTap: () {
                                    Navigator.pushNamed(
                                      context,
                                      Routes.tweetScreen,
                                      arguments: {
                                        "tweet": ref
                                            .watch(homeNotifierProvider)
                                            .homeResponse
                                            .data![index],
                                        "index": index,
                                        "whom": 0, //0->Home , 1->Profile
                                      },
                                    );
                                  },
                                ),
                                separatorBuilder:
                                    (BuildContext context, int index) =>
                                        const Divider(),
                              ),
                      ),
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
      ),
    );
  }

  void _onRefresh() async {
    pageIndex = 1;
    await loadData();
    _controller.refreshCompleted();
  }

  void _onLoading() async {
    final provider = ref.read(homeNotifierProvider);

    if (provider.homeResponse.data?.length == provider.homeResponse.total) {
      _controller.loadNoData();
    } else {
      if (pageIndex == 0) pageIndex++;
      pageIndex++;
      await loadData();
      _controller.loadComplete();
    }
  }

  loadData() async {
    await ref.read(homeNotifierProvider.notifier).getTimelineData(
          page: pageIndex,
        );
  }

  @override
  bool get wantKeepAlive => true;
}
