import 'package:freezed_annotation/freezed_annotation.dart';

import '../model/chats_response.dart';

part 'chats_state.freezed.dart';

/// Represents the state of the chat feature.
///
/// This class is used to manage the state of the chat feature in the application.
/// It contains various properties that represent different aspects of the chat state,
/// such as conversations, chat messages, loading status, unseen message count, and error messages.
///
/// Example usage:
/// ```dart
/// ChatState state = ChatState(
///   conversationsResponse: ConversationsResponse(conversations: []),
///   chatResponse: ChatResponse(messages: []),
///   loading: false,
///   chatLoading: false,
///   unseenCnt: '0',
///   errorMessage: null,
/// );
/// ```
@freezed
class ChatState with _$ChatState {
  const factory ChatState({
    @Default(ConversationsResponse(conversations: []))
    ConversationsResponse conversationsResponse,
    @Default(ChatResponse(messages: [])) ChatResponse chatResponse,
    @Default(false) bool loading,
    @Default(false) bool chatLoading,
    @Default('0') String unseenCnt,
    String? errorMessage,
  }) = _ChatState;
}
