import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:x_clone/app/routes.dart';
import 'package:x_clone/features/chat/data/providers/chat_provider.dart';
import 'package:x_clone/features/search/data/providers/search_provider.dart';
import 'package:x_clone/theme/app_colors.dart';
import 'package:x_clone/theme/app_text_style.dart';

/// A screen widget for searching chats.
///
/// This widget allows users to search for chats by entering keywords in a search field.
/// It displays a list of search results and provides functionality to start a conversation with a selected user.
class ChatSearchScreen extends StatefulHookConsumerWidget {
  const ChatSearchScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _ChatSearchScreenState();
}

class _ChatSearchScreenState extends ConsumerState<ChatSearchScreen> {
  late TextEditingController _searchController;
  late FocusNode _searchFocusNode;

  @override
  void initState() {
    super.initState();
    _searchController = TextEditingController(); // Set the initial text
    _searchFocusNode = FocusNode();

    // Request focus on the search field when the screen is first opened
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      FocusScope.of(context).requestFocus(_searchFocusNode);
    });

    // Reset searched users
    ref.read(searchNotifierProvider.notifier).resetSearchedUsers();

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
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final searchProvider = ref.watch(searchNotifierProvider);

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60.0), // Set the preferred height
        child: Column(
          children: [
            AppBar(
              backgroundColor: AppColors.pureBlack,
              leading: IconButton(
                icon: const Icon(
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
                  onChanged: (String value) async {
                    if (value != "") {
                      await ref
                          .read(searchNotifierProvider.notifier)
                          .getSearchedUsers(page: 1, query: value);
                    }
                  },
                  controller: _searchController,
                  focusNode: _searchFocusNode,
                  onSubmitted: (value) {
                    ref.read(searchNotifierProvider.notifier).getSearchedTweets(
                        page: 1, query: value.replaceAll("#", ""));
                    ref.read(searchNotifierProvider.notifier).getSearchedUsers(
                        page: 1, query: value.replaceAll("#", ""));
                    Navigator.pushNamed(context, Routes.searchAllResultsScreen,
                        arguments: value);
                  },
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.all(10).copyWith(
                      left: 20,
                    ),
                    fillColor: Colors.transparent,
                    filled: true,
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(50),
                      borderSide: const BorderSide(
                        color: Colors.transparent,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(50),
                      borderSide: const BorderSide(
                        color: Colors.transparent,
                      ),
                    ),
                    hintText: 'Search Direct Messages',
                  ),
                ),
              ),
            ),
            const Divider(
              thickness: 0.2,
              height: 1,
              color: AppColors
                  .lightThinTextGray, // You can set the color of the divider
            ),
          ],
        ),
      ),
      body: searchProvider.loading
          ? const Center(
              child: CircularProgressIndicator(
              color: AppColors.whiteColor,
              strokeWidth: 1,
            ))
          : ListView.builder(
              itemCount: searchProvider.usersList.data.length,
              itemBuilder: (context, index) {
                final user =
                    ref.watch(searchNotifierProvider).usersList.data[index];
                return Column(
                  children: [
                    InkWell(
                      onTap: () {
                        ref
                            .read(chatNotifierProvider.notifier)
                            .startConversation(user.id!);
                        Navigator.pop(context);
                      },
                      child: ListTile(
                        title: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                CircleAvatar(
                                  backgroundColor: AppColors.whiteColor,
                                  backgroundImage: NetworkImage(user
                                          .profileImageURL ??
                                      'https://kady-twitter-images.s3.amazonaws.com/defaultProfile.jpg'),
                                  radius: 20,
                                ),
                                const SizedBox(width: 8),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        user.screenName!,
                                        style: AppTextStyle
                                            .textThemeDark.bodyLarge!
                                            .copyWith(
                                          fontWeight: FontWeight.bold,
                                        ),
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                      Text(
                                        '@${user.username}',
                                        style: AppTextStyle
                                            .textThemeDark.bodyLarge!
                                            .copyWith(
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
    );
  }
}
