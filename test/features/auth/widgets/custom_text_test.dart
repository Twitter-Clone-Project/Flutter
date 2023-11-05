import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:x_clone/features/auth/ui/widgets/custom_text.dart';

void main() {
  testWidgets('CustomText widget test', (WidgetTester tester) async {

    /** Testing small text  **/
    await tester.pumpWidget(
      const MaterialApp(
        home: Scaffold(
          body: CustomText(textSize: CustomTextSize.small,"Hello, World",color: Colors.black38,),
        ),
      ),
    );

    expect(find.text('Hello, World'), findsOneWidget);
    var text = find.text('Hello, World').evaluate().single.widget as Text;

    expect(text.style!.fontSize, 12.0);
    expect(text.style!.fontWeight, FontWeight.w400);
    expect(text.style!.color, Colors.black38);

    /** Testing medium text  **/
    await tester.pumpWidget(
      const MaterialApp(
        home: Scaffold(
          body: CustomText(textSize: CustomTextSize.medium,"Hello, World",color: Colors.white,),
        ),
      ),
    );
    text = find.text('Hello, World').evaluate().single.widget as Text;
    expect(find.text('Hello, World'), findsOneWidget);
    expect(text.style!.fontSize, 14.0);
    expect(text.style!.fontWeight, FontWeight.w400);
    expect(text.style!.color, Colors.white);

    /** Testing Large text  **/
    await tester.pumpWidget(
      const MaterialApp(
        home: Scaffold(
          body: CustomText(textSize: CustomTextSize.large,"Hello, World",color: Colors.black,),
        ),
      ),
    );
    text = find.text('Hello, World').evaluate().single.widget as Text;
    expect(find.text('Hello, World'), findsOneWidget);
    expect(text.style!.fontSize, 32.0);
    expect(text.style!.fontWeight, FontWeight.w800);
    expect(text.style!.color, Colors.black);
  });
}
