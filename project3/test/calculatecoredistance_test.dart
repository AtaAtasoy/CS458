import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:project3/earthcoredistance.dart';

void main() {
  testWidgets('Calculate distance button callback test',
      (WidgetTester tester) async {
    var distance = 0;
    final testWidget = MaterialApp(
        home: EarthCoreDistance(
      onPressed: () => distance = distance + 1,
    ));

    await tester.pumpWidget(testWidget);
    await tester.pumpAndSettle();

    await tester.tap(find.byType(ElevatedButton));
    await tester.pumpAndSettle();

    expect(distance, distance + 1);
  });
}
