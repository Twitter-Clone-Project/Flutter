import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:x_clone/features/home/data/models/home_response.dart';

import '../app/app_keys.dart';

SnackBar buildSnackBar(
        {required String text, Color backgroundColor = Colors.red}) =>
    SnackBar(
      content: Text(text),
      backgroundColor: backgroundColor,
      behavior: SnackBarBehavior.floating,
      duration: const Duration(seconds: 3),
    );


List<int> findIndexesOfTweetsWithId(List<Tweet> tweets, int id) {
  List<int> indexesWithId = [];

  for (int i = 0; i < tweets.length; i++) {
    if (tweets[i].id == id) {
      indexesWithId.add(i);
    }
  }

  return indexesWithId;
}

bool isEmailValid(String email) {
  RegExp emailRegExp =
      RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$');
  return emailRegExp.hasMatch(email);
}

bool isValidUsername(String username) {
  RegExp usernameRegex =
      RegExp(r"^(?![_-])(?!.*[_-]{2})[a-zA-Z0-9_-]+(?<![_-])$");
  return usernameRegex.hasMatch(username);
}

extension AppSnackbar on AppKeys {
  static show(snackBar) {
    AppKeys.scaffoldMessengerKey.currentState?.hideCurrentSnackBar();
    AppKeys.scaffoldMessengerKey.currentState?.showSnackBar(snackBar);
  }
}

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

String getFullDateTime(String? originalDateString) {
  if (originalDateString == null || originalDateString.isEmpty) return '';

  DateTime originalDate = DateTime.parse(originalDateString);

  String formattedDateTime = DateFormat('HH:mm • dd MMM yy').format(originalDate);
  return formattedDateTime;
}



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

String getFormattedDate(String? originalDateString) {
  if(originalDateString == null||originalDateString.isEmpty) return '';
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

List<String> openConversationIds = [];
