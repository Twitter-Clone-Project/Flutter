import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:x_clone/features/auth/ui/widgets/auth_field.dart';

void main() {
  testWidgets('AuthField widget test', (WidgetTester tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: Scaffold(
          body: AuthField(
            labelText: 'Email',
            errorText: null,
          ),
        ),
      ),
    );

    // Verify that the widget has the correct labelText.
    expect(find.text('Email'), findsOneWidget);

    // Verify that the widget has no error text initially.
    expect(find.text('Error'), findsNothing);

    // Testing for the presence of the suffix icon when errorText is not null
    await tester.pumpWidget(
      const MaterialApp(
        home: Scaffold(
          body: AuthField(
            labelText: 'Email',
            errorText: 'Error',
          ),
        ),
      ),
    );
    expect(find.byIcon(Icons.error), findsOneWidget);

    // Testing maxLength
    // Replace the maxLength value with your desired value.
    await tester.pumpWidget(
      const MaterialApp(
        home: Scaffold(
          body: AuthField(
            labelText: 'Email',
            errorText: null,
            maxLength: 10,
          ),
        ),
      ),
    );
    expect(find.byType(TextField), findsOneWidget);
  });
}
