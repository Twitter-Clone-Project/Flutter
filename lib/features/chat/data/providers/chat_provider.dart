import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../model/chats_response.dart';
import '../repositories/chat_repository.dart';
import '../states/chats_state.dart';



class ChatNotifierProvider extends StateNotifier<ChatState> {
  ChatNotifierProvider(this.chatRepository) : super(const ChatState()) {}

  final ChatRepository chatRepository;


  getChatsData() async {
    try {
      state = state.copyWith(loading: true);
      final ConversationsResponse conversationsResponse = await chatRepository.getConversations();
      state = state.copyWith(
          conversationsResponse: conversationsResponse,
          loading: false);
      return conversationsResponse;
    } catch (e) {
      state = state.copyWith(loading: false, errorMessage: e.toString());
      return const ConversationsResponse(conversations: []);
    }
  }

  getMessagesHistory(String conversationId) async {
    try {
      state = state.copyWith(chatLoading: true);
      final ChatResponse chatResponse = await chatRepository.getMessagesHistory(conversationId);
      state = state.copyWith(
          chatResponse: chatResponse,
          chatLoading: false);
      return chatResponse;
    } catch (e) {
      state = state.copyWith(chatLoading: false, errorMessage: e.toString());
      return const ChatResponse(messages: []);
    }
  }

}

final chatNotifierProvider =
    StateNotifierProvider<ChatNotifierProvider, ChatState>((ref) {
  final chatRepository = ref.watch(chatRepositoryProvider);

  return ChatNotifierProvider(chatRepository);
});
