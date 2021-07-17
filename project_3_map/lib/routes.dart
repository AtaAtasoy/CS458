
import 'package:flutter/material.dart';
import 'package:project_3_map/screens/automatic/automaticScreen.dart';
import 'package:project_3_map/screens/chooseScreen/chooseScreen.dart';
import 'package:project_3_map/screens/manuel/manualScreen.dart';

import 'screens/manuelCore/earthCoreDistance.dart';


final Map<String, WidgetBuilder> routes = {
  ChooseScreen.routeName: (context) => ChooseScreen(),
  AutomaticScreen.routeName: (context) => AutomaticScreen(),
  ManualScreen.routeName: (context) => ManualScreen(),
  EarthCoreDistance.routeName: (context) => EarthCoreDistance() 
};