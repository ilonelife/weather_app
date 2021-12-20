import 'package:geolocator/geolocator.dart';

class MyLocation {
  double? latitude2;
  double? longitude2;

  Future<void> getMyCurrentLocation() async{
    try {
      Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high);
      latitude2 = position.latitude;
      longitude2 = position.longitude;
      print('[Coding Chef] $position  $latitude2 $longitude2');
    } catch(e) {
      print('[Coding Chef] There was a problem with the internet connection');
    }

  }

}
