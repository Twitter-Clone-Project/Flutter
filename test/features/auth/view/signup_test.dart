import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:x_clone/features/auth/view/signup_view.dart';


void main() {
  testWidgets('Test SignUp widget', (WidgetTester tester) async {
    // Build our widget and trigger a frame.
    await tester.pumpWidget(const MaterialApp(
      home: SignUp(),
    ));

    // Use finder to locate specific widgets for testing.
    final createAccountText = find.text("Create your account");
    final signUpButton = find.text("Sign up");

    // Verify that the widgets are present on the screen.
    expect(createAccountText, findsOneWidget);
    expect(signUpButton, findsOneWidget);

    // You can add more test cases to validate other aspects of your widget.
  });
}
