import 'package:geolocator/geolocator.dart';

Future<Position?> getDeviceLocation() async {
  bool serviceEnabled;
  LocationPermission permission;

  serviceEnabled = await Geolocator.isLocationServiceEnabled();
  if (!serviceEnabled) {
    throw Exception("Location services are disabled.");
  }

  permission = await Geolocator.checkPermission();
  if (permission == LocationPermission.denied) {
    permission = await Geolocator.requestPermission();
    if (permission == LocationPermission.denied) {
      return null; // permission denied
    }
  }

  if (permission == LocationPermission.deniedForever) {
    return null; // permanently denied
  }

  // Try current position first
  try {
    return await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high,
    );
  } catch (_) {
    // Fallback to last known position
    return await Geolocator.getLastKnownPosition();
  }
}
