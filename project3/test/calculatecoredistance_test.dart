// import 'package:flutter/material.dart';
// import 'package:flutter_test/flutter_test.dart';
// import 'package:project3/earthcoredistance.dart';

// void main() {
//   testWidgets("testing geolocator", (WidgetTester tester) async {
//     final testWidget = MaterialApp(home: EarthCoreDistance());

//     await tester.pumpWidget(testWidget);
//     await tester.pumpAndSettle();

//     final buttonMaterial = find.descendant(
//       of: find.byType(ElevatedButton),
//       matching: find.byType(Material),
//     );

//     await tester.tap(find.byType(ElevatedButton));
 

//     expect(buttonMaterial, findsOneWidget);
//     expect(find.textContaining("LAT: "), findsOneWidget);
//   });
// }
