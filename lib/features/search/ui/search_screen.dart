import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:x_clone/app/routes.dart';
import 'package:x_clone/features/auth/data/providers/auth_provider.dart';
import 'package:x_clone/features/search/data/providers/search_provider.dart';
import 'package:x_clone/theme/app_colors.dart';
import 'package:x_clone/theme/app_text_style.dart';

class SearchScreen extends StatefulHookConsumerWidget {
  const SearchScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _SearchScreenState();
}

class _SearchScreenState extends ConsumerState<SearchScreen> {
  @override
  void initState() {
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
              Navigator.pushNamed(context, Routes.profileScreen,
                  arguments: ref.watch(authNotifierProvider).user?.username);
            },
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircleAvatar(
                  radius: 17,
                  backgroundColor: const Color.fromARGB(255, 59, 158, 59),
                  backgroundImage: NetworkImage(
                      ref.watch(authNotifierProvider).user!.profileImageURL ??
                          ''),
                  child: Text(
                    ref.watch(authNotifierProvider).user!.name![0],
                    style: AppTextStyle.textThemeDark.headline6!.copyWith(
                      color: Colors.white,
                      fontSize: 17,
                    ),
                  ),
                ),
              ],
            ),
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
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: MediaQuery.of(context).size.height * 0.01),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Text(
                'Trends',
                style: AppTextStyle.textThemeDark.headlineSmall!
                    .copyWith(fontWeight: FontWeight.bold),
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount:
                ref.watch(searchNotifierProvider).trendingList.data!.length,
                itemBuilder: (ctx, index) => ListTile(
                  title: Text(
                    '${index + 1}. Trending',
                    style: AppTextStyle.textThemeDark.bodyMedium!.copyWith(
                        fontWeight: FontWeight.bold, color: AppColors.darkGray),
                  ),
                  subtitle: Text(
                    '#${ref.watch(searchNotifierProvider).trendingList.data![index].name}',
                    style: AppTextStyle.textThemeDark.bodyMedium!.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            )
          ],
        ));
  }
}