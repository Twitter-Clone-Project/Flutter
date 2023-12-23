import 'package:freezed_annotation/freezed_annotation.dart';

import '../model/chats_response.dart';

part 'chats_state.freezed.dart';

@freezed
class ChatState with _$ChatState {
  const factory ChatState({
    @Default(ConversationsResponse(conversations: [])) ConversationsResponse conversationsResponse,
    @Default(ChatResponse(messages: [])) ChatResponse chatResponse,
    @Default(false) bool loading,
    @Default(false) bool chatLoading,
    String? errorMessage,

  }) = _ChatState;
}
