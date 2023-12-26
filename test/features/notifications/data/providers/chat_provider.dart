import 'package:flutter_test/flutter_test.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:mockito/mockito.dart';
import 'package:x_clone/features/chat/data/model/chats_response.dart';
import 'package:x_clone/features/chat/data/providers/chat_provider.dart';
import 'package:x_clone/features/chat/data/repositories/chat_repository.dart';
import 'package:x_clone/features/chat/data/states/chats_state.dart';

class MockChatRepository extends Mock implements ChatRepository {}

void main() {
  group('ChatNotifierProvider', () {
    late ChatNotifierProvider chatNotifier;
    late ChatRepository mockChatRepository;

    setUp(() {
      mockChatRepository = MockChatRepository();
      chatNotifier = ChatNotifierProvider(mockChatRepository);
    });

    test('initial state is correct', () {
      expect(chatNotifier.state, ChatState());
    });

    group('getChatsData', () {
      test(
          'sets loading to true and updates state on successful data fetch', () async {
        // Arrange
        when(mockChatRepository.getConversations()).thenAnswer((_) async =>
            ConversationsResponse(conversations: []));

        // Act
        await chatNotifier.getChatsData();

        // Assert
        expect(chatNotifier.state.loading, false);
        expect(chatNotifier.state.conversationsResponse, isNotNull);
      });

      test(
          'sets loading to false and updates errorMessage on failure', () async {
        // Arrange
        when(mockChatRepository.getConversations()).thenThrow(
            'Failed to fetch conversations');

        // Act
        await chatNotifier.getChatsData();

        // Assert
        expect(chatNotifier.state.loading, false);
        expect(
            chatNotifier.state.errorMessage, 'Failed to fetch conversations');
      });
    });

    group('ChatNotifierProvider', () {
      late ChatNotifierProvider chatNotifier;
      late ChatRepository mockChatRepository;

      setUp(() {
        mockChatRepository = MockChatRepository();
        chatNotifier = ChatNotifierProvider(mockChatRepository);
      });

      test('initial state is correct', () {
        expect(chatNotifier.state, ChatState());
      });

      group('getChatsData', () {
        test(
            'sets loading to true and updates state on successful data fetch', () async {
          // Arrange
          when(mockChatRepository.getConversations()).thenAnswer((_) async =>
              ConversationsResponse(conversations: []));

          // Act
          await chatNotifier.getChatsData();

          // Assert
          expect(chatNotifier.state.loading, false);
          expect(chatNotifier.state.conversationsResponse, isNotNull);
        });

        test(
            'sets loading to false and updates errorMessage on failure', () async {
          // Arrange
          when(mockChatRepository.getConversations()).thenThrow(
              'Failed to fetch conversations');

          // Act
          await chatNotifier.getChatsData();

          // Assert
          expect(chatNotifier.state.loading, false);
          expect(
              chatNotifier.state.errorMessage, 'Failed to fetch conversations');
        });
      });
    });
  });
}
