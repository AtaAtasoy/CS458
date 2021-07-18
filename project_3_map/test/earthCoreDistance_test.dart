import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:project_3_map/screens/earthCoreDistance/earthCoreDistance.dart';
/// TDD Cases
/// Case 1: Earthcoredistance component should exist
/// Case 2: There should be a text stating "Calculate Distance to the Earth's Core"
/// Case 3: There should be a blue button with text 'Find my distance!
/// Case 4: There should be a text field for the user to provide their coordinates
/// Case 5: There should be a text where the result will be displayed
/// Case 6: OnButton Click the App should calculate the distance to the earth's core
void main() {
  testWidgets('earthcoredistance page is created', (WidgetTester tester) async {
    final testWidget = MaterialApp(
      home: EarthCoreDistance(),
    );

    await tester.pumpWidget(testWidget);
    await tester.pumpAndSettle();

    final buttonMaterial = find.descendant(
        of: find.byType(ElevatedButton), matching: find.byType(Material));

    final materialButton = tester.widget<Material>(buttonMaterial);

    expect(materialButton.color, Colors.blue);
    expect(find.text('Find my distance!'), findsOneWidget);
    expect(find.byKey(Key('icon-go')), findsOneWidget);
    expect(find.byKey(Key('latitude-field')), findsOneWidget);
    expect(find.byKey(Key('longtitude-field')), findsOneWidget);

    // expect(find.text("Calculate Distance to the Earth's Core"), findsOneWidget);
    expect(find.textContaining("0.0 kilometers"), findsOneWidget);
  });
}

