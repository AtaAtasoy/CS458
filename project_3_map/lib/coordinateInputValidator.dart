  
bool validateCoordinateInput(String latitude, String longtitude) {
  RegExp coordinatesRegex = RegExp(
      r'^[-+]?([1-8]?\d(\.\d+)?|90(\.0+)?),\s*[-+]?(180(\.0+)?|((1[0-7]\d)|([1-9]?\d))(\.\d+)?)$');
  String coordinates = latitude + "," + longtitude;
  return coordinatesRegex.hasMatch(coordinates);
}