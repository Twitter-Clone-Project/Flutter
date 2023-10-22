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
    final fullNameTextField = find.byWidgetPredicate((widget) =>
    widget is TextField && widget.decoration?.labelText == 'Full Name');
    final emailTextField = find.byWidgetPredicate((widget) =>
    widget is TextField && widget.decoration?.labelText == 'Email');
    final passwordTextField = find.byWidgetPredicate((widget) =>
    widget is TextField && widget.decoration?.labelText == 'Password');

    // Verify that the widgets are present on the screen.
    expect(createAccountText, findsOneWidget);
    expect(signUpButton, findsOneWidget);
    expect(tester.widget<TextField>(fullNameTextField).controller!.text, '');
    expect(tester.widget<TextField>(emailTextField).controller!.text, '');
    expect(tester.widget<TextField>(passwordTextField).controller!.text, '');

    // Test entering text into the text fields.
    await tester.enterText(fullNameTextField, 'John Doe');
    await tester.enterText(emailTextField, 'johndoe@example.com');
    await tester.enterText(passwordTextField, 'securepassword');

    // Verify the text fields are updated correctly.
    expect(tester.widget<TextField>(fullNameTextField).controller!.text, 'John Doe');
    expect(tester.widget<TextField>(emailTextField).controller!.text, 'johndoe@example.com');
    expect(tester.widget<TextField>(passwordTextField).controller!.text, 'securepassword');

  });
}
