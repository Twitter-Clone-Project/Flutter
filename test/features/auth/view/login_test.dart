import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:x_clone/features/auth/ui/login_screen.dart';
import 'package:x_clone/features/auth/ui/widgets/auth_field.dart';
import 'package:x_clone/features/auth/ui/widgets/custom_button.dart';


void main() {
  testWidgets('Widget test for the Login screen', (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(
      home: LoginScreen(),
    ));

    expect(find.byType(AppBar), findsOneWidget);
    expect(find.byType(SvgPicture), findsOneWidget);
    expect(find.text('Enter Your Credentials'), findsOneWidget);
    expect(find.widgetWithText(AuthField, 'Email'), findsOneWidget);
    expect(find.widgetWithText(AuthField, 'Password'), findsOneWidget);
    expect(
        find.widgetWithText(CustomButton, 'Forgot Password?'), findsOneWidget);
    expect(find.widgetWithText(CustomButton, 'Continue'), findsOneWidget);
  });
}
