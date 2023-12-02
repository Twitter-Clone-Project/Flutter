import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:x_clone/app/routes.dart';
import 'package:x_clone/theme/app_colors.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
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
                    padding: const EdgeInsets.symmetric(
                        vertical: 20, horizontal: 10),
                    child: Row(
                      children: [
                        InkWell(
                          onTap: () {
                            Scaffold.of(context).openDrawer();
                          },
                          child: CircleAvatar(
                            child: CachedNetworkImage(
                              height: MediaQuery.of(context).size.height * 0.05,
                              width: MediaQuery.of(context).size.height * 0.05,
                              fit: BoxFit.scaleDown,
                              color: AppColors.primaryColor,
                              imageUrl:
                                  "${ref.watch(homeNotifierProvider).homeResponse.data?[0].user?.profileImageURL}",
                              placeholder: (context, url) => SvgPicture.asset(
                                  AppAssets.logo,
                                  colorFilter: const ColorFilter.mode(
                                      AppColors.whiteColor, BlendMode.srcIn),
                                  fit: BoxFit.cover),
                              errorWidget: (context, url, error) =>
                                  SvgPicture.asset(AppAssets.logo,
                                      colorFilter: const ColorFilter.mode(
                                          AppColors.whiteColor,
                                          BlendMode.srcIn),
                                      fit: BoxFit.cover),
                            ),
                          ),
                        ),
                        Spacer()
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
                                  ),
                                  onTap: () {
                                    Tweet tweet = ref
                                        .watch(homeNotifierProvider)
                                        .homeResponse
                                        .data![index];
                                    Navigator.pushNamed(
                                      context,
                                      Routes.tweetScreen,
                                      arguments: {
                                        "tweet": tweet,
                                        "index": index,
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
