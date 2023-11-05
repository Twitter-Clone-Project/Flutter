import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

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

