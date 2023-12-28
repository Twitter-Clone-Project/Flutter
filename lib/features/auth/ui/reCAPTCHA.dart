import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

/// A widget that displays a reCAPTCHA web page in a WebView.
///
/// The reCAPTCHA widget is used to verify that the user is a human and not a robot.
/// It displays a web page with a reCAPTCHA challenge and listens for the response
/// from the JavaScript code running in the web page.
///
/// Example usage:
/// ```dart
/// reCAPTCHA(
///   key: UniqueKey(),
/// )
/// ```
class reCAPTCHA extends StatelessWidget {
  const reCAPTCHA({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: WebView(
          initialUrl: 'http://52.1.162.17/',
          javascriptMode: JavascriptMode.unrestricted,
          javascriptChannels: {
            JavascriptChannel(
                name: 'Captcha',
                onMessageReceived: (JavascriptMessage message) {
                  print(message.message);
                  Navigator.of(context).pop(message.message);
                })
          },
        ),
      ),
    );
  }
}
