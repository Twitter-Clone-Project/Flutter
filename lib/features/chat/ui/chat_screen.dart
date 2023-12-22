import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:x_clone/features/auth/ui/widgets/custom_button.dart';

import '../../../theme/app_assets.dart';
import '../../../utils/utils.dart';
import '../../auth/data/providers/auth_provider.dart';
import '../../home/data/providers/home_provider.dart';
import '../data/providers/home_provider.dart';

class ChatScreen extends StatefulHookConsumerWidget {
  const ChatScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _ChatScreenState();
}

class _ChatScreenState extends ConsumerState<ChatScreen> {
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
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
              child: Row(
                children: [
                  InkWell(
                    onTap: () {
                      Scaffold.of(context).openDrawer();
                    },
                    child: CircleAvatar(
                        backgroundColor: const Color.fromARGB(255, 59, 158, 59),
                        backgroundImage: NetworkImage(ref
                            .watch(authNotifierProvider)
                            .user!
                            .profileImageURL ??
                            'https://kady-twitter-images.s3.amazonaws.com/defaultProfile.jpg'),
                        child: null),
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
            chatState.loading? Padding(
              padding: EdgeInsets.only(top: MediaQuery.of(context).size.height*0.45),
              child: const Center(child: CircularProgressIndicator(),),
            ):

            chatState.chatResponse.conversations.isEmpty? const Center(child: Text("No Chats"),):
            Expanded(
              child: ListView.separated(
                itemBuilder: (BuildContext context, int index) =>
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  child: Row(
                    children: [
                      ClipOval(
                        child: CachedNetworkImage(
                          width: 50,
                          height: 50,
                          fit: BoxFit.cover,
                          imageUrl: chatState.chatResponse.conversations[index].contact!.imageUrl!,
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
                                            text: chatState.chatResponse.conversations[index].contact!.name!,
                                            style: const TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 18,
                                              color: Colors.white,
                                            ),
                                          ),
                                          TextSpan(
                                            text: ' @${chatState.chatResponse.conversations[index].contact!.username}',
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
                                  Text(getFormattedDate(chatState.chatResponse.conversations[index].lastMessage!.timestamp),
                                      style: Theme.of(context).textTheme.bodyText2),

                                ],
                              ),
                              SizedBox(height: 5,),
                              Text(chatState.chatResponse.conversations[index].lastMessage!.text!,
                                  style: Theme.of(context).textTheme.bodyText2),
                            ],
                          ),
                        )
                      ),
                    ],
                  ),
                ),
                separatorBuilder: (BuildContext context, int index) => const SizedBox(height: 10,),
                itemCount: chatState.chatResponse.conversations.length,

              ),
            ),
          ],
        ),
      ),
    );
  }

}
