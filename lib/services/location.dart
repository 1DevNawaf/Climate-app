import 'package:geolocator/geolocator.dart';

class Location {
  double lat;
  double long;

  Future<void> getCurrentLocation() async {
    try {
      Position position = await Geolocator()
          .getCurrentPosition(desiredAccuracy: LocationAccuracy.best);

      lat = position.latitude;
      long = position.longitude;

      //print(position);
    } catch (e) {
      print(e);
    }
  }
}
