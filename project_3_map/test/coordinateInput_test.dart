import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:project_3_map/screens/manualCore/earthCoreDistance.dart';

void main() {
  testWidgets('validate coordinate inputs', (WidgetTester tester) async {
    final testWidget = MaterialApp(
      home: EarthCoreDistance(),
    );

    await tester.pumpWidget(testWidget);
    await tester.pumpAndSettle();

    await tester.enterText(find.byKey(Key('latitude-field')), "hi");
    expect(find.text("Invalid Input"), findsOneWidget);
  });
}