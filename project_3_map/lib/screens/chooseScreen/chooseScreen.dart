import 'package:flutter/material.dart';
import 'package:project_3_map/screens/chooseScreen/body.dart';

class ChooseScreen extends StatelessWidget {
  static String routeName = "/choose";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Project 3'),
      ),
      body: Center(
        child: Body(),
      ),
    );
  }
}
