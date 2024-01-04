import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:x_clone/features/auth/data/providers/auth_provider.dart';
import 'package:x_clone/features/chat/data/model/chats_response.dart';
import '../../../app/routes.dart';
import '../../../theme/app_assets.dart';
import '../../../theme/app_colors.dart';
import '../../../utils/utils.dart';
import '../../../web_services/socket_services.dart';
import '../data/providers/chat_provider.dart';

/// A screen that displays a chat conversation.
///
/// This screen is responsible for displaying the chat conversation between the user and a contact.
/// It includes a header with the contact's information, a list of messages, and an input field to send new messages.
class ChatScreen extends StatefulHookConsumerWidget {
  final Conversation conversation;
  const ChatScreen({super.key, required this.conversation});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _ChatScreenState();
}

class _ChatScreenState extends ConsumerState<ChatScreen> {
  TextEditingController textController = TextEditingController();
  String? clickedMessageId;

  @override
  void initState() {
    // Fetches the message history for the conversation and opens a chat socket connection.
    Future.delayed(const Duration(seconds: 0), () {
      ref
          .read(chatNotifierProvider.notifier)
          .getMessagesHistory(widget.conversation.conversationId ?? '');
      SocketClient.chatOpen(
          conversationId: widget.conversation.conversationId ?? '',
          senderId: ref.read(authNotifierProvider).user?.userId ?? '',
          contactId: widget.conversation.contact?.id ?? '');
      SocketClient.statusOfContact((data) {
        if (data["conversationId"] == widget.conversation.conversationId) {
          ref.read(chatNotifierProvider.notifier).updateMessageStatus();
        }
      });
    });

    super.initState();
  }

  @override
  void dispose() {
    // Closes the chat socket connection when the screen is disposed.
    SocketClient.chatClose(
        conversationId: widget.conversation.conversationId ?? '',
        contactId: widget.conversation.contact?.id ?? '');
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final chatState = ref.watch(chatNotifierProvider);
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            // Header with contact information and navigation buttons.
            Container(
              padding: const EdgeInsets.symmetric(
                vertical: 10,
              ),
              width: double.infinity,
              child: Row(
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: const Icon(
                      Icons.arrow_back_ios_rounded,
                      size: 30,
                    ),
                  ),
                  const Spacer(),
                  InkWell(
                    onTap: () {
                      Navigator.pushNamed(context, Routes.profileScreen,
                          arguments: widget.conversation.contact!.username);
                    },
                    child: Column(
                      children: [
                        ClipOval(
                          child: CachedNetworkImage(
                            width: 40,
                            height: 40,
                            fit: BoxFit.cover,
                            imageUrl:
                                widget.conversation.contact?.imageUrl ?? '',
                            placeholder: (context, url) => Image.asset(
                                AppAssets.whiteLogo,
                                fit: BoxFit.cover),
                            errorWidget: (context, url, error) =>
                                const Icon(Icons.error),
                          ),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Text(
                          widget.conversation.contact?.name ?? '',
                          style: const TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
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
                : buildMessageList(chatState.chatResponse.messages),
            const Divider(),
            buildMessageInput(),
          ],
        ),
      ),
    );
  }

  /// Builds the list of messages.
  ///
  /// This widget takes a list of messages and displays them in a scrollable list.
  /// The messages are displayed in reverse order, with the latest message at the bottom.
  /// If the list is empty, a "No Messages" text is displayed.
  Widget buildMessageList(List<Message> messages) {
    messages = messages.reversed.toList();
    if (messages.isEmpty) {
      return const Expanded(
        child: Center(
          child: Text('No Messages'),
        ),
      );
    } else {
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
  /// Builds a single message item.
  ///
  /// This widget displays a single message item in the chat conversation.
  /// The alignment of the message depends on whether it is sent by the user or the contact.
  /// Tapping on the message toggles its selection state.
  Widget buildMessageItem(Message message) {
    var alignment =
        message.isFromMe == true ? Alignment.centerRight : Alignment.centerLeft;
    return Container(
      alignment: alignment,
      child: InkWell(
        onTap: () {
          if (clickedMessageId == message.messageId) {
            clickedMessageId = null;
          } else {
            clickedMessageId = message.messageId;
          }
          setState(() {});
        },
        child: Column(
          crossAxisAlignment: message.isFromMe == true
              ? CrossAxisAlignment.end
              : CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.all(10),
              margin: const EdgeInsets.all(10),
              constraints: BoxConstraints(
                maxWidth: MediaQuery.of(context).size.width * 0.7,
              ),
              decoration: BoxDecoration(
                color: message.isFromMe == true
                    ? AppColors.primaryColor
                    : AppColors.borderDarkGray,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Text(
                message.text ?? '',
                style: const TextStyle(color: Colors.white),
              ),
            ),
            if (clickedMessageId == message.messageId)
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Text(
                  "${getFormattedDate(message.time)} ${message.isFromMe == false ? '' : message.isSeen == true ? 'Seen' : 'Sent'}",
                  style: const TextStyle(
                    color: Colors.grey,
                    fontSize: 12,
                  ),
                ),
              )
          ],
        ),
      ), // Column
    );
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
              onPressed: textController.text.trim().isEmpty
                  ? null
                  : () {
                      if (textController.text.isNotEmpty) {
                        ref.read(chatNotifierProvider.notifier).sendMessage(
                            widget.conversation.conversationId ?? '',
                            textController.text,
                            widget.conversation.contact?.id ?? '',
                            ref.read(authNotifierProvider).user?.userId ?? '');
                        textController.clear();
                      }
                    },
              icon: CircleAvatar(
                backgroundColor: AppColors.primaryColor
                    .withOpacity(textController.text.trim().isEmpty ? 0.7 : 1),
                child: Icon(
                  Icons.send,
                  color: AppColors.whiteColor.withOpacity(
                      textController.text.trim().isEmpty ? 0.5 : 1),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
