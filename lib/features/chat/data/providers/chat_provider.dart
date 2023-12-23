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

  onMessageReceive(data) {
    print("from on Message receive $data");
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

  getUnseenConversationsCnt() async {
    try {
      final response = await chatRepository.getUnseenConversationsCnt();
      state = state.copyWith(unseenCnt: response.toString());
    } catch (e) {
      rethrow;
    }
  }
}

final chatNotifierProvider =
    StateNotifierProvider<ChatNotifierProvider, ChatState>((ref) {
  final chatRepository = ref.watch(chatRepositoryProvider);

  return ChatNotifierProvider(chatRepository);
});
