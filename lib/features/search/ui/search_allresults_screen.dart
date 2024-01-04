import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:x_clone/app/routes.dart';
import 'package:x_clone/features/auth/data/providers/auth_provider.dart';
import 'package:x_clone/features/search/data/providers/search_provider.dart';
import 'package:x_clone/theme/app_colors.dart';
import 'package:x_clone/theme/app_text_style.dart';

import '../../../app/widgets/tweet_UI.dart';
import '../../../theme/app_assets.dart';

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
  int tweetsPageIndex = 1;
  int usersPageIndex = 1;

  @override
  void initState() {
    super.initState();
    _searchController =
        TextEditingController(text: widget.query); // Set the initial text
    _searchFocusNode = FocusNode();
    _tweetsController = RefreshController();
    _usersController = RefreshController();
    _tabController = TabController(length: 3, vsync: this);

    Future.delayed(
      const Duration(seconds: 0),
      () {
        loadData();
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

  /// Resets the search state to its initial loading state.
  ///
  /// This function is used to reset the search state to its initial loading state. It triggers the `loading` method of the `searchNotifierProvider` notifier, which sets the search state to loading and updates the UI accordingly.
  ///
  /// Example usage:
  /// ```dart
  /// void resetSearch() {
  ///   searchAllResultsScreen.reset();
  /// }
  /// ```
  void reset() async {
    await ref.read(searchNotifierProvider.notifier).loading();
  }

  /// A screen that displays search results for tweets, users, and mentions.
  ///
  /// This screen allows the user to search for specific content within the X app.
  /// It includes a search bar, tabs for different search categories (tweets, users, mentions),
  /// and a body that displays the search results based on the selected tab.
  @override
  Widget build(BuildContext context) {
    final searchProvider = ref.watch(searchNotifierProvider);

    return WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: AppColors.pureBlack,
            leading: IconButton(
              icon: const Icon(
                Icons.arrow_back,
                color: Colors.white,
              ),
              onPressed: () {
                FocusScope.of(context).unfocus();
                reset();
                Navigator.pop(context);
              },
            ),
            title: SizedBox(
              height: 40,
              child: TextField(
                controller: _searchController,
                focusNode: _searchFocusNode,
                readOnly: true,
                onTap: () {
                  if (widget.query[0] != '#') {
                    reset();
                    Navigator.pop(context);
                  }
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
                ),
                Tab(
                  child: Text(
                    "Mentions",
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
          body: searchProvider.loading
              ? const Center(
                  child: CircularProgressIndicator(
                  color: AppColors.whiteColor,
                  strokeWidth: 1,
                ))
              : TabBarView(
                  children: [
                    ref.watch(searchNotifierProvider).tweetList.data.isEmpty
                        ? SmartRefresher(
                            controller: RefreshController(),
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
                            onLoading: _onTweetsLoading,
                            onRefresh: _onRefresh,
                            child: const Center(
                              child: Text(
                                "No Tweets",
                                style: const TextStyle(
                                  color: AppColors.whiteColor,
                                  fontSize: 22,
                                  fontFamily: 'Chirp',
                                ),
                              ),
                            ),
                          )
                        : SmartRefresher(
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
                            onLoading: _onTweetsLoading,
                            onRefresh: _onRefresh,
                            child: ListView.builder(
                              itemCount: ref
                                  .watch(searchNotifierProvider)
                                  .tweetList
                                  .data
                                  .length,
                              itemBuilder: (BuildContext context, int index) {
                                final tweet = ref
                                    .watch(searchNotifierProvider)
                                    .tweetList
                                    .data[index];

                                return Column(
                                  children: [
                                    if (index == 0)
                                      SizedBox(
                                          height:
                                              16.0), // Add space for the first item
                                    InkWell(
                                      child: TweetCompose(
                                        tweet: tweet,
                                        index: index,
                                        whom: 3,
                                        inMyProfile: 0, // 0->Home, 1->Profile
                                      ),
                                      onTap: () {
                                        Navigator.pushNamed(
                                          context,
                                          Routes.tweetScreen,
                                          arguments: {
                                            "tweet": tweet,
                                            "index": index,
                                            "whom": 3, // 0->Home, 1->Profile
                                          },
                                        );
                                      },
                                    ),
                                    if (index <
                                        ref
                                                .watch(searchNotifierProvider)
                                                .tweetList
                                                .data
                                                .length -
                                            1)
                                      const Divider(), // Add divider for all items except the last one
                                  ],
                                );
                              },
                            ),
                          ),
                    searchProvider.loading
                        ? const Center(
                            child: CircularProgressIndicator(
                            color: AppColors.whiteColor,
                            strokeWidth: 1,
                          ))
                        : ref
                                .watch(searchNotifierProvider)
                                .usersList
                                .data
                                .isEmpty
                            ? SmartRefresher(
                                controller: RefreshController(),
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
                                onLoading: _onTweetsLoading,
                                onRefresh: _onRefresh,
                                child: const Center(
                                  child: Text(
                                    "No Users",
                                    style: const TextStyle(
                                      color: AppColors.whiteColor,
                                      fontSize: 22,
                                      fontFamily: 'Chirp',
                                    ),
                                  ),
                                ),
                              )
                            : SmartRefresher(
                                controller: _usersController,
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
                                onLoading: _onUsersLoading,
                                onRefresh: _onRefresh,
                                child: ListView.builder(
                                  itemCount:
                                      searchProvider.usersList.data!.length,
                                  itemBuilder: (context, index) {
                                    final user = ref
                                        .watch(searchNotifierProvider)
                                        .usersList
                                        .data![index];
                                    return Column(
                                      children: [
                                        ListTile(
                                          title: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Row(
                                                children: [
                                                  GestureDetector(
                                                      onTap: () {
                                                        Navigator.pushNamed(
                                                            context,
                                                            Routes
                                                                .profileScreen,
                                                            arguments:
                                                                user.username);
                                                      },
                                                      child: ClipOval(
                                                        child:
                                                            CachedNetworkImage(
                                                          width: 40,
                                                          height: 40,
                                                          fit: BoxFit.cover,
                                                          imageUrl: user
                                                                  .profileImageURL ??
                                                              'https://kady-twitter-images.s3.amazonaws.com/defaultProfile.jpg',
                                                          placeholder:
                                                              (context, url) =>
                                                                  Container(
                                                            color: Color(
                                                                AppColors
                                                                    .blackColor
                                                                    .value),
                                                          ),
                                                          errorWidget: (context,
                                                                  url, error) =>
                                                              Image.asset(
                                                                  AppAssets
                                                                      .whiteLogo,
                                                                  fit: BoxFit
                                                                      .cover),
                                                        ),
                                                      )),
                                                  const SizedBox(width: 8),
                                                  Expanded(
                                                    child: Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Text(
                                                          user.screenName!,
                                                          style: AppTextStyle
                                                              .textThemeDark
                                                              .bodyLarge!
                                                              .copyWith(
                                                            fontWeight:
                                                                FontWeight.bold,
                                                          ),
                                                          maxLines: 1,
                                                          overflow: TextOverflow
                                                              .ellipsis,
                                                        ),
                                                        Text(
                                                          '@${user.username}',
                                                          style: AppTextStyle
                                                              .textThemeDark
                                                              .bodyLarge!
                                                              .copyWith(
                                                            color: AppColors
                                                                .lightGray,
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
                                        const SizedBox(
                                          height: 4,
                                        ),
                                        // const Divider(height: 1, thickness: 0.2, color: AppColors.lightThinTextGray), // Divider between items
                                        // const SizedBox(height: 4,),
                                      ],
                                    );
                                  },
                                ),
                              ),
                    Center(
                      child: const Text(
                        "No Mentions",
                        style: TextStyle(
                          color: AppColors.whiteColor,
                          fontSize: 22,
                          fontFamily: 'Chirp',
                        ),
                      ),
                    )
                  ],
                ),
        ),
      ),
    );
  }

  /// Callback function to handle the refresh action.
  ///
  /// This function is called when the user triggers a refresh action on the screen.
  /// It reloads the search results for tweets and users by calling the [loadData] function.
  /// After the data is loaded, it completes the refresh action for both the tweets and users controllers.
  void _onRefresh() async {
    await loadData();
    _tweetsController.refreshCompleted();
    _usersController.refreshCompleted();
  }

  /// Loads the searched tweets and users based on the provided query.
  ///
  /// This function is responsible for fetching the searched tweets and users
  /// from the server based on the given query. It replaces the '#' character
  /// in the query with an empty string before making the API calls.
  ///
  /// Example usage:
  /// ```dart
  /// loadData();
  /// ```
  loadData() async {
    await ref.read(searchNotifierProvider.notifier).getSearchedTweets(
        page: tweetsPageIndex, query: widget.query.replaceAll("#", ""));
    await ref.read(searchNotifierProvider.notifier).getSearchedUsers(
        page: usersPageIndex, query: widget.query.replaceAll("#", ""));
  }

  /// Handles the loading of search results for users.
  ///
  /// This function checks if all the search results for users have been loaded.
  /// If all the results have been loaded, it notifies the users controller to display a "No Data" message.
  /// If there are more results to load, it increments the page index and calls the `getSearchedUsers` function
  /// from the `searchNotifierProvider` to fetch the next page of search results.
  /// Finally, it notifies the users controller that the loading is complete.
  void _onUsersLoading() async {
    final provider = ref.read(searchNotifierProvider);

    if (provider.usersList.data.length == provider.usersList.total) {
      _usersController.loadNoData();
    } else {
      if (usersPageIndex == 0) usersPageIndex++;
      usersPageIndex++;
      await ref
          .read(searchNotifierProvider.notifier)
          .getSearchedUsers(query: widget.query, page: usersPageIndex);
      _usersController.loadComplete();
    }
  }

  /// Handles the loading of search results for tweets.
  ///
  /// This function checks if all the search results for tweets have been loaded.
  /// If all the results have been loaded, it notifies the tweets controller to display a "No Data" message.
  /// If there are more results to load, it increments the page index and calls the `getSearchedTweets` function
  /// from the `searchNotifierProvider` to fetch the next page of search results.
  /// Finally, it notifies the tweets controller that the loading is complete.
  void _onTweetsLoading() async {
    final provider = ref.read(searchNotifierProvider);

    if (provider.tweetList.data.length == provider.tweetList.total) {
      _tweetsController.loadNoData();
    } else {
      if (tweetsPageIndex == 0) tweetsPageIndex++;
      tweetsPageIndex++;
      await ref
          .read(searchNotifierProvider.notifier)
          .getSearchedTweets(query: widget.query, page: tweetsPageIndex);
      _tweetsController.loadComplete();
    }
  }

  /// A screen that displays the search results for tweets and users.
  ///
  /// This screen is responsible for displaying the search results for tweets and users.
  /// It contains two functions, `_onTweetsLoading` and `_onUsersLoading`, which are called
  /// when the screen is loading. These functions are responsible for loading the tweets
  /// and users data respectively.
  ///
  /// Example usage:
  /// ```dart
  /// SearchAllResultsScreen screen = SearchAllResultsScreen();
  /// screen._onLoading();
  /// ```
  void _onLoading() async {
    _onTweetsLoading();
    _onUsersLoading();
  }
}
