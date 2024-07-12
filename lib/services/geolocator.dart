import 'package:geolocator/geolocator.dart';

Future<Position> getLocation() async {
  LocationPermission locationPermission;
  locationPermission = await Geolocator.checkPermission();

  if (locationPermission == LocationPermission.denied) {
    locationPermission = await Geolocator.requestPermission();

    if (locationPermission == LocationPermission.denied) {
      return Future.error('Location Permissions are denied');
    }
  }
  if (locationPermission == LocationPermission.deniedForever) {
    return Future.error(
        'Location Permissions are permanently denied, we can not request permission');
  }
  return await Geolocator.getCurrentPosition();
}
