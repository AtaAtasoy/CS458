
import 'package:flutter/material.dart';
import 'package:project_3_map/screens/automatic/automaticScreen.dart';
import 'package:project_3_map/screens/chooseScreen/chooseScreen.dart';
import 'package:project_3_map/screens/manuel/manuelScreen.dart';

import 'screens/manuelCore/earthcoredistance.dart';


final Map<String, WidgetBuilder> routes = {
  ChooseScreen.routeName: (context) => ChooseScreen(),
  AutomaticScreen.routeName: (context) => AutomaticScreen(),
  ManuelScreen.routeName: (context) => ManuelScreen(),
  EarthCoreDistance.routeName: (context) => EarthCoreDistance() 


};