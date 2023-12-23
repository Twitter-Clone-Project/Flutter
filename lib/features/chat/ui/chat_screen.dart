import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:x_clone/features/auth/data/providers/auth_provider.dart';
import 'package:x_clone/features/chat/data/model/chats_response.dart';
import '../../../theme/app_assets.dart';
import '../../../theme/app_colors.dart';
import '../../../web_services/socket_services.dart';
import '../data/providers/chat_provider.dart';

class ChatScreen extends StatefulHookConsumerWidget {
  final Conversation conversation;
  const ChatScreen({super.key,required this.conversation});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _ChatScreenState();
}

class _ChatScreenState extends ConsumerState<ChatScreen> {
  TextEditingController textController =TextEditingController();

  @override
  void initState() {
    Future.delayed(const Duration(seconds: 0), () {
      ref.read(chatNotifierProvider.notifier).getMessagesHistory(widget.conversation.conversationId??'');
      SocketClient.chatOpen(conversationId: widget.conversation.conversationId??'', senderId: ref.read(authNotifierProvider).user?.userId??'', contactId: widget.conversation.contact?.id??'');

      SocketClient.onMessageReceive(
          (data) => ref.read(chatNotifierProvider.notifier).onMessageReceive(data));
    });

    super.initState();
  }
  @override
  void dispose() {
    SocketClient.chatClose(conversationId: widget.conversation.conversationId??'', contactId: widget.conversation.contact?.id??'');
    super.dispose();
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
              width: double.infinity,
              child: Row(
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child:const Icon(Icons.arrow_back_ios_rounded,size: 30,),

                  ),
                  const Spacer(),
                  Column(
                    children: [
                      ClipOval(
                        child: CachedNetworkImage(
                          width: 40,
                          height: 40,
                          fit: BoxFit.cover,
                          imageUrl: widget.conversation.contact?.imageUrl ?? '',
                          placeholder: (context, url) => Image.asset(
                              AppAssets.whiteLogo,
                              fit: BoxFit.cover),
                          errorWidget: (context, url, error) => const Icon(Icons.error),
                        ),
                      ),
                      const SizedBox(height: 5,),
                      Text(
                        widget.conversation.contact?.name??'',
                        style: const TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
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
            chatState.chatLoading
                ? const Expanded(
                  child: Center(
                                child: CircularProgressIndicator(),
                              ),
                )
                :
            buildMessageList(chatState.chatResponse.messages),
            const Divider(),
            buildMessageInput(),
          ],
        ),
      ),
    );
  }





  Widget buildMessageList(List<Message> messages) {
    messages=messages.reversed.toList();
    if(messages.isEmpty)
      {
        return const Center(
          child: Text('No Messages'),
        );
      }
      else
      {
        return Expanded(
          child: ListView.builder(
            reverse: true,
            itemCount: messages.length,
            itemBuilder: (context, index) {
              return buildMessageItem(messages[index]);
            },
          ),
        );
      }

  }
  //
  Widget buildMessageItem(Message message) {

    var alignment =
    message.isFromMe==true ? Alignment.centerRight : Alignment.centerLeft;
    return
      Container(
        alignment: alignment,
        child: Container(
          padding: const EdgeInsets.all(10),
          margin: const EdgeInsets.all(10),
          constraints: BoxConstraints(
            maxWidth: MediaQuery.of(context).size.width * 0.7,
          ),
          decoration: BoxDecoration(
            color: message.isFromMe==true
                ? AppColors.primaryColor
                : AppColors.borderDarkGray,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Text(
            message.text??'',
            style: const TextStyle(
              color: Colors.white),
          ),
        ), // Column
      ) ;
  }


  buildMessageInput() {
    return Container(
      padding: const EdgeInsets.all(8.0),
      margin: const EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.0),
        border: Border.all(
          color: Colors.grey, // Replace with your color
        ),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20.0),
        child: Row(
          children: [
            Expanded(
              child: IntrinsicHeight(
                child: SizedBox.expand(
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 12.0),
                    child: TextField(
                      onChanged: (value) {
                        setState(() {});
                      },
                      controller: textController,
                      minLines: 1, // Minimum number of lines
                      maxLines: 5, // Allow unlimited number of lines
                      decoration: const InputDecoration(
                        hintText: 'Start a message...',
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            IconButton(
              onPressed: textController.text.isEmpty
                  ? null
                  : () {
                if (textController.text.isNotEmpty) {
                  ref.read(chatNotifierProvider.notifier).sendMessage(
                      widget.conversation.conversationId??'',
                      textController.text,
                      widget.conversation.contact?.id??'',
                      ref.read(authNotifierProvider).user?.userId??'');
                  textController.clear();
                }
              },
              icon: CircleAvatar(
                backgroundColor: AppColors.primaryColor.withOpacity(
                    textController.text.isEmpty ? 0.7 : 1),
                child: Icon(
                  Icons.send,
                  color: AppColors.whiteColor.withOpacity(
                      textController.text.isEmpty ? 0.5 : 1),                ),
              ),
            ),
          ],
        ),
      ),
    )
    ;
  }

}
