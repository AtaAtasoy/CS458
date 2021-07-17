import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:project_3_map/coordinateInputValidator.dart';
import 'package:project_3_map/coredistancecalculator.dart';

class EarthCoreDistance extends StatefulWidget {
  static String routeName = "/manuelCore";
  @override
  _EarthCoreDistanceState createState() => _EarthCoreDistanceState();
}

class _EarthCoreDistanceState extends State<EarthCoreDistance> {
  Position? _currentPosition;
  double? _distanceToCore = 0;
  final latitudeFieldController = TextEditingController();
  final longtitudeFieldController = TextEditingController();
  bool invalidInput = false;

  @override
  void dispose() {
    latitudeFieldController.dispose();
    longtitudeFieldController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Calculate Distance to the Earth's Core"),
      ),
      body: Column(children: [
        SizedBox(height: 40.0),
        TextField(
            controller: latitudeFieldController,
            keyboardType: TextInputType.number,
            key: Key('latitude-field'),
            decoration: InputDecoration(
                border: OutlineInputBorder(), labelText: 'Latitude')),
        TextField(
            controller: longtitudeFieldController,
            keyboardType: TextInputType.number,
            key: Key('longtitude-field'),
            decoration: InputDecoration(
                border: OutlineInputBorder(), labelText: 'Longtitude')),
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
        if (invalidInput) Text("Invalid Input"),
        if (_currentPosition != null)
          Text(
              "GPS data for your coordinates: LAT: ${_currentPosition?.latitude}, LNG: ${_currentPosition?.longitude}"),
        Text("Distance to the Earth's Core: $_distanceToCore kilometers"),
      ]),
    );
  }

  _getCurrentLocation() {
    var latitudeInput = latitudeFieldController.text;
    var longtitudeInput = longtitudeFieldController.text;
    print("The location input: " + latitudeInput + "," + longtitudeInput);

    // If the input field is empty get the gps location on click
    if (latitudeInput == "" && longtitudeInput == "") {
      determinePosition().then((Position pos) {
        setState(() {
          invalidInput = false;
          _distanceToCore = calculateDistanceToCore(pos.latitude);
          _currentPosition = pos;
        });
      }).catchError((e) {
        print(e);
      });
      // display error message ın invalid input
    } else if (!validateCoordinateInput(latitudeInput, longtitudeInput)) {
      print("Invalid Input");
      setState(() {
        invalidInput = true;
      });
    } else {
      // calculate distance with user data
      double latitude = double.parse(latitudeFieldController.text);
      setState(() {
        invalidInput = false;
        _distanceToCore = calculateDistanceToCore(latitude);
      });
    }
  }
}
