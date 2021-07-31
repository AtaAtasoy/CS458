import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:project4/routes.dart';
import 'package:project4/screens/sign_in/sign_in_screen.dart';

void main() {
  setUpAll(() {
    TestWidgetsFlutterBinding.ensureInitialized();
  });

  group('SignIn Screen', () {
    testWidgets('should redirect to signup page when label is clicked',
        (WidgetTester tester) async {
      await tester.pumpWidget(MaterialApp(routes: routes));
      await tester.pumpAndSettle();

      await tester.tap(find.byKey(Key('navigate-to-signin')));
      await tester.pumpAndSettle();

      await tester.tap(find.byKey(Key('navigate-to-signup')));
      await tester.pumpAndSettle();

      expect(find.text("Sign Up"), findsOneWidget);
    });

    testWidgets('should reject signing with invalid credentials',
        (WidgetTester tester) async {
      await tester.pumpWidget(MaterialApp(home: SignInScreen()));
      await tester.pumpAndSettle();

      await tester.enterText(find.byKey(Key('username-field')), "ataatasoy");
      await tester.pumpAndSettle();

      await tester.enterText(find.byKey(Key('password-field')), "invalidpassword");
      await tester.pumpAndSettle();

      await tester.tap(find.byType(ElevatedButton));
      await tester.pumpAndSettle();

      expect(find.text("Invalid Credentials"), findsOneWidget);
    });
  });
}
