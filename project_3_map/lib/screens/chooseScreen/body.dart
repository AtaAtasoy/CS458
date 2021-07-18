import 'package:flutter/material.dart';
import 'package:project_3_map/screens/automatic/automaticScreen.dart';
import 'package:project_3_map/screens/manual/manualScreen.dart';
import 'package:project_3_map/screens/manualCore/earthCoreDistance.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 100.0),
      child: Column(children: [
        SizedBox(
          height: 100.0,
        ),
        Text(
          "Choose the option you want to use",
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(
          height: 130.0,
        ),
        TextButton(
          onPressed: () {
            Navigator.pushNamed(context, ManualScreen.routeName);
          },
          child: Text("Show City", style: TextStyle(color: Colors.blue)),
        ),
        TextButton(
          onPressed: () {
            Navigator.pushNamed(context, AutomaticScreen.routeName);
          },
          child: Text("Distance to the Big Ben",
              style: TextStyle(color: Colors.blue)),
        ),
        TextButton(
          onPressed: () {
            Navigator.pushNamed(context, EarthCoreDistance.routeName);
          },
          child: Text("Distance to Core", style: TextStyle(color: Colors.blue)),
        ),
      ]),
    );
  }
}
