import 'package:permission_handler/permission_handler.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:weather_app/exports.dart';

part 'location_service.g.dart';

class LocationService {
  Future<Position> _determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    // Test if location services are enabled.
    serviceEnabled = await Geolocator.isLocationServiceEnabled();

    if (!serviceEnabled) {
      // Location services are not enabled don't continue
      // accessing the position and request users of the
      // App to enable the location services.
      Permission.location.shouldShowRequestRationale;
    }

    permission = await Geolocator.checkPermission();

    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
    }

    if (permission == LocationPermission.deniedForever) {
      // Permissions are denied forever, handle appropriately.
    }

    // When we reach here, permissions are granted and we can
    // continue accessing the position of the device.
    return Geolocator.getCurrentPosition(forceAndroidLocationManager: true);
  }

  Future<String> getCurrentCityLocation() async {
    try {
      final Position currentPosition = await _determinePosition();

      final List<Placemark> placemarks = await placemarkFromCoordinates(
        currentPosition.latitude,
        currentPosition.longitude,
      );

      final Placemark place = placemarks[0];

      final String city = place.locality!;

      return city;
    } catch (e) {
      throw const AppException(
        message: 'Please enable the location service of your device',
      );
    }
  }
}

@Riverpod(keepAlive: true)
LocationService locationService(LocationServiceRef ref) {
  return LocationService();
}

@Riverpod(keepAlive: true)
Future<String> currentLocationFuture(CurrentLocationFutureRef ref) {
  final locationService = ref.watch(locationServiceProvider);
  return locationService.getCurrentCityLocation();
}
