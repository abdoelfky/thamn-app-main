part of core;

class GeolocationX {
  static int getDistanceBetweenPosition(
      {required LatLng currentPosition,
      required LatLng positionForCalculation}) {
    return Geolocator.distanceBetween(
      positionForCalculation.latitude,
      positionForCalculation.longitude,
      currentPosition.latitude,
      currentPosition.longitude,
    ).round();
  }

  static Future<Position?> getLocation() async {
    if (await permission()) {
      if (await isLocationServiceEnabled()) {
        return await Geolocator.getCurrentPosition(
            forceAndroidLocationManager: true,
            desiredAccuracy: LocationAccuracy.low);
      } else {
        return Future.error(
            'Please turn on the location service of the device');
      }
    }
    return null;
  }

  static Future<String> getAddressFromLocation(
      {required LatLng location}) async {
    try {
      List<Placemark> x =
          await placemarkFromCoordinates(location.latitude, location.longitude);
      String address = '';
      if (x[0].street != null) {
        address += x[0].street!;
      }
      if (x[0].subLocality != null) {
        if (address.isNotEmpty) {
          address += ', ';
        }
        address += x[0].subLocality!;
      }
      return address;
    } catch (e) {
      return Future.error(e);
    }
  }

  static Future<bool> permission() async {
    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.always) {
      return true;
    }
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return false;
      }
    }
    if (permission == LocationPermission.deniedForever) {
      return false;
    }
    return true;
  }

  static isLocationServiceEnabled() async {
    return await Geolocator.isLocationServiceEnabled();
  }
}
