import 'package:flutter/material.dart';
import 'package:flutter_multiselect/flutter_multiselect.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:project4/screens/form_screen/form_screen.dart';

void main() {
  setUpAll(() {
    TestWidgetsFlutterBinding.ensureInitialized();
  });

  group('Form Screen', () {
    testWidgets('should reject empty fields', (WidgetTester tester) async {
      await tester.pumpWidget(MaterialApp(home: FormScreen()));
      await tester.pumpAndSettle();

      await tester.enterText(find.byKey(Key('name-field')), "");
      await tester.pumpAndSettle();

      await tester.enterText(find.byKey(Key('age-field')), "");
      await tester.pumpAndSettle();

      await tester.tap(find.byType(ElevatedButton));
      await tester.pumpAndSettle();

      expect(find.byKey(Key('invalid-data-prompt')), findsOneWidget);
    });
    testWidgets('should reject invalid name & alphabetic input on age',
        (WidgetTester tester) async {
      await tester.pumpWidget(MaterialApp(home: FormScreen()));
      await tester.pumpAndSettle();

      await tester.enterText(find.byKey(Key('name-field')), "*-0ata");
      await tester.pumpAndSettle();

      await tester.enterText(find.byKey(Key('age-field')), "abcs");
      await tester.pumpAndSettle();

      await tester.tap(find.byType(ElevatedButton));
      await tester.pumpAndSettle();

      expect(find.byKey(Key('invalid-data-prompt')), findsOneWidget);
    });

    testWidgets('should reject age not in 0-130', (WidgetTester tester) async {
      await tester.pumpWidget(MaterialApp(home: FormScreen()));
      await tester.pumpAndSettle();

      await tester.enterText(find.byKey(Key('name-field')), "ata");
      await tester.pumpAndSettle();

      await tester.enterText(find.byKey(Key('age-field')), "131");
      await tester.pumpAndSettle();

      await tester.tap(find.byType(ElevatedButton));
      await tester.pumpAndSettle();

      expect(find.byKey(Key('invalid-data-prompt')), findsOneWidget);
    });

    testWidgets('should be able to change gender field',
        (WidgetTester tester) async {
      await tester.pumpWidget(MaterialApp(home: FormScreen()));
      await tester.pumpAndSettle();

      expect(
          (tester.widget(find.byKey(Key('gender-dropdown')))
                  as DropdownButton<String>)
              .value,
          equals('Male'));

      await tester.tap(find.text('Male'));
      await tester.pumpAndSettle();
      await tester.tap(find.text('Female').last);
      await tester.pumpAndSettle();

      expect(
          (tester.widget(find.byKey(Key('gender-dropdown')))
                  as DropdownButton<String>)
              .value,
          equals('Female'));
    });

    testWidgets('should be able to change vaccinated field',
        (WidgetTester tester) async {
      await tester.pumpWidget(MaterialApp(home: FormScreen()));
      await tester.pumpAndSettle();
      expect(
          (tester.widget(find.byKey(Key('vaccinated-dropdown')))
                  as DropdownButton<String>)
              .value,
          equals('No'));

      await tester.tap(find.text('No'));
      await tester.pumpAndSettle();
      await tester.tap(find.text('Yes').last);
      await tester.pumpAndSettle();

      expect(
          (tester.widget(find.byKey(Key('vaccinated-dropdown')))
                  as DropdownButton<String>)
              .value,
          equals('Yes'));
    });

    testWidgets('should be able to choose symptoms',
        (WidgetTester tester) async {
      await tester.pumpWidget(MaterialApp(home: FormScreen()));
      await tester.pumpAndSettle();

      await tester.tap(find.byType(MultiSelect));
      await tester.pumpAndSettle();

      await tester.tap(find.text("Tired"));
      await tester.pumpAndSettle();

      await tester.tap(find.text("Dizzy"));
      await tester.pumpAndSettle();

      await tester.tap(find.text("Save"));
      await tester.pumpAndSettle();

      expect(find.text("Tired"), findsOneWidget);
      expect(find.text("Dizzy"), findsOneWidget);
    });

    testWidgets('should display success prompt with valid data',
        (WidgetTester tester) async {
      await tester.pumpWidget(MaterialApp(home: FormScreen()));
      await tester.pumpAndSettle();

      // Enter valid name
      await tester.enterText(find.byKey(Key('name-field')), "ata");
      await tester.pumpAndSettle();

      // Enter valid age
      await tester.enterText(find.byKey(Key('age-field')), "21");
      await tester.pumpAndSettle();

      // Choose gender
      await tester.tap(find.text('Male'));
      await tester.pumpAndSettle();
      await tester.tap(find.text('Male').last);
      await tester.pumpAndSettle();

      // Choose vaccinated
      await tester.tap(find.text('No'));
      await tester.pumpAndSettle();
      await tester.tap(find.text('Yes').last);
      await tester.pumpAndSettle();

      // Choose side effects
      await tester.tap(find.byType(MultiSelect));
      await tester.pumpAndSettle();
      await tester.tap(find.text("Tired"));
      await tester.pumpAndSettle();
      await tester.tap(find.text("Save"));
      await tester.pumpAndSettle();

      expect(find.text("ata"), findsOneWidget);
      expect(find.text("21"), findsOneWidget);
      expect(find.text("Male"), findsOneWidget);
      expect(find.text("Yes"), findsOneWidget);
      expect(find.text("Tired"), findsOneWidget);

      // Tap Submit
      await tester.tap(find.byType(ElevatedButton));
      await tester.pumpAndSettle();

      expect(find.byKey(Key('valid-data-prompt')), findsOneWidget);
    });
  });
}
