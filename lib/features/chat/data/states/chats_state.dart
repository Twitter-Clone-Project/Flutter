import 'package:freezed_annotation/freezed_annotation.dart';

import '../model/chats_response.dart';

part 'chats_state.freezed.dart';

@freezed
class ChatState with _$ChatState {
  const factory ChatState({
    @Default(ChatResponse(conversations: [])) ChatResponse chatResponse,
    @Default(false) bool loading,
    String? errorMessage,

  }) = _ChatState;
}
