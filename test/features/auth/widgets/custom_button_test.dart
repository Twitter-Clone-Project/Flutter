import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:x_clone/constants/assets_constants.dart';
import 'package:x_clone/features/auth/widgets/custom_button.dart';
import 'package:x_clone/theme/palette.dart';

void main() {
  testWidgets('CustomButton widget test', (WidgetTester tester) async {
    bool buttonPressed = false;

    /** Testing Filled button without an image  **/
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: CustomButton(
            text: 'Submit',
            filled: true,
            onPressed: () {
              buttonPressed = true;
            },
          ),
        ),
      ),
    );
    expect(find.text('Submit'), findsOneWidget);
    expect(find.byType(CustomButton), findsOneWidget);
    final text = find.text('Submit').evaluate().single.widget as Text;
    expect(text.style!.color, Palette.whiteColor);
    expect(text.style!.fontSize, 18);
    expect(text.style!.fontWeight, FontWeight.w600);

    await tester.tap(find.text('Submit'));
    await tester.pump();
    expect(buttonPressed, true);

    /** Testing Outlined button without an image  **/
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: CustomButton(
            text: 'Submit2',
            filled: false,
            onPressed: () {
              buttonPressed = true;
            },
          ),
        ),
      ),
    );
    expect(find.text('Submit'), findsOneWidget);
    expect(find.byType(CustomButton), findsOneWidget);
    expect(text.style!.color, Palette.backgroundColor);
    expect(text.style!.fontSize, 18);
    expect(text.style!.fontWeight, FontWeight.w600);

    await tester.tap(find.text('Submit'));
    await tester.pump();
    expect(buttonPressed, true);

    /** Testing Outlined button with an image  **/
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: CustomButton(
            text: 'Submit',
            filled: false,
            svgIcon: AssetsConstants.googleIcon,
            onPressed: () {
              buttonPressed = true;
            },
          ),
        ),
      ),
    );
    expect(find.text('Submit'), findsOneWidget);
    expect(find.byType(CustomButton), findsOneWidget);
    expect(find.byType(Icon), findsOneWidget);
    expect(text.style!.color, Palette.backgroundColor);
    expect(text.style!.fontSize, 18);
    expect(text.style!.fontWeight, FontWeight.w600);

    await tester.tap(find.text('Submit'));
    await tester.pump();
    expect(buttonPressed, true);
  });
}
