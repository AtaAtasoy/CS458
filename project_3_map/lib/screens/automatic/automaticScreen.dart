import 'package:geolocator/geolocator.dart';
import 'package:flutter/material.dart';
import 'package:project_3_map/coredistancecalculator.dart';

class AutomaticScreen extends StatefulWidget {
  static String routeName = "/automatic";
  @override
  _AutomaticScreenState createState() => _AutomaticScreenState();
}

class _AutomaticScreenState extends State<AutomaticScreen> {
  var locationMessage = "";
  Position? _currentPosition;
  double? _distanceToBigBen;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Calculate Distance to The Big Ben"),
        ),
        body: Center(
          child: Padding(
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
                  "Calculate the distance from your location to Big Ben",
                  style: TextStyle(fontSize: 26.0, fontWeight: FontWeight.bold),
                ),
                TextButton(
                  onPressed: () => _currentPosition = _getCurrentLocation(),
                  child:
                      Text("Calculate", style: TextStyle(color: Colors.blue)),
                ),
                SizedBox(height: 15.0),
                if (_distanceToBigBen != null)
                  Text(
                      "The distance to Big Ben is : ${_distanceToBigBen} meters")
              ],
            ),
          ),
        ));
  }

  _getCurrentLocation() {
    print("Determining the Location from the GPS!");
    determinePosition().then((Position pos) {
      print("The GPS Location: " + pos.toString());
      setState(() {
        _distanceToBigBen =
            calculateDistanceToBigBen(pos.latitude, pos.longitude);
        _currentPosition = pos;
      });
    }).catchError((e) {
      print(e);
    });
  }
}
