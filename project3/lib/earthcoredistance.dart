
import 'package:flutter/material.dart';

class EarthCoreDistance extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'EarthCoreDistance',
      home: Scaffold(
            body: Column(children: [
              Text("Calculate Distance to the Earth's Core"),
              TextField(
                  obscureText: true,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Enter your coordinates')),
              ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(primary: Colors.blue),
                  child: Row(children: [
                    Icon(
                      Icons.map_rounded,
                      key: Key('icon-go'),
                    ),
                    Text("Find my distance!")
                  ])),
              Text("Distance to the Core: ")
            ]),
          ),
    );
  }
}
