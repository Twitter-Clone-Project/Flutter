import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:x_clone/app/routes.dart';
import 'package:x_clone/features/auth/data/providers/auth_provider.dart';
import 'package:x_clone/features/search/data/providers/search_provider.dart';
import 'package:x_clone/theme/app_colors.dart';
import 'package:x_clone/theme/app_text_style.dart';

import '../../../app/widgets/tweet_UI.dart';

class SearchAllResultsScreen extends StatefulHookConsumerWidget {
  const SearchAllResultsScreen({super.key, required this.query});
  final String query;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _SearchAllResultsScreenState();
}

class _SearchAllResultsScreenState extends ConsumerState<SearchAllResultsScreen>
    with SingleTickerProviderStateMixin {
  late TextEditingController _searchController;
  late FocusNode _searchFocusNode;
  late TabController _tabController;
  late RefreshController _tweetsController;
  late RefreshController _usersController;


  @override
  void initState() {
    super.initState();
    _searchController = TextEditingController(text: widget.query); // Set the initial text
    _searchFocusNode = FocusNode();
    _tweetsController = RefreshController();
    _usersController = RefreshController();
    _tabController = TabController(length: 2, vsync: this);

    Future.delayed(
      const Duration(seconds: 0),
          () {
            ref
                .read(searchNotifierProvider.notifier)
                .getSearchedTweets(query: widget.query.replaceAll("#", ""));
            ref
                .read(searchNotifierProvider.notifier)
                .getSearchedUsers(query: widget.query.replaceAll("#", ""));
      },
    );
  }

  @override
  void dispose() {
    _searchController.dispose();
    _searchFocusNode.dispose();
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final searchProvider = ref.watch(searchNotifierProvider);

    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: AppColors.pureBlack,
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back,
              color: Colors.white,
            ),
            onPressed: () {
              FocusScope.of(context).unfocus();
              Navigator.pop(context);
            },
          ),
          title: SizedBox(
            height: 40,
            child: TextField(
              controller: _searchController,
              focusNode: _searchFocusNode,
              onTap: () {
                Navigator.pushNamed(context, Routes.searchResultsScreen, arguments: _searchController.text);

              },
              onSubmitted: (value) {},
              decoration: InputDecoration(
                contentPadding: const EdgeInsets.all(10).copyWith(
                  left: 20,
                ),
                fillColor: AppColors.borderDarkGray,
                filled: true,
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(50),
                  borderSide: const BorderSide(
                    color: AppColors.borderDarkGray,
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(50),
                  borderSide: const BorderSide(
                    color: AppColors.borderDarkGray,
                  ),
                ),
                hintText: 'Search X',
              ),
            ),
          ),
          bottom: const TabBar(
            tabs: [
              Tab(
                child: Text(
                  "Tweets",
                  style: TextStyle(
                    color: AppColors.whiteColor,
                    fontSize: 16,
                    fontFamily: 'Chirp',
                  ),
                ),
              ),
              Tab(
                child: Text(
                  "Users",
                  style: TextStyle(
                    color: AppColors.whiteColor,
                    fontSize: 16,
                    fontFamily: 'Chirp',
                  ),
                ),
              )
            ],
            indicatorColor: Colors.white,
          ),
        ),
        body: SmartRefresher(
            controller: _tweetsController,
            header: const ClassicHeader(
              releaseText: 'Release to refresh',
              refreshingText: 'Refreshing...',
              completeText: 'Refresh completed',
              failedText: 'Refresh failed',
              idleText: 'Pull down to refresh',
            ),
            enablePullDown: true,
            enablePullUp: true,
            footer: const ClassicFooter(
              loadingText: 'Load for more',
            ),
            // onLoading: _onTweetsLoading,
            onRefresh: _onRefresh,
            child: TabBarView(
            children: [
                    ref
                    .watch(searchNotifierProvider)
                    .tweetList
                    .data
                    .isEmpty
                    ? const Center(
                  child: Text(
                    "No Tweets",
                    style: const TextStyle(
                      color: AppColors.whiteColor,
                      fontSize: 22,
                      fontFamily: 'Chirp',
                    ),
                  ),
                )
                    : ListView.separated(
                  physics:
                  const NeverScrollableScrollPhysics(),
                  itemCount: ref
                      .watch(
                      searchNotifierProvider)
                      .tweetList
                      .data
                      .length,
                  itemBuilder:
                      (BuildContext context,
                      int index) =>
                      InkWell(
                        child: TweetCompose(
                          tweet: ref
                              .watch(
                              searchNotifierProvider)
                              .tweetList
                              .data[index],
                          index: index,
                          whom:
                          3, //0->Home , 1->Profile
                        ),
                        onTap: () {
                          Navigator.pushNamed(
                            context,
                            Routes.tweetScreen,
                            arguments: {
                              "tweet": ref
                                  .watch(
                                  searchNotifierProvider)
                                  .tweetList
                                  .data[index],
                              "index": index,
                              "whom":
                              3, //0->Home , 1->Profile
                            },
                          );
                        },
                      ),
                  separatorBuilder:
                      (BuildContext context,
                      int index) =>
                  const Divider(),
                ),
              searchProvider.loading
                  ? const Center(child: CircularProgressIndicator(color: AppColors.whiteColor,
                strokeWidth: 1,))
                  : ListView.builder(
                itemCount: searchProvider.usersList.data!.length,
                itemBuilder: (context, index) {
                    final user = ref.watch(searchNotifierProvider).usersList.data![index];
                    return Column(
                      children: [
                        ListTile(
                          title: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      Navigator.pushNamed(context, Routes.profileScreen, arguments: user.username);
                                    },
                                    child: CircleAvatar(
                                      backgroundColor: AppColors.whiteColor,
                                      backgroundImage: NetworkImage(user.profileImageURL ?? 'https://kady-twitter-images.s3.amazonaws.com/defaultProfile.jpg'),
                                      radius: 20,
                                    ),
                                  ),
                                  const SizedBox(width: 8),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          user.name!,
                                          style: AppTextStyle.textThemeDark.bodyLarge!.copyWith(
                                            fontWeight: FontWeight.bold,
                                          ),
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                        Text(
                                          '@${user.username}',
                                          style: AppTextStyle.textThemeDark.bodyLarge!.copyWith(
                                            color: AppColors.lightGray,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          // trailing: buildTrailingWidget(follower, context),
                        ),
                        const SizedBox(height: 4,),
                        // const Divider(height: 1, thickness: 0.2, color: AppColors.lightThinTextGray), // Divider between items
                        // const SizedBox(height: 4,),
                      ],
                    );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _onRefresh() async {
    await loadData();
    _tweetsController.refreshCompleted();
    _usersController.refreshCompleted();
  }
  loadData() async {
    await ref
        .read(searchNotifierProvider.notifier)
        .getSearchedTweets(query: widget.query.replaceAll("#", ""));
    await ref
        .read(searchNotifierProvider.notifier)
        .getSearchedUsers(query: widget.query.replaceAll("#", ""));
  }
}
