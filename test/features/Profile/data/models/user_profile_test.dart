import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:x_clone/features/Profile/data/model/user_profile.dart';

void main() {
  test('UserProfile.fromJson should parse JSON correctly', () {
    // Your JSON response text
    const jsonString = '''
      {"status":true,"data":{"user":{"username":"mou","name":"mostafa","email":"3400mostafa@gmail.com","birthDate":"2023-11-29","isConfirmed":true,"imageUrl":null,"bio":null,"location":null,"website":null,"userId":"12","followersCount":"0","followingsCount":"0","bannerUrl":null,"isMuted":false,"isBlocked":false,"isFollowed":false,"isFollowing":false,"isBlockingMe":false}}}
    ''';

    // Convert the JSON string to a map
    final Map<String, dynamic> jsonMap = json.decode(jsonString);

    // Call the fromJson method
    final userProfile = UserProfile.fromJson(jsonMap['data']['user']);

    // Assertions
    expect(userProfile.userId, '12');
    expect(userProfile.username, 'mou');
    expect(userProfile.name, 'mostafa');
    // Add more assertions based on your JSON structure and expected values
  });
}
