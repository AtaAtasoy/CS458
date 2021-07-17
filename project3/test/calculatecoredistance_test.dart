import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:geolocator/geolocator.dart';
import 'package:project3/coredistancecalculator.dart';

void main() {
  test("testing geolocator", () async {
    Position pos = await calculateDistanceToEarthCore();
    expect(pos, completion(equals(Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high))));
  });
}
