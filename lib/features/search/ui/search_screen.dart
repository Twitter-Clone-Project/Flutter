import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:x_clone/app/routes.dart';
import 'package:x_clone/features/auth/data/providers/auth_provider.dart';
import 'package:x_clone/features/search/data/providers/search_provider.dart';
import 'package:x_clone/theme/app_colors.dart';
import 'package:x_clone/theme/app_text_style.dart';

import '../../../theme/app_assets.dart';

/// A screen widget that displays a search interface.
///
/// This widget is responsible for rendering the search screen UI, including the app bar,
/// search input field, and a list of trending search results.
class SearchScreen extends StatefulHookConsumerWidget {
  const SearchScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _SearchScreenState();
}

class _SearchScreenState extends ConsumerState<SearchScreen> {
  @override
  void initState() {
    // Fetch trending data when the screen is initialized.
    Future.delayed(
      const Duration(seconds: 0),
      () {
        ref.read(searchNotifierProvider.notifier).fetchTrendingData();
      },
    );

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: AppColors.pureBlack,
          leading: InkWell(
            onTap: () {
              // Navigate to the profile screen when the user taps on the leading icon.
              Navigator.pushNamed(context, Routes.profileScreen,
                  arguments: ref.watch(authNotifierProvider).user?.username);
            },
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ClipOval(
                  child: CachedNetworkImage(
                    width: 40,
                    height: 40,
                    fit: BoxFit.cover,
                    imageUrl: ref.watch(authNotifierProvider).user!.imageUrl ?? 'https://kady-twitter-images.s3.amazonaws.com/defaultProfile.jpg',
                    placeholder: (context, url) => Container(
                      color: Color(AppColors.blackColor.value),
                    ),
                    errorWidget: (context, url, error) =>
                        Image.asset(AppAssets.whiteLogo,
                            fit: BoxFit.cover),
                  ),
                )
              ],
            ),
          ),
          title: SizedBox(
            height: 40,
            child: TextField(
              onTap: () {
                // Navigate to the search results screen when the user taps on the search input field.
                Navigator.pushNamed(context, Routes.searchResultsScreen,
                    arguments: "");
              }, //controller: searchController,
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
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: MediaQuery.of(context).size.height * 0.01),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Text(
                'Trending',
                style: AppTextStyle.textThemeDark.headlineSmall!
                    .copyWith(fontWeight: FontWeight.bold),
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount:
                    ref.watch(searchNotifierProvider).trendingList.data!.length,
                itemBuilder: (ctx, index) => GestureDetector(
                  onTap: () {
                    // Navigate to search_allresults_screen with the trend as a query
                    String trendQuery = ref
                        .watch(searchNotifierProvider)
                        .trendingList
                        .data![index]
                        .name!;
                    Navigator.pushNamed(
                      context,
                      Routes.searchAllResultsScreen,
                      arguments: "$trendQuery",
                    );
                  },
                  child: ListTile(
                    title: Text(
                      '${index + 1}. Trending',
                      style: AppTextStyle.textThemeDark.bodyMedium!.copyWith(
                        fontWeight: FontWeight.bold,
                        color: AppColors.darkGray,
                      ),
                    ),
                    subtitle: Text(
                      '${ref.watch(searchNotifierProvider).trendingList.data![index].name}',
                      style: AppTextStyle.textThemeDark.bodyMedium!.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
            )
          ],
        ));
  }
}
