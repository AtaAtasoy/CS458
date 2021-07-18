import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:project_3_map/screens/automatic/automaticScreen.dart';

/// TDD Cases
/// Case 1: AutomaticScreen component should exist
/// Case 2: There should be a text stating "Calculate Distance to The Big Ben"
/// Case 3: There should be a blue button with text 'Calculate'
/// Case 4: There should be a text where the result will be displayed
/// Case 5: OnButton Click the App should calculate the distance to the earth's core

void main() {
  testWidgets('automaticscreen page is created', (WidgetTester tester) async {
    final testWidget = MaterialApp(
      home: AutomaticScreen(),
    );

    await tester.pumpWidget(testWidget);
    await tester.pumpAndSettle();

    final buttonMaterial = find.descendant(
        of: find.byType(ElevatedButton), matching: find.byType(Material));

    final materialButton = tester.widget<Material>(buttonMaterial);

    expect(materialButton.color, Colors.blue);
    expect(find.text("Calculate"), findsOneWidget);

    // expect(find.text("Calculate Distance to the Earth's Core"), findsOneWidget);
  });
}
