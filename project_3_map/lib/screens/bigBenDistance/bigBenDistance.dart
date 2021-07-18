import 'package:flutter/material.dart';
import 'package:project_3_map/distancecalculators.dart';

class BigBenDistance extends StatefulWidget {
  static String routeName = "/bigbendistance";
  @override
  _BigBenScreenState createState() => _BigBenScreenState();
}

class _BigBenScreenState extends State<BigBenDistance> {
  var locationMessage = "";
  double? _currentLat;
  double? _currentLng;
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
                  "Calculate the distance from your location to the Big Ben",
                  style: TextStyle(fontSize: 26.0, fontWeight: FontWeight.bold),
                ),
                TextButton(
                  onPressed: () => _getCurrentLocation(),
                  child:
                      Text("Calculate", style: TextStyle(color: Colors.blue)),
                ),
                SizedBox(height: 15.0),
                if (_distanceToBigBen != null)
                  Text(
                      "The distance to Big Ben is : $_distanceToBigBen meters")
              ],
            ),
          ),
        ));
  }

  _getCurrentLocation() {
    print("Determining the Location from the GPS!");
      determinePosition().then((Map<String, double>? pos) {
        print("The GPS Location: " +
            pos!["lat"].toString() +
            ", " +
            pos["lng"].toString());
        setState(() {
          _distanceToBigBen = calculateDistanceToBigBen(pos["lat"], pos["lng"]);
          _currentLat = pos["lat"];
          _currentLng = pos["lng"];
        });
      }).catchError((e) {
        print(e);
      });
  }
}
