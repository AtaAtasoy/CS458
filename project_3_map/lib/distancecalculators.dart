import 'dart:convert';
import 'dart:math';
import 'package:geolocator/geolocator.dart';
import 'package:vector_math/vector_math.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_dotenv/flutter_dotenv.dart';

/// Determine the current position of the device.
///
/// When the location services are not enabled or permissions
/// are denied the `Future` will return an error.
Future<Map<String, double>?> determinePosition() async {
  await dotenv.load(fileName: ".env");
  String? GOOGLE_API_KEY = dotenv.env["GOOGLE_API_KEY"];
  if (GOOGLE_API_KEY != null) {
    String url =
        "https://www.googleapis.com/geolocation/v1/geolocate?key=" + GOOGLE_API_KEY;
    print("URL : " + url);
    http.Response response = await http.post(Uri.parse(url));
    print(response.body);
    if (response.statusCode == 200) {
      String jsonData = response.body;
      var decodeData = jsonDecode(jsonData);
      double lat = decodeData["location"]["lat"];
      double lng = decodeData["location"]["lng"];

      return {"lat": lat, "lng": lng};
    }
  } else {
    print("Error getting position");
    throw Exception("Could not get position");
  }
}

/// The geocentric radius is the distance from the Earth's center to a point on the spheroid surface at geodetic latitude φ
/// Used the formula at: https://en.wikipedia.org/wiki/Earth_radius#Radius_at_a_given_geodetic_latitude
double calculateDistanceToCore(double? latitude) {
  if (latitude != null) {
    print(latitude);
    const double RADIUS_AT_EQUATOR = 6378.137;
    const double RADIUS_AT_POLE = 6356.752;

    final t1 = pow(pow(RADIUS_AT_EQUATOR, 2) * cos(radians(latitude)), 2) +
        pow(pow(RADIUS_AT_POLE, 2) * sin(radians(latitude)), 2);

    final t2 = pow(RADIUS_AT_EQUATOR * cos(radians(latitude)), 2) +
        pow(RADIUS_AT_POLE * sin(radians(latitude)), 2);

    var result = sqrt(t1 / t2);
    print(result);
    return result;
  } else {
    throw Exception("Latitude cannot be null");
  }
}

double calculateDistanceToBigBen(double? latitude, double? longitude) {
  print(latitude);
  double bigBenLat = 51.510357;
  double bigBenLong = -0.116773;
  if (latitude != null && longitude != null) {
    var result =
        Geolocator.distanceBetween(latitude, longitude, bigBenLat, bigBenLong);
    print(result);
    return result;
  } else {
    throw Exception("Latitude and longitude cannot be null");
  }
}
