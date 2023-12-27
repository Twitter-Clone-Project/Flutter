import 'package:flutter_test/flutter_test.dart';
import 'package:x_clone/features/notifications/data/model/notifications.dart';

void main() {
  group('NotificationData Model', () {

    test('NotificationData.toJson should convert NotificationData to JSON correctly', () {
      // Arrange
      const NotificationData notificationData = NotificationData(
        notificationId: '3',
        timestamp: '2023-12-18T22:20:41.921Z',
        isSeen: false,
        type: 'FOLLOW',
        content: 'Yousef Rabia followed you',
        senderImgUrl: 'https://kady-twitter-images.s3.amazonaws.com/1000000034.jpg',
        senderUsername: 'ddcdvfbg',
      );

      // Act
      final Map<String, dynamic> json = notificationData.toJson();

      // Assert
      expect(json['notificationId'], '3');
      expect(json['timestamp'], '2023-12-18T22:20:41.921Z');
      expect(json['isSeen'], false);
      expect(json['type'], 'FOLLOW');
      expect(json['content'], 'Yousef Rabia followed you');
      expect(json['senderImgUrl'], 'https://kady-twitter-images.s3.amazonaws.com/1000000034.jpg');
      expect(json['senderUsername'], 'ddcdvfbg');
      
    });
  });

  group('NotificationsList Model', () {
    test('NotificationsList.fromJson should parse JSON correctly', () {
      // Arrange
      final Map<String, dynamic> json = {
        'data': [
          {
            'notificationId': '3',
            'timestamp': '2023-12-18T22:20:41.921Z',
            'isSeen': false,
            'type': 'FOLLOW',
            'content': 'Yousef Rabia followed you',
            'senderImgUrl': 'https://kady-twitter-images.s3.amazonaws.com/1000000034.jpg',
            'senderUsername': 'ddcdvfbg',
          },
          
        ],
      };

      // Act
      final NotificationsList notificationsList = NotificationsList.fromJson(json);

      // Assert
      expect(notificationsList.data.length, 1);
      expect(notificationsList.data[0].notificationId, '3');
      expect(notificationsList.data[0].timestamp, '2023-12-18T22:20:41.921Z');
      expect(notificationsList.data[0].isSeen, false);
      expect(notificationsList.data[0].type, 'FOLLOW');
      expect(notificationsList.data[0].content, 'Yousef Rabia followed you');
      expect(notificationsList.data[0].senderImgUrl, 'https://kady-twitter-images.s3.amazonaws.com/1000000034.jpg');
      expect(notificationsList.data[0].senderUsername, 'ddcdvfbg');
      
    });

  });
}
