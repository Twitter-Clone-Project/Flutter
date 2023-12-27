import 'package:flutter_test/flutter_test.dart';
import 'package:x_clone/features/chat/data/model/chats_response.dart';

void main() {
  group('ConversationsResponse Model', () {
    test('ConversationsResponse.fromJson should parse JSON correctly', () {
      // Arrange
      final Map<String, dynamic> json = {
        'conversations': [
          {
            'conversationId': '1',
            'isConversationSeen': true,
            'contact': {
              'id': 'contact1',
              'inConversation': true,
              'email': 'contact1@example.com',
              'name': 'Contact 1',
              'username': 'contact1_username',
              'imageUrl': 'https://example.com/contact1.jpg',
              'followersCount': '100',
              'createdAt': '2022-01-01',
              'commonFollowers': [
                {'name': 'Common Follower 1', 'username': 'common1', 'imageUrl': 'https://example.com/common1.jpg'},
                  
              ],
              'commonFollowersCnt': 2,
            },
            'lastMessage': {
              'id': 'message1',
              'text': 'Hello!',
              'timestamp': '2022-01-01T12:00:00Z',
              'isSeen': false,
              'isFromMe': true,
            },
          },
            
        ],
      };

      // Act
      final ConversationsResponse conversationsResponse = ConversationsResponse.fromJson(json);

      // Assert
      expect(conversationsResponse.conversations.length, 1);
      expect(conversationsResponse.conversations[0].conversationId, '1');
      expect(conversationsResponse.conversations[0].isConversationSeen, true);
      expect(conversationsResponse.conversations[0].contact?.id, 'contact1');
    });

    test('ConversationsResponse.toJson should convert ConversationsResponse to JSON correctly', () {
      // Arrange
      const ConversationsResponse conversationsResponse = ConversationsResponse(
        conversations: [
          Conversation(
            conversationId: '1',
            isConversationSeen: true,
            contact: Contact(
              id: 'contact1',
              inConversation: true,
              email: 'contact1@example.com',
              name: 'Contact 1',
              username: 'contact1_username',
              imageUrl: 'https://example.com/contact1.jpg',
              followersCount: '100',
              createdAt: '2022-01-01',
              commonFollowers: [
                CommonFollowers(name: 'Common Follower 1', username: 'common1', imageUrl: 'https://example.com/common1.jpg'),
                  
              ],
              commonFollowersCnt: 2,
            ),
            lastMessage: LastMessage(
              id: 'message1',
              text: 'Hello!',
              timestamp: '2022-01-01T12:00:00Z',
              isSeen: false,
              isFromMe: true,
            ),
          ),
            
        ],
      );

      // Act
      final Map<String, dynamic> json = conversationsResponse.toJson();

      // Assert
      expect(json['conversations']?.length, 1);
      expect(json['conversations']?[0].conversationId, '1');
      expect(json['conversations']?[0].isConversationSeen, true);
      expect(json['conversations']?[0].contact?.id, 'contact1');
        
    });
  });

  group('ChatResponse Model', () {
    test('ChatResponse.fromJson should parse JSON correctly', () {
      // Arrange
      final Map<String, dynamic> json = {
        'messages': [
          {
            'senderId': 'sender1',
            'messageId': 'message1',
            'text': 'Hello!',
            'time': '2022-01-01T12:00:00Z',
            'senderUsername': 'sender1_username',
            'isSeen': false,
            'isFromMe': true,
          },
            
        ],
      };

      // Act
      final ChatResponse chatResponse = ChatResponse.fromJson(json);

      // Assert
      expect(chatResponse.messages.length, 1);
      expect(chatResponse.messages[0].senderId, 'sender1');
      expect(chatResponse.messages[0].messageId, 'message1');
        
    });

    test('ChatResponse.toJson should convert ChatResponse to JSON correctly', () {
      // Arrange
      final ChatResponse chatResponse = const ChatResponse(
        messages: [
          Message(
            senderId: 'sender1',
            messageId: 'message1',
            text: 'Hello!',
            time: '2022-01-01T12:00:00Z',
            senderUsername: 'sender1_username',
            isSeen: false,
            isFromMe: true,
          ),
            
        ],
      );

      // Act
      final Map<String, dynamic> json = chatResponse.toJson();

      // Assert
      expect(json['messages']?.length, 1);
      expect(json['messages']?[0].senderId, 'sender1');
      expect(json['messages']?[0].messageId, 'message1');
        
    });
  });

}
