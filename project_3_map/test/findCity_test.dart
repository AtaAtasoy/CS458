import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:project_3_map/screens/findCity/findCity.dart';

void main() {
  testWidgets('findCity - alphabetic coordinate inputs', (WidgetTester tester) async {
    final testWidget = MaterialApp(
      home: FindCity(),
    );

    await tester.pumpWidget(testWidget);
    await tester.pumpAndSettle();

    await tester.enterText(find.byKey(Key('latitude-field')), "hi");
    await tester.tap(find.byType(ElevatedButton));
    await tester.pump(new Duration(seconds: 5));

    expect(find.text("Invalid Input"), findsOneWidget);
  });
  test2();
  test3();
}

void test2() {
  testWidgets('findCity - special character coordinate inputs',
      (WidgetTester tester) async {
    final testWidget = MaterialApp(
      home: FindCity(),
    );

    await tester.pumpWidget(testWidget);
    await tester.pumpAndSettle();

    await tester.enterText(find.byKey(Key('latitude-field')), "?-.,");
    await tester.enterText(find.byKey(Key('longtitude-field')), "?-.,~");
    await tester.tap(find.byType(ElevatedButton));
    await tester.pump(new Duration(seconds: 5));

    expect(find.text("Invalid Input"), findsOneWidget);
  });
}

void test3() {
  testWidgets('findCity - valid coordinate inputs', (WidgetTester tester) async {
    final testWidget = MaterialApp(
      home: FindCity(),
    );

    await tester.pumpWidget(testWidget);
    await tester.pumpAndSettle();

    await tester.enterText(find.byKey(Key('latitude-field')), "39");
    await tester.enterText(find.byKey(Key('longtitude-field')), "32");
    await tester.tap(find.byType(ElevatedButton));
    await tester.pump(new Duration(seconds: 5));

    expect(find.textContaining("Your city:"), findsOneWidget);
  });
}
