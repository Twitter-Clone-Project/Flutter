import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:x_clone/features/home/data/models/home_response.dart';

import '../app/app_keys.dart';

/// Builds a [SnackBar] widget with the specified [text] and [backgroundColor].
///
/// Example usage:
/// ```dart
/// SnackBar snackBar = buildSnackBar(text: 'Hello, world!', backgroundColor: Colors.blue);
/// AppSnackbar.show(snackBar);
/// ```
SnackBar buildSnackBar({required String text, Color backgroundColor = Colors.red}) {
  return SnackBar(
    content: Text(text),
    backgroundColor: backgroundColor,
    behavior: SnackBarBehavior.floating,
    duration: const Duration(seconds: 3),
  );
}

/// Checks if the [input] string contains only one character repeated multiple times.
///
/// Example usage:
/// ```dart
/// bool result = containsOnlyOneCharacter('aaaaa');
/// print(result); // Output: true
/// ```
bool containsOnlyOneCharacter(String input) {
// Check if all characters in the string are the same as the first character
  for (int i = 1; i < input.length; i++) {
    if (input[i] != input[0]) {
      return false; // If any character is different, return false
    }
  }
  return true;
}

/// Splits the [word] into two parts: a prefix of consecutive '#' characters and the remaining part.
///
/// Example usage:
/// ```dart
/// List<String> result = splitHashWord('###hello');
/// print(result); // Output: ['', 'hello']
/// ```
List<String> splitHashWord(String word) {
  List<String> result = ['', '']; // Initializing with empty strings

  int index = 0;
  while (index < word.length && word[index] == '#') {
    index++;
  }
  result[0] = word.substring(0, index - 1);
  result[1] = word.substring(index - 1);
  return result;
}

/// Finds the indexes of tweets in the [tweets] list that have the specified [id].
///
/// Example usage:
/// ```dart
/// List<Tweet> tweets = [...];
/// List<int> indexes = findIndexesOfTweetsWithId(tweets, 123);
/// print(indexes); // Output: [0, 2, 5]
/// ```
List<int> findIndexesOfTweetsWithId(List<Tweet> tweets, int id) {
  List<int> indexesWithId = [];

  for (int i = 0; i < tweets.length; i++) {
    if (tweets[i].id == id) {
      indexesWithId.add(i);
    }
  }

  return indexesWithId;
}

/// Checks if the [email] string is a valid email address.
///
/// Example usage:
/// ```dart
/// bool isValid = isEmailValid('test@example.com');
/// print(isValid); // Output: true
/// ```
bool isEmailValid(String email) {
  RegExp emailRegExp =
      RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$');
  return emailRegExp.hasMatch(email);
}

/// Checks if the [username] string is a valid username.
///
/// Example usage:
/// ```dart
/// bool isValid = isValidUsername('john_doe123');
/// print(isValid); // Output: true
/// ```
bool isValidUsername(String username) {
  RegExp usernameRegex =
      RegExp(r"^(?![_-])(?!.*[_-]{2})[a-zA-Z0-9_-]+(?<![_-])$");
  return usernameRegex.hasMatch(username);
}

/// Extension on [AppKeys] to show a [SnackBar] using [scaffoldMessengerKey].
///
/// Example usage:
/// ```dart
/// SnackBar snackBar = buildSnackBar(text: 'Hello, world!');
/// AppKeys.show(snackBar);
/// ```
extension AppSnackbar on AppKeys {
  static show(snackBar) {
    AppKeys.scaffoldMessengerKey.currentState?.hideCurrentSnackBar();
    AppKeys.scaffoldMessengerKey.currentState?.showSnackBar(snackBar);
  }
}

/// Extension on [BuildContext] to check if the widget is mounted.
///
/// Example usage:
/// ```dart
/// bool isMounted = context.mounted;
/// print(isMounted); // Output: true or false
/// ```
extension ContextExtension on BuildContext {
  bool get mounted {
    try {
      widget;
      return true;
    } catch (e) {
      return false;
    }
  }
}

/// Formats the [originalDateString] into a full date and time string.
///
/// Example usage:
/// ```dart
/// String formattedDateTime = getFullDateTime('2022-01-01T12:34:56');
/// print(formattedDateTime); // Output: '12:34 • 01 Jan 22'
/// ```
String getFullDateTime(String? originalDateString) {
  if (originalDateString == null || originalDateString.isEmpty) return '';

  DateTime originalDate = DateTime.parse(originalDateString);

  String formattedDateTime =
      DateFormat('HH:mm • dd MMM yy').format(originalDate);
  return formattedDateTime;
}

/// Formats the [originalDateString] into a formatted date difference string.
///
/// Example usage:
/// ```dart
/// String formattedDateDifference = getFormattedDateDifference('2022-01-01T12:34:56');
/// print(formattedDateDifference); // Output: '1d'
/// ```
String getFormattedDateDifference(String? originalDateString) {
  if (originalDateString == null || originalDateString.isEmpty) return '';

  DateTime originalDate = DateTime.parse(originalDateString);
  DateTime now = DateTime.now();

  Duration difference = now.difference(originalDate);

  if (difference.inSeconds < 60) {
    return 'now';
  } else if (difference.inMinutes < 60) {
    return '${difference.inMinutes}m';
  } else if (difference.inHours < 24) {
    return '${difference.inHours}h';
  } else if (difference.inDays == 1) {
    return '1d';
  } else if (difference.inDays <= 6) {
    return '${difference.inDays}d';
  } else if (originalDate.year == now.year) {
    return DateFormat('dd MMM').format(originalDate);
  } else {
    return DateFormat('dd MMM yy').format(originalDate);
  }
}

/// Formats the [originalDateString] into a formatted date string.
///
/// Example usage:
/// ```dart
/// String formattedDate = getFormattedDate('2022-01-01T12:34:56');
/// print(formattedDate); // Output: 'Jan 01, 2022'
/// ```
String getFormattedDate(String? originalDateString) {
  if (originalDateString == null || originalDateString.isEmpty) return '';
  DateTime originalDate = DateTime.parse(originalDateString);
  DateTime now = DateTime.now();

  Duration difference = now.difference(originalDate);

  if (difference.inSeconds < 60) {
    return 'now';
  } else if (originalDate.day == now.day &&
      originalDate.month == now.month &&
      originalDate.year == now.year) {
    String formattedTime = DateFormat('h:mm a').format(originalDate);
    return formattedTime;
  } else {
    String formattedDate = DateFormat('MMM dd, yyyy').format(originalDate);
    return formattedDate;
  }
}

/// List of open conversation IDs.
List<String> openConversationIds = [];
