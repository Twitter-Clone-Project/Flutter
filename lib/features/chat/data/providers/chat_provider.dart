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

  sendMessage(String conversationId, String text ,String receiverId,String senderId) async {
    try {
      chatRepository.sendMessage(conversationId, text, receiverId, senderId);
      state = state.copyWith(
          chatResponse: state.chatResponse.copyWith(messages: [...state.chatResponse.messages,Message(text: text,senderId: senderId,time: DateTime.now().toString(),isSeen: false,isFromMe: true)]),
        conversationsResponse: state.conversationsResponse.copyWith(conversations: state.conversationsResponse.conversations.map((e) {
          if(e.conversationId == conversationId){
            return e.copyWith(lastMessage: LastMessage(text: text,timestamp: DateTime.now().toString(),isSeen: false));
          }
          return e;
        }).toList())
      );
    } catch (e) {
      state = state.copyWith(chatLoading: false, errorMessage: e.toString());
    }
  }

  onMessageReceive(data) {
    print("onMessageReceive");
    final Message message = Message.fromJson(data);
    print(message);
    state = state.copyWith(
        chatResponse: state.chatResponse.copyWith(messages: [...state.chatResponse.messages,message]),
        conversationsResponse: state.conversationsResponse.copyWith(conversations: state.conversationsResponse.conversations.map((e) {
          if(e.contact?.id == message.senderId){
            return e.copyWith(lastMessage: LastMessage(text: message.text,timestamp: message.time,isSeen: false));
          }
          return e;
        }).toList())
    );
  }


}

final chatNotifierProvider =
    StateNotifierProvider<ChatNotifierProvider, ChatState>((ref) {
  final chatRepository = ref.watch(chatRepositoryProvider);

  return ChatNotifierProvider(chatRepository);
});
