import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:project3/coredistancecalculator.dart';

void main() {
  test("testing geolocator", () {
    Future<double> latitude = calculateDistanceToEarthCore("args");
    expect(latitude, completion(equals(calculateDistanceToEarthCore("args"))));
  });
}
