import 'dart:math';
import 'package:geolocator/geolocator.dart';
import 'package:vector_math/vector_math.dart';

/// Determine the current position of the device.
///
/// When the location services are not enabled or permissions
/// are denied the `Future` will return an error.
Future<Position> determinePosition() async {
  bool serviceEnabled;
  LocationPermission permission;

  // Test if location services are enabled.
  serviceEnabled = await Geolocator.isLocationServiceEnabled();
  if (!serviceEnabled) {
    // Location services are not enabled don't continue
    // accessing the position and request users of the
    // App to enable the location services.
    return Future.error('Location services are disabled.');
  }

  permission = await Geolocator.checkPermission();
  if (permission == LocationPermission.denied) {
    permission = await Geolocator.requestPermission();
    if (permission == LocationPermission.denied) {
      // Permissions are denied, next time you could try
      // requesting permissions again (this is also where
      // Android's shouldShowRequestPermissionRationale
      // returned true. According to Android guidelines
      // your App should show an explanatory UI now.
      return Future.error('Location permissions are denied');
    }
  }

  if (permission == LocationPermission.deniedForever) {
    // Permissions are denied forever, handle appropriately.
    return Future.error(
        'Location permissions are permanently denied, we cannot request permissions.');
  }

  // When we reach here, permissions are granted and we can
  // continue accessing the position of the device.
  return await Geolocator.getCurrentPosition();
}

/// The geocentric radius is the distance from the Earth's center to a point on the spheroid surface at geodetic latitude φ
/// Used the formula at: https://en.wikipedia.org/wiki/Earth_radius#Radius_at_a_given_geodetic_latitude
double calculateDistanceToCore(double latitude) {
  print(latitude);
  double RADIUS_AT_EQUATOR = 6378.137;
  double RADIUS_AT_POLE = 6356.752;

  final t1 = pow(pow(RADIUS_AT_EQUATOR, 2) * cos(radians(latitude)), 2) +
      pow(pow(RADIUS_AT_POLE, 2) * sin(radians(latitude)), 2);

  final t2 = pow(RADIUS_AT_EQUATOR * cos(radians(latitude)), 2) +
      pow(RADIUS_AT_POLE * sin(radians(latitude)), 2);

  var result = sqrt(t1 / t2);
  print(result);
  return result;
}

double calculateDistanceToBigBen(double latitude, double longitude) {
  print(latitude);
  double bigBenLat = 51.510357;
  double bigBenLong = -0.116773;

  var result =
      Geolocator.distanceBetween(latitude, longitude, bigBenLat, bigBenLong);
  print(result);
  return result;
}
