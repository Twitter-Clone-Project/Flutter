import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:x_clone/features/auth/ui/widgets/custom_button.dart';

import '../../../app/routes.dart';
import '../../../theme/app_assets.dart';
import '../../../theme/app_colors.dart';
import '../../../utils/utils.dart';
import '../../auth/data/providers/auth_provider.dart';
import '../../home/data/providers/home_provider.dart';
import '../data/providers/chat_provider.dart';

class ChatsScreen extends StatefulHookConsumerWidget {
  const ChatsScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _ChatScreenState();
}

class _ChatScreenState extends ConsumerState<ChatsScreen> {
  @override
  void initState() {
    Future.delayed(const Duration(seconds: 0), () {
      ref.read(chatNotifierProvider.notifier).getChatsData();
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final chatState = ref.watch(chatNotifierProvider);
    return SafeArea(
      child: Scaffold(
        body:
        Column(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(vertical: 10,),
              width: MediaQuery.of(context).size.width*0.9,
              child: Row(
                children: [
                  InkWell(
                    onTap: () {
                      Scaffold.of(context).openDrawer();
                    },
                    child:
                    ClipOval(
                      child: CachedNetworkImage(
                        width: 40,
                        height: 40,
                        fit: BoxFit.cover,
                        imageUrl: ref
                            .watch(authNotifierProvider)
                            .user!
                            .profileImageURL ?? '',
                        placeholder: (context, url) => Image.asset(
                            AppAssets.whiteLogo,
                            fit: BoxFit.cover),
                        errorWidget: (context, url, error) =>
                            Image.asset(AppAssets.whiteLogo,
                                fit: BoxFit.cover),
                      ),
                    ),

                  ),
                  const Spacer(),
                  Text('Messages', style: Theme.of(context).textTheme.headline6),
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
            SizedBox(
              height: 40,
              width: MediaQuery.of(context).size.width*0.9,
              child: TextField(
                textAlign: TextAlign.center,
                onTap: () {
                  // Navigator.pushNamed(context, Routes.searchResultsScreen, arguments: "");

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
                  hintText: 'Search Direct Messages',
                ),
              ),
            ),
            const Divider(),
            chatState.loading? Padding(
              padding: EdgeInsets.only(top: MediaQuery.of(context).size.height*0.45),
              child: const Center(child: CircularProgressIndicator(),),
            ):
            chatState.conversationsResponse.conversations.isEmpty? const Center(child: Text("No Chats"),):
            Expanded(
              child: ListView.separated(
                itemBuilder: (BuildContext context, int index) =>
                InkWell(
                  onTap: () {
                    Navigator.pushNamed(context, Routes.chatScreen, arguments: chatState.conversationsResponse.conversations[index]);
                  },
                  child: Container(
                    width: double.infinity,
                    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                    child: Row(
                      children: [
                        ClipOval(
                          child: CachedNetworkImage(
                            width: 50,
                            height: 50,
                            fit: BoxFit.cover,
                            imageUrl: chatState.conversationsResponse.conversations[index].contact!.imageUrl!,
                            placeholder: (context, url) => Image.asset(
                                AppAssets.whiteLogo,
                                fit: BoxFit.cover),
                            errorWidget: (context, url, error) =>
                                Image.asset(AppAssets.whiteLogo,
                                    fit: BoxFit.cover),
                          ),
                        ),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    SizedBox(
                                      width: MediaQuery.of(context).size.width*0.55,
                                      child: RichText(
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                        text: TextSpan(
                                          children: [
                                            TextSpan(
                                              text: chatState.conversationsResponse.conversations[index].contact!.name!,
                                              style: const TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 18,
                                                color: Colors.white,
                                              ),
                                            ),
                                            TextSpan(
                                              text: ' @${chatState.conversationsResponse.conversations[index].contact!.username}',
                                              style: const TextStyle(
                                                fontWeight: FontWeight.w300,
                                                fontSize: 16,
                                                color: Colors.white,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    const Spacer(),
                                    Text(getFormattedDate(chatState.conversationsResponse.conversations[index].lastMessage!.timestamp),
                                        style: Theme.of(context).textTheme.bodyText2),
                                    if(chatState.conversationsResponse.conversations[index].lastMessage!.isSeen==false)
                                      const Padding(
                                        padding: EdgeInsets.only(left : 5.0),
                                        child: Icon(Icons.circle, color: Colors.blue, size: 10,),
                                      )

                                  ],
                                ),
                                const SizedBox(height: 5,),
                                Text(chatState.conversationsResponse.conversations[index].lastMessage!.text!,
                                    style: Theme.of(context).textTheme.bodyText2),
                              ],
                            ),
                          )
                        ),
                      ],
                    ),
                  ),
                ),

                separatorBuilder: (BuildContext context, int index) => const SizedBox(height: 10,),
                itemCount: chatState.conversationsResponse.conversations.length,

              ),
            ),
          ],
        ),
      ),
    );
  }

}
