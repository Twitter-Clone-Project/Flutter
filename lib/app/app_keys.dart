import 'package:flutter/material.dart';

class AppKeys {
  static final appKeyNavigator = GlobalKey<NavigatorState>();
  static final appKey = GlobalKey<ScaffoldState>();
  static final GlobalKey<ScaffoldMessengerState> scaffoldMessengerKey =
  GlobalKey<ScaffoldMessengerState>();

  static final loginFormKey = GlobalKey<FormState>();
  static final serviceFormKey = GlobalKey<FormState>();
  static final registerFormKey = GlobalKey<FormState>();
  static final GlobalKey<ScaffoldState> registerScaffoldKey = GlobalKey<ScaffoldState>();


}