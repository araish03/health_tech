import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:pcos_app/main.dart';
import 'package:pcos_app/login_screens/welcome_screen.dart'; // Import the WelcomeScreen class

void main() {
  testWidgets('Counter increments smoke test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(MyApp(initialRoute: WelcomeScreen.id));

    // Verify that our counter starts at 0.
    expect(find.text('0'), findsOneWidget);
    expect(find.text('1'), findsNothing);

    // Tap the '+' icon and trigger a frame.
    await tester.tap(find.byIcon(Icons.add));
    await tester.pump();

    // Verify that our counter has incremented.
    expect(find.text('0'), findsNothing);
    expect(find.text('1'), findsOneWidget);
  });
}
