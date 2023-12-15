import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:x_clone/app/routes.dart';
import 'package:x_clone/features/auth/data/providers/auth_provider.dart';
import 'package:x_clone/features/search/data/providers/search_provider.dart';
import 'package:x_clone/theme/app_colors.dart';
import 'package:x_clone/theme/app_text_style.dart';

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

  @override
  void initState() {
    super.initState();
    _searchController = TextEditingController();
    _searchFocusNode = FocusNode();
    _tabController = TabController(length: 2, vsync: this);

    Future.delayed(
      const Duration(seconds: 0),
      () {
        ref.read(searchNotifierProvider.notifier).fetchTrendingData();
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
                color: Colors.white, // Set the color of the back button
              ),
              onPressed: () {
                // Dismiss the keyboard before navigating back
                FocusScope.of(context).unfocus();
                Navigator.pop(context);
              },
            ),
            title: SizedBox(
              height: 40,
              child: TextField(
                onTap: () {
                  Navigator.pushNamed(context, Routes.searchResultsScreen);
                },              //controller: searchController,
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
                      fontFamily:
                      'Chirp', // Set your custom font here
                    ),
                  ),
                ),
                Tab(
                  child: Text(
                    "Users",
                    style: TextStyle(
                      color: AppColors.whiteColor,
                      fontSize: 16,
                      fontFamily:
                      'Chirp', // Set your custom font here
                    ),
                  ),                )
              ],
              indicatorColor: Colors.white, // Set your desired color here
            )),
        body: TabBarView(
          children: [
            Text("tweets"),
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
                                  backgroundImage: NetworkImage(user.profileImageUrl ?? 'https://kady-twitter-images.s3.amazonaws.com/defaultProfile.jpg'),
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
    );
  }
}
