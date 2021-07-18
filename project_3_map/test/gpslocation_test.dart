import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:project_3_map/distancecalculators.dart';

import 'gpslocation_test.mocks.dart';

// Generate a MockClient using the Mockito package.
// Create new instances of this class in each test.
@GenerateMocks([http.Client])
void main() {
  group('fetch GPS location', () {
    test('returns a Map<String, double> if the http call is successful',
        () async {
      final client = MockClient();
      when(client.post(Uri.parse(
              "https://www.googleapis.com/geolocation/v1/geolocate?key=AIzaSyBYSadq8OG4WPYjTh7QZhQ6PCI_On0OoCQ")))
          .thenAnswer((_) async => http.Response(
              '{"location": {"lat": 39.9638528,"lng": 32.8073216},"accuracy": 17889}',
              200));

      expect(await determinePosition(), isA<Map<String, double>>());
    });
  });
}
