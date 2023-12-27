import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:x_clone/features/chat/data/repositories/chat_repository.dart';

class MockDio extends Mock implements Dio {}

void main() {
  late ChatRepositoryImpl chatRepository;
  late MockDio mockDio;

  setUp(() {
    mockDio = MockDio();
    chatRepository = ChatRepositoryImpl();
  });

  group('ChatRepository', () {
    test('getUnseenConversationsCnt should return count on success', () async {
      // Arrange
      final mockResponse = {
        "data": {"unseenCnt": 3}
      };

      // Act
      final result = await chatRepository.getUnseenConversationsCnt();

      // Assert
      expect(result, equals(3));
    });

    test('getUnseenConversationsCnt should return empty string on error', () async {
      // Arrange

      // Act
      final result = await chatRepository.getUnseenConversationsCnt();

      // Assert
      expect(result, equals(''));
    });

    // Similar tests for startConversation, getConversations, getMessagesHistory, sendMessage

    test('startConversation should return empty ConversationsResponse on error', () async {
      // Arrange
      final id = '123';

      // Act
      final result = await chatRepository.startConversation(id);

      // Assert
      expect(result.conversations, isEmpty);
    });

    test('getConversations should return ConversationsResponse on success', () async {
      // Arrange
      final mockResponse = {
        "data": {"conversations": []}
      };

      // Act
      final result = await chatRepository.getConversations();

      // Assert
      expect(result.conversations, isNotEmpty);
    });

    test('getMessagesHistory should return ChatResponse on success', () async {
      // Arrange
      final conversationId = '456';
      final mockResponse = {
        "data": {"messages": []}
      };

      // Act
      final result = await chatRepository.getMessagesHistory(conversationId);

      // Assert
      expect(result.messages, isNotEmpty);
    });

    test('sendMessage should not throw an exception', () async {
      // Arrange
      final conversationId = '789';
      final text = 'Hello!';
      final receiverId = 'receiver123';
      final senderId = 'sender456';

      // Act & Assert
      expect(
            () => chatRepository.sendMessage(conversationId, text, receiverId, senderId),
        returnsNormally,
      );
    });
  });
}
