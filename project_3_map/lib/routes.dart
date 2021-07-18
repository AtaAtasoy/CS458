
import 'package:flutter/material.dart';
import 'package:project_3_map/screens/chooseScreen/chooseScreen.dart';
import 'package:project_3_map/screens/bigBenDistance/bigBenDistance.dart';
import 'package:project_3_map/screens/findCity/findCity.dart';
import 'package:project_3_map/screens/earthCoreDistance/earthCoreDistance.dart';


final Map<String, WidgetBuilder> routes = {
  ChooseScreen.routeName: (context) => ChooseScreen(),
  BigBenDistance.routeName: (context) => BigBenDistance(),
  FindCity.routeName: (context) => FindCity(),
  EarthCoreDistance.routeName: (context) => EarthCoreDistance() 
};