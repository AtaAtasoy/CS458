import 'package:flutter/material.dart';

class  ManualScreen extends StatefulWidget {
  static String routeName = "/manuel";
  @override
    _ManualScreenState createState() => _ManualScreenState();
}

class _ManualScreenState extends State<ManualScreen> {
  final latitudeFieldController = TextEditingController();
  final longtitudeFieldController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Learn The City of A Cordinate"),
        
      ),

      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 30.0),
          TextField(
              controller: latitudeFieldController,
              keyboardType: TextInputType.number,
              key: Key('latitude-field'),
              decoration: InputDecoration(
                  border: OutlineInputBorder(), labelText: 'Latitude')),
                  SizedBox(height: 30.0),
          TextField(
              controller: longtitudeFieldController,
              keyboardType: TextInputType.number,
              key: Key('longtitude-field'),
              decoration: InputDecoration(
                  border: OutlineInputBorder(), labelText: 'Longtitude')),
                  
                  SizedBox(height: 30.0),
                  
                  Text("Your city:") ]
      ),
    ),
    );
  }
}
