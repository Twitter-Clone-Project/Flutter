
import 'package:flutter_test/flutter_test.dart';
import 'package:x_clone/features/tweet/data/models/tweet_response.dart';

void main() {
  group('LikersList', () {
    test('fromJson should parse JSON correctly', () {
      // Arrange
      final Map<String, dynamic> json = {
        'data': [
          {'id': '1', 'name': 'Liker 1', 'screenName': 'liker1'},
          {'id': '2', 'name': 'Liker 2', 'screenName': 'liker2'},
        ],
      };

      // Act
      final LikersList likersList = LikersList.fromJson(json);

      // Assert
      expect(likersList.data?.length, 2);
      expect(likersList.data?[0].id, '1');
      expect(likersList.data?[0].name, 'Liker 1');
      expect(likersList.data?[1].id, '2');
      expect(likersList.data?[1].screenName, 'liker2');
    });

    test('toJson should convert LikersList to JSON correctly', () {
      // Arrange
      const LikersList likersList = LikersList(
        data: [
          LikerData(id: '1', name: 'Liker 1', screenName: 'liker1'),
          LikerData(id: '2', name: 'Liker 2', screenName: 'liker2'),
        ],
      );

      // Act
      final Map<String, dynamic> json = likersList.toJson();

      // Assert
      expect(json['data']?.length, 2);
    });
  });

  group('RetweetersList', () {
    test('fromJson should parse JSON correctly', () {
      // Arrange
      final Map<String, dynamic> json = {
        'data': [
          {'id': '1', 'name': 'Retweeter 1', 'screenName': 'retweeter1'},
          {'id': '2', 'name': 'Retweeter 2', 'screenName': 'retweeter2'},
        ],
      };

      // Act
      final RetweetersList retweetersList = RetweetersList.fromJson(json);

      // Assert
      expect(retweetersList.data?.length, 2);
      expect(retweetersList.data?[0].id, '1');
      expect(retweetersList.data?[0].name, 'Retweeter 1');
      expect(retweetersList.data?[1].id, '2');
      expect(retweetersList.data?[1].screenName, 'retweeter2');
    });

    test('toJson should convert RetweetersList to JSON correctly', () {
      // Arrange
      const RetweetersList retweetersList = RetweetersList(
        data: [
          RetweeterData(id: '1', name: 'Retweeter 1', screenName: 'retweeter1'),
          RetweeterData(id: '2', name: 'Retweeter 2', screenName: 'retweeter2'),
        ],
      );

      // Act
      final Map<String, dynamic> json = retweetersList.toJson();

      // Assert
      expect(json['data']?.length, 2);
    });
  });

  group('RepliersList', () {
    test('fromJson should parse JSON correctly', () {
      // Arrange
      final Map<String, dynamic> json = {
        'data': [
          {'replyId': '1', 'replyUserId': 'user1', 'replyText': 'Reply 1'},
          {'replyId': '2', 'replyUserId': 'user2', 'replyText': 'Reply 2'},
        ],
      };

      // Act
      final RepliersList repliersList = RepliersList.fromJson(json);

      // Assert
      expect(repliersList.data?.length, 2);
      expect(repliersList.data?[0].replyId, '1');
      expect(repliersList.data?[0].replyUserId, 'user1');
      expect(repliersList.data?[1].replyId, '2');
      expect(repliersList.data?[1].replyText, 'Reply 2');
    });

    test('toJson should convert RepliersList to JSON correctly', () {
      // Arrange
      const RepliersList repliersList = RepliersList(
        data: [
          ReplierData(replyId: '1', replyUserId: 'user1', replyText: 'Reply 1'),
          ReplierData(replyId: '2', replyUserId: 'user2', replyText: 'Reply 2'),
        ],
      );

      // Act
      final Map<String, dynamic> json = repliersList.toJson();

      // Assert
      expect(json['data']?.length, 2);
    });
  });
}
