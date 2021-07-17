import 'package:flutter/material.dart';
import 'package:project_3_map/routes.dart';
import 'package:project_3_map/screens/chooseScreen/chooseScreen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: ChooseScreen.routeName,
      routes: routes,
    );
  }
}



