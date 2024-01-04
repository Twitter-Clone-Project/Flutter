import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../utils/utils.dart';
import '../model/chats_response.dart';
import '../repositories/chat_repository.dart';
import '../states/chats_state.dart';

class ChatNotifierProvider extends StateNotifier<ChatState> {
  ChatNotifierProvider(this.chatRepository) : super(const ChatState()) {}

  final ChatRepository chatRepository;

  /// Retrieves the chat data from the chat repository.
  ///
  /// This function is responsible for fetching the chat data from the chat repository.
  /// It sets the loading state to true, then calls the `getConversations` method
  /// from the chat repository to retrieve the conversations response.
  /// After receiving the response, it updates the state with the conversations response
  /// and sets the loading state to false.
  ///
  /// If an error occurs during the process, it catches the exception, updates the state
  /// with the error message and sets the loading state to false. In case of an error,
  /// it returns an empty `ConversationsResponse`.
  ///
  /// Returns the conversations response.
  getChatsData() async {
    try {
      state = state.copyWith(loading: true);
      final ConversationsResponse conversationsResponse =
          await chatRepository.getConversations();
      state = state.copyWith(
          conversationsResponse: conversationsResponse, loading: false);
      return conversationsResponse;
    } catch (e) {
      state = state.copyWith(loading: false, errorMessage: e.toString());
      return const ConversationsResponse(conversations: []);
    }
  }

  /// Retrieves the messages history for a given conversation ID.
  ///
  /// This function is responsible for fetching the messages history for a specific conversation
  /// identified by the provided [conversationId]. It updates the state of the chat provider
  /// to indicate that the chat is currently loading, then calls the [getMessagesHistory] method
  /// of the [chatRepository] to retrieve the chat response. Once the response is received, it
  /// updates the state with the chat response and sets the chat loading state to false. If an
  /// error occurs during the process, it updates the state with the error message and returns
  /// a default [ChatResponse] object with an empty list of messages.
  ///
  /// Example usage:
  /// ```dart
  /// final chatProvider = ChatProvider();
  /// final conversationId = '123456789';
  /// final chatResponse = await chatProvider.getMessagesHistory(conversationId);
  /// print(chatResponse.messages);
  /// ```
  getMessagesHistory(String conversationId) async {
    try {
      state = state.copyWith(chatLoading: true);
      final ChatResponse chatResponse =
          await chatRepository.getMessagesHistory(conversationId);
      state = state.copyWith(chatResponse: chatResponse, chatLoading: false);
      return chatResponse;
    } catch (e) {
      state = state.copyWith(chatLoading: false, errorMessage: e.toString());
      return const ChatResponse(messages: []);
    }
  }

  /// Sends a message in a conversation.
  ///
  /// This function sends a message in a conversation identified by [conversationId].
  /// The [text] parameter represents the content of the message.
  /// The [receiverId] parameter represents the ID of the message receiver.
  /// The [senderId] parameter represents the ID of the message sender.
  ///
  /// Example usage:
  /// ```dart
  /// sendMessage('conversation123', 'Hello, how are you?', 'receiver123', 'sender123');
  /// ```
  sendMessage(String conversationId, String text, String receiverId,
      String senderId) async {
    try {
      chatRepository.sendMessage(conversationId, text, receiverId, senderId);
      state = state.copyWith(
        chatResponse: state.chatResponse.copyWith(
          messages: [
            ...state.chatResponse.messages,
            Message(
              text: text,
              senderId: senderId,
              time: DateTime.now().toString(),
              isSeen: openConversationIds.contains(conversationId),
              isFromMe: true,
              messageId: DateTime.now().toString() + text,
            ),
          ],
        ),
        conversationsResponse: state.conversationsResponse.copyWith(
          conversations: state.conversationsResponse.conversations.map((e) {
            if (e.conversationId == conversationId) {
              return e.copyWith(
                lastMessage: LastMessage(
                  text: text,
                  timestamp: DateTime.now().toString(),
                  isSeen: false,
                ),
              );
            }
            return e;
          }).toList(),
        ),
      );
      sortChats(conversationId);
    } catch (e) {
      state = state.copyWith(chatLoading: false, errorMessage: e.toString());
    }
  }

