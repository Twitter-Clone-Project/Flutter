import 'package:flutter_test/flutter_test.dart';
import 'package:x_clone/features/chat/data/model/chats_response.dart';
import 'package:x_clone/features/chat/data/states/chats_state.dart';

void main() {
  group('ChatState', () {
    test('equality', () {
      const chatState1 = ChatState(
        conversationsResponse: ConversationsResponse(conversations: []),
        chatResponse: ChatResponse(messages: []),
        loading: false,
        chatLoading: false,
        unseenCnt: '0',
        errorMessage: null,
      );

      const chatState2 = ChatState(
        conversationsResponse: ConversationsResponse(conversations: []),
        chatResponse: ChatResponse(messages: []),
        loading: false,
        chatLoading: false,
        unseenCnt: '0',
        errorMessage: null,
      );

      expect(chatState1, chatState2);
    });
  });
}
