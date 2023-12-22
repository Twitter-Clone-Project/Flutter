import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../model/chats_response.dart';
import '../repositories/home_repository.dart';
import '../states/chats_state.dart';



class ChatNotifierProvider extends StateNotifier<ChatState> {
  ChatNotifierProvider(this.chatRepository) : super(const ChatState()) {}

  final ChatRepository chatRepository;


  getChatsData() async {
    try {
      state = state.copyWith(loading: true);
      final ChatResponse chatResponse = await chatRepository.getConversations();
      state = state.copyWith(
          chatResponse: chatResponse,
          loading: false);
      return chatResponse;
    } catch (e) {
      state = state.copyWith(loading: false, errorMessage: e.toString());
      return const ChatResponse(conversations: []);
    }
  }

}

final chatNotifierProvider =
    StateNotifierProvider<ChatNotifierProvider, ChatState>((ref) {
  final chatRepository = ref.watch(chatRepositoryProvider);

  return ChatNotifierProvider(chatRepository);
});
