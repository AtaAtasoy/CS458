import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:project_3_map/coordinateInputValidator.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_dotenv/flutter_dotenv.dart';

class FindCity extends StatefulWidget {
  static String routeName = "/findcitydistance";
  @override
  _FindCityState createState() => _FindCityState();
}

class _FindCityState extends State<FindCity> {
  String? _currentAddress;
  final latitudeFieldController = TextEditingController();
  final longitudeFieldController = TextEditingController();
  bool invalidInput = false;

  @override
  void dispose() {
    latitudeFieldController.dispose();
    longitudeFieldController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Find the City by Coordinates"),
      ),
      body: Column(
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
              controller: longitudeFieldController,
              keyboardType: TextInputType.number,
              key: Key('longtitude-field'),
              decoration: InputDecoration(
                  border: OutlineInputBorder(), labelText: 'Longitude')),
          SizedBox(height: 30.0),
          ElevatedButton(
              onPressed: () => _getAddressFromLatLng(),
              child: Row(children: [
                Icon(
                  Icons.map_rounded,
                  key: Key('icon-go'),
                ),
                Text("Find my city!")
              ])),
          if (invalidInput) Text("Invalid Input"),
          if (_currentAddress != null) Text("Your city: $_currentAddress"),
        ],
      ),
    );
  }

  _getAddressFromLatLng() async {
    await dotenv.load(fileName: ".env");
    String? GOOGLE_API_KEY = dotenv.env["GOOGLE_API_KEY"];
    var latitudeInput = latitudeFieldController.text;
    var longtitudeInput = longitudeFieldController.text;
    if (!validateCoordinateInput(latitudeInput, longtitudeInput)) {
      print("Invalid Input");
      setState(() {
        invalidInput = true;
      });
    } else {
      // calculate distance with user data
      double latitude = double.parse(latitudeFieldController.text);
      double longitude = double.parse(longitudeFieldController.text);
      if (GOOGLE_API_KEY != null){
        String url =
            "https://maps.googleapis.com/maps/api/geocode/json?latlng=$latitude,$longitude&key=" + GOOGLE_API_KEY;
        http.Response response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        String jsonData = response.body;
        var decodeData = jsonDecode(jsonData);
        print(decodeData["results"][0]["address_components"][1]["long_name"]);
        String address =
            decodeData["results"][0]["address_components"][1]["long_name"];
        setState(() {
          invalidInput = false;
          _currentAddress = address;
        });
      }
      } else {
        setState(() {
          invalidInput = false;
          _currentAddress = "Failed to get Address";
        });
      }

      /*
      List<Placemark> newPlace =
          await placemarkFromCoordinates(latitude, longitude);

      // this is all you need
      Placemark placeMark = newPlace[0];
      String? locality = placeMark.locality;
      String? country = placeMark.country;
      if (locality != null && country != null) {
        String address = " ${locality}, ${country}";
        setState(() {
          invalidInput = false;
          _currentAddress = address;
        });
      } else {
        setState(() {
          _currentAddress = "Failed to get Address";
        });
      }*/
    }
  }
}
