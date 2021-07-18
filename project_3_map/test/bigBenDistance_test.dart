import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:project_3_map/screens/bigBenDistance/bigBenDistance.dart';

void main() {
  testWidgets('BigBenDistance - Auto Finding Location Case', (WidgetTester tester) async {
    final testWidget = MaterialApp(
      home: BigBenDistance(),
    );
    await tester.pumpWidget(testWidget);
    await tester.pumpAndSettle();
    await tester.tap(find.byType(TextButton));
    await tester.pump(new Duration(seconds: 5));
    expect(find.textContaining("The Distance to Big Ben: "), findsNothing);
  });
}
