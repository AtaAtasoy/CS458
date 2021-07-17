import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:project3/earthcoredistance.dart';

void main() {
  testWidgets('earthcoredistance page is created', (WidgetTester tester) async {
    final testWidget = MaterialApp(
      home: EarthCoreDistance(),
    );

    await tester.pumpWidget(testWidget);
    await tester.pumpAndSettle();

    await tester.enterText(find.byType(TextField), "hi");

    expect(find.byType(TextField).text, "hi");
  });
}
