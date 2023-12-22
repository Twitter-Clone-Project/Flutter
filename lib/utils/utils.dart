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
String getTimeDifference(DateTime notificationDate) {
  final now = DateTime.now();
  final difference = now.difference(notificationDate);

  if (difference.inDays > 0) {
    return '${difference.inDays} أيام';
  } else if (difference.inHours > 0) {
    return '${difference.inHours} ساعات';
  } else if (difference.inMinutes > 0) {
    return '${difference.inMinutes} دقيقة';
  } else {
    return 'الآن';
  }
}

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
