import 'package:flutter/material.dart';
import 'package:project_3_map/screens/bigBenDistance/bigBenDistance.dart';
import 'package:project_3_map/screens/findCity/findCity.dart';
import 'package:project_3_map/screens/earthCoreDistance/earthCoreDistance.dart';

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
            Navigator.pushNamed(context, FindCity.routeName);
          },
          child: Text("Show City", style: TextStyle(color: Colors.blue)),
        ),
        TextButton(
          onPressed: () {
            Navigator.pushNamed(context, BigBenDistance.routeName);
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
