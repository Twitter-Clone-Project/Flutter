import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:x_clone/features/auth/view/signup_view.dart';
import 'package:x_clone/features/auth/widgets/auth_field.dart';


void main() {
  group('SignUp Widget Tests', () {
    testWidgets('Widget Renders Correctly', (WidgetTester tester) async {
      await tester.pumpWidget(const MaterialApp(home: SignUp()));

      expect(find.text('Create your account'), findsOneWidget);
      expect(find.widgetWithText(AuthField, "Name"), findsNWidgets(2));
      expect(find.widgetWithText(AuthField, "Email"), findsNWidgets(2));
      expect(find.widgetWithText(AuthField, "Password"), findsOneWidget);
      expect(find.text('Sign up'), findsOneWidget);
      expect(find.text('By signing up, you agree to our Terms, Privacy Policy, and Cookie Use.'), findsOneWidget);
    });

    testWidgets('Sign Up Button Test', (WidgetTester tester) async {
      await tester.pumpWidget(const MaterialApp(home: SignUp()));

      expect(find.text('Sign up'), findsOneWidget);

      // Simulate a tap on the Sign up button
      await tester.tap(find.text('Sign up'));
      await tester.pump();

      // Add your assertions for the behavior after clicking the Sign up button
    });

    testWidgets('Text Field Validation', (WidgetTester tester) async {
      await tester.pumpWidget(const MaterialApp(home: SignUp()));


      final nameFields = find.widgetWithText(AuthField, "Name");
      final emailFields = find.widgetWithText(AuthField, "Email");
      final passwordField = find.widgetWithText(AuthField, "Password");

      expect(nameFields, findsNWidgets(2));
      expect(emailFields, findsNWidgets(2));
      expect(passwordField, findsOneWidget);


      await tester.enterText(nameFields.first, 'John');
      await tester.enterText(nameFields.last, 'Doe');

      await tester.enterText(emailFields.first, 'john.doe@example.com');
      await tester.enterText(emailFields.last, 'johndoe@example.com');

      expect(find.text('John'), findsOneWidget);
      expect(find.text('Doe'), findsOneWidget);
      expect(find.text('john.doe@example.com'), findsOneWidget);
      expect(find.text('johndoe@example.com'), findsOneWidget);

    });
  });
}