  /// A class that provides functionality for handling chat messages and conversations.
  /// Handles the received message data.
  ///
  /// This function takes the received message data and updates the state of the chat provider
  /// by adding the message to the chat response and updating the last message of the corresponding conversation.
  /// It also triggers the update of the unseen conversations count and sorts the chats.
  ///
  /// Example usage:
  /// ```dart
  /// final data = {
  ///   'senderId': 'user123',
  ///   'text': 'Hello, how are you?',
  ///   'isSeen': false,
  /// };
  /// chatProvider.onMessageReceive(data);
  /// ```
  onMessageReceive(data) {
    String conversationId = '';
    final Message message = Message.fromJson(data);
    state = state.copyWith(
        chatResponse: state.chatResponse
            .copyWith(messages: [...state.chatResponse.messages, message]),
        conversationsResponse: state.conversationsResponse.copyWith(
            conversations: state.conversationsResponse.conversations.map((e) {
          if (e.contact?.id == message.senderId) {
            conversationId = e.conversationId ?? '';
            return e.copyWith(
                lastMessage: LastMessage(
              text: message.text,
              timestamp: DateTime.now().toString(),
              isSeen: message.isSeen,
              isFromMe: false,
            ));
          }
          return e;
        }).toList()));
    getUnseenConversationsCnt();
    sortChats(conversationId);
  }

  sortChats(String conversationId) {
    List<Conversation> temp =
        List<Conversation>.from(state.conversationsResponse.conversations);

    for (int i = 0; i < temp.length; i++) {
      if (temp[i].conversationId == conversationId) {
        final Conversation conversation = temp[i];
        temp.removeAt(i);
        temp.insert(0, conversation);
        break;
      }
    }
    state = state.copyWith(
        conversationsResponse:
            state.conversationsResponse.copyWith(conversations: temp));
  }

  /// Updates the status of the messages in the chat to mark them as seen.
  ///
  /// This function iterates through the list of messages in the chat response and updates the `isSeen` property of each message to `true` if the message is sent by the current user.
  /// It uses the `copyWith` method to create a new instance of the message with the updated `isSeen` property.
  /// Finally, it updates the state of the chat provider with the modified chat response.
  updateMessageStatus() {
    state = state.copyWith(
        chatResponse: state.chatResponse.copyWith(
            messages: state.chatResponse.messages.map((e) {
      if (e.isFromMe == true) {
        return e.copyWith(isSeen: true);
      }
      return e;
    }).toList()));
  }

  /// Starts a conversation with the specified [id].
  ///
  /// This function sets the loading state to true, starts a conversation
  /// using the [chatRepository], and then retrieves the chat data by
  /// calling [getChatsData]. If an error occurs during the process,
  /// the loading state is set to false and the error message is updated
  /// in the state.
  ///
  /// Example usage:
  /// ```dart
  /// startConversation('123456789');
  /// ```
  startConversation(String id) async {
    try {
      state = state.copyWith(loading: true);
      await chatRepository.startConversation(id);
      getChatsData();
    } catch (e) {
      state = state.copyWith(loading: false, errorMessage: e.toString());
      // return const ConversationsResponse(conversations: []);
    }
  }

  /// Marks a conversation message as seen.
  ///
  /// This function updates the state of the chat provider to mark a specific conversation message as seen.
  /// It takes an [index] parameter which represents the index of the conversation message to be marked as seen.
  /// The function updates the [state] by copying it with the updated conversation message.
  /// If the conversation message at the specified index is found, its [lastMessage] is updated to set [isSeen] to true.
  /// The function then calls [getUnseenConversationsCnt()] to update the count of unseen conversations.
  /// If an error occurs during the process, the [state] is updated with the error message.
  ///
  /// Example usage:
  /// ```dart
  /// markAsSeen(0);
  /// ```
  markAsSeen(int index) async {
    try {
      state = state.copyWith(
        conversationsResponse: state.conversationsResponse.copyWith(
          conversations: state.conversationsResponse.conversations.map((e) {
            if (e.conversationId ==
                state.conversationsResponse.conversations[index]
                    .conversationId) {
              return e.copyWith(
                lastMessage: e.lastMessage?.copyWith(
                  isSeen: true,
                ),
              );
            }
            return e;
          }).toList(),
        ),
      );
      getUnseenConversationsCnt();
    } catch (e) {
      state = state.copyWith(loading: false, errorMessage: e.toString());
    }
  }

  /// Retrieves the count of unseen conversations.
  ///
  /// This function makes an asynchronous call to the [chatRepository] to get the count of unseen conversations.
  /// It then updates the [state] by copying it with the new count value.
  /// If an error occurs during the process, it rethrows the exception.
  ///
  /// Example usage:
  /// ```dart
  /// final chatProvider = ChatProvider();
  /// await chatProvider.getUnseenConversationsCnt();
  /// print(chatProvider.state.unseenCnt);
  /// ```
  getUnseenConversationsCnt() async {
    try {
      final response = await chatRepository.getUnseenConversationsCnt();
      state = state.copyWith(unseenCnt: response.toString());
    } catch (e) {
      print(e.toString());
    }
  }
}

final chatNotifierProvider =
    StateNotifierProvider<ChatNotifierProvider, ChatState>((ref) {
  final chatRepository = ref.watch(chatRepositoryProvider);

  return ChatNotifierProvider(chatRepository);
});
