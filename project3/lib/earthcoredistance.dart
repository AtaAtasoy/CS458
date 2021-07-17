import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:project3/coredistancecalculator.dart';

class EarthCoreDistance extends StatefulWidget {
  @override
  _EarthCoreDistanceState createState() => _EarthCoreDistanceState();
}

class _EarthCoreDistanceState extends State<EarthCoreDistance> {
  Position? _currentPosition;

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
              onPressed: () => _currentPosition = _getCurrentLocation(),
              style: ElevatedButton.styleFrom(primary: Colors.blue),
              child: Row(children: [
                Icon(
                  Icons.map_rounded,
                  key: Key('icon-go'),
                ),
                Text("Find my distance!")
              ])),
          if (_currentPosition != null)
            Text(
                "LAT: ${_currentPosition?.latitude}, LNG: ${_currentPosition?.longitude}"),
          Text("Distance to the Core: "),
        ]),
      ),
    );
  }

  _getCurrentLocation() {
    determinePosition().then((Position pos) {
      print("Clicked");
      setState(() {
        _currentPosition = pos;
      });
    }).catchError((e) {
      print(e);
    });
  }
}
