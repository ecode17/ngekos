import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:ngekos/auth/signin_page.dart';

void main() {
  testWidgets('SignIn Page UI Test', (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(
      home: SignInPage(),
    ));

    expect(find.byKey(Key('emailTextField')), findsOneWidget);

    expect(find.byKey(Key('passwordTextField')), findsOneWidget);

    expect(find.widgetWithText(TextButton, 'Sign Up'), findsOneWidget);

    expect(find.widgetWithText(ElevatedButton, 'Sign In'), findsOneWidget);
  });
}
