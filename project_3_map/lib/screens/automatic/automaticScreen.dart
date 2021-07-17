import 'package:flutter/material.dart';

class AutomaticScreen extends StatefulWidget {
  static String routeName = "/automatic";
  @override
  _AutomaticScreenState createState() => _AutomaticScreenState();
}

class _AutomaticScreenState extends State<AutomaticScreen> {
  var locationMessage = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Calculate Distance to The Big Ben"),
        ),
        body: Padding(
          padding: const EdgeInsets.all(50.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(
                Icons.location_on,
                size: 46.0,
                color: Colors.blue,
              ),
              SizedBox(
                height: 10.0,
              ),
              Text(
                "Get your current location",
                style: TextStyle(fontSize: 26.0, fontWeight: FontWeight.bold),
              ),
              TextButton(
                onPressed: () {},
                child:
                    Text("Get Location", style: TextStyle(color: Colors.blue)),
              ),
              SizedBox(height: 15.0),
              Text(locationMessage)
            ],
          ),
        ));
  }
}

