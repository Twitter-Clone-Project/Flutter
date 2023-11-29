import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

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
