import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

/**
 * Test Cases
 * Earthcoredistance component
 * There should be a button
 * Button should be clickable
 * OnClick => Should calculate distance from gps location to earth core
 * Distance should be displayed
 */

void main() {
  testWidgets('earthcoredistance page is created', (WidgetTester tester) async {
    final testWidget = MaterialApp(
      home: EarthCoreDistance(),
    );

    await tester.pumpWidget(testWidget);
    await tester.pumpAndSettle();
  });
}
