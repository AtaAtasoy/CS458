import 'package:flutter/material.dart';
import 'package:project4/screens/start_screen/body/body.dart';

class StartScreen extends StatelessWidget {

  static String routeName = "/start";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Chose Option"),
        backgroundColor: Color(0xFF00a79B),
        
      ),
      body: SingleChildScrollView(
        // <-- wrap this around
        child: Column(
          children: <Widget>[Body()],
        ),
      ),
    );
  }
}