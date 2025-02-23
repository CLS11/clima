// ignore_for_file: deprecated_member_use

import 'package:geolocator/geolocator.dart';

class Location {
  Location({ this.latitude,  this.longitude});
  double? latitude;
  double? longitude;

  Future<void> getCurrentLocation() async {
    try {
      final position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.low,
      );
      latitude = position.latitude;
      longitude = position.longitude;
    } catch (e) {
      print(e);
    }
  }
}
