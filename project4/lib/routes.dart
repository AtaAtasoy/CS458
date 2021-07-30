import 'package:flutter/material.dart';
import 'package:project4/screens/form_screen/form_screen.dart';
import 'package:project4/screens/sign_in/sign_in_screen.dart';
import 'package:project4/screens/sign_up/sign_up_screen.dart';
import 'package:project4/screens/start_screen/start_screen.dart';

final Map<String, WidgetBuilder> routes = {

  SignInScreen.routeName: (context) => SignInScreen(),
  SignUpScreen.routeName: (context) => SignUpScreen(),
  StartScreen.routeName: (context) => StartScreen(),
  FormScreen.routeName: (context) => FormScreen(),


  
};