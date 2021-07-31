// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:project4/screens/sign_up/sign_up_screen.dart';
import 'package:project4/routes.dart';

void main() {
  setUpAll(() {
    TestWidgetsFlutterBinding.ensureInitialized();
  });
  group('SignUp Screen', () {
    testWidgets('should reject username starting with . or _',
        (WidgetTester tester) async {
      final testWidget = MaterialApp(home: SignUpScreen());

      await tester.pumpWidget(testWidget);
      await tester.pumpAndSettle();

      // Find Username Field
      await tester.enterText(find.byKey(Key('username-field')), "atasoy");
      await tester.enterText(
          find.byKey(Key('password-field')), "validpassword");
      await tester.enterText(find.byKey(Key('email-field')), "valid@email.com");
      await tester.tap(find.byType(ElevatedButton));
      await tester.pump(new Duration(seconds: 2));

      expect(find.textContaining("Username & Password is 8-20 Characters long"),
          findsOneWidget);
    });
    testWidgets('should reject username not 8-20 Characters long',
        (WidgetTester tester) async {
      final testWidget = MaterialApp(home: SignUpScreen());

      await tester.pumpWidget(testWidget);
      await tester.pumpAndSettle();

      // Find Username Field
      await tester.enterText(find.byKey(Key('username-field')), "ata");
      await tester.enterText(
          find.byKey(Key('password-field')), "validpassword");
      await tester.enterText(find.byKey(Key('email-field')), "valid@email.com");

      await tester.tap(find.byType(ElevatedButton));
      await tester.pump(new Duration(seconds: 2));

      expect(find.textContaining("Username & Password is 8-20 Characters long"),
          findsOneWidget);
    });
    testWidgets('should reject username with _ or . at the end',
        (WidgetTester tester) async {
      final testWidget = MaterialApp(home: SignUpScreen());

      await tester.pumpWidget(testWidget);
      await tester.pumpAndSettle();

      // Find Username Field
      await tester.enterText(find.byKey(Key('username-field')), "ataatasoy.");
      await tester.enterText(
          find.byKey(Key('password-field')), "validpassword");
      await tester.enterText(find.byKey(Key('email-field')), "valid@email.com");

      await tester.tap(find.byType(ElevatedButton));
      await tester.pump(new Duration(seconds: 2));

      expect(find.textContaining("Username & Password is 8-20 Characters long"),
          findsOneWidget);
    });

    testWidgets('should reject username with __ or ._ at the middle',
        (WidgetTester tester) async {
      final testWidget = MaterialApp(home: SignUpScreen());

      await tester.pumpWidget(testWidget);
      await tester.pumpAndSettle();

      // Find Username Field
      await tester.enterText(find.byKey(Key('username-field')), "ata__atasoy");
      await tester.enterText(
          find.byKey(Key('password-field')), "validpassword");
      await tester.enterText(find.byKey(Key('email-field')), "valid@email.com");

      await tester.tap(find.byType(ElevatedButton));
      await tester.pump(new Duration(seconds: 2));

      expect(find.textContaining("Username & Password is 8-20 Characters long"),
          findsOneWidget);
    });

    testWidgets('should reject invalid email', (WidgetTester tester) async {
      final testWidget = MaterialApp(home: SignUpScreen());

      await tester.pumpWidget(testWidget);
      await tester.pumpAndSettle();

      // Find Username Field
      await tester.enterText(find.byKey(Key('username-field')), "newtestuser");
      await tester.enterText(
          find.byKey(Key('password-field')), "newtestuserpassword");
      await tester.enterText(find.byKey(Key('email-field')), "notanemail");

      await tester.tap(find.byType(ElevatedButton));
      await tester.pump(new Duration(seconds: 2));

      expect(find.textContaining("Invalid"), findsOneWidget);
    });
    testWidgets('should reject existing user', (WidgetTester tester) async {
      final testWidget = MaterialApp(home: SignUpScreen());

      await tester.pumpWidget(testWidget);
      await tester.pumpAndSettle();

      // Find Username Field
      await tester.enterText(find.byKey(Key('username-field')), "ataatasoy");
      await tester.enterText(
          find.byKey(Key('password-field')), "ataatasoy");
      await tester.enterText(find.byKey(Key('email-field')), "ataatasoy@email.com");

      await tester.tap(find.byType(ElevatedButton));
      await tester.pump(new Duration(seconds: 2));

      expect(find.textContaining("User already exists"), findsOneWidget);
    });

    testWidgets('should redirect to signin after successful signup',
        (WidgetTester tester) async {
      await tester.pumpWidget(MaterialApp(routes: routes));
      await tester.pumpAndSettle();

      await tester.tap(find.byKey(Key('navigate-to-signup')));
      await tester.pumpAndSettle();

      // Signup A User
      await tester.enterText(find.byKey(Key('username-field')), "newtestuser");
      await tester.enterText(
          find.byKey(Key('password-field')), "newtestuserpassword");
      await tester.enterText(find.byKey(Key('email-field')), "valid@email.com");

      await tester.tap(find.byType(ElevatedButton));
      await tester.pumpAndSettle();

      // Sign-In

      await tester.enterText(find.byKey(Key('username-field')), "newtestuser");
      await tester.pumpAndSettle();

      await tester.enterText(
          find.byKey(Key('password-field')), "newtestuserpassword");
      await tester.pumpAndSettle();

      await tester.ensureVisible(find.byType(ElevatedButton));
      await tester.pumpAndSettle();

      await tester.tap(find.byKey(Key('signIn-button')));
      await tester.pumpAndSettle();

      expect(find.text("Submit Information"), findsOneWidget);
    });
  });
}
