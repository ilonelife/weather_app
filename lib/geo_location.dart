// import 'package:flutter/material.dart';
// import 'package:geolocator/geolocator.dart';
// //import 'package:geocoding/geocoding.dart';
// import 'package:weather_app/data/my_location.dart';
// import 'package:weather_app/data/network.dart';
//
// const apiKey = '5a65e5ac9b7dbbcc1466f9e52e7540fb';
//
// class GeoLocation extends StatefulWidget {
//   const GeoLocation({Key? key}) : super(key: key);
//
//   @override
//   _GeoLocationState createState() => _GeoLocationState();
// }
//
// class _GeoLocationState extends State<GeoLocation> {
//   double? latitude3;
//   double? longitude3;
//
//   String location = 'Null, Press Button';
//   String Address = 'search';
//
//   Future<Position> _getGeoLocationPosition() async {
//     bool serviceEnabled;
//     LocationPermission permission;
//
//     // Test if location services are enabled.
//     serviceEnabled = await Geolocator.isLocationServiceEnabled();
//     if (!serviceEnabled) {
//       await Geolocator.openLocationSettings();
//       return Future.error('Location services are disabled.');
//     }
//
//     permission = await Geolocator.checkPermission();
//     if (permission == LocationPermission.denied) {
//       permission = await Geolocator.requestPermission();
//       if (permission == LocationPermission.denied) {
//         return Future.error('Location permissions are denied');
//       }
//     }
//
//     if (permission == LocationPermission.deniedForever) {
//       // Permissions are denied forever, handle appropriately.
//       return Future.error(
//           'Location permissions are permanently denied, we cannot request permissions.');
//     }
//
//     return await Geolocator.getCurrentPosition(
//         desiredAccuracy: LocationAccuracy.high);
//   }
//
//   // Future<void> getAddressFromLatLong(Position position) async {
//   //   List<Placemark> placemarks =
//   //       await placemarkFromCoordinates(position.latitude, position.longitude);
//   //   print(placemarks);
//   //   Placemark place = placemarks[0];
//   //   Address =
//   //       '${place.street}, ${place.subLocality}, ${place.locality}, ${place.postalCode}, ${place.country}';
//   //   setState(() {});
//   // }
//
//   // 코딩 쉐프 함수
//   void geoLocation() async {
//     MyLocation myLocation = MyLocation();
//     await myLocation.getMyCurrentLocation();
//     latitude3 = myLocation.latitude2;
//     longitude3 = myLocation.longitude2;
//
//     // Network network = Network(
//     //     'https://api.openweathermap.org/data/2.5/weather?lat=$latitude3&lon=$longitude3&appid=$apiKey');
//     //
//     // var weatherData = await network.getJsonData();
//     // print('[코딩쉐프] $weatherData');
//   }
//
//   // 코딩 쉐프 함수
//   // void fetchData() async{
//   //
//   //     var myJson = parsingData['weather'][0]['description'];
//   //     print(myJson);
//   //
//   //     var wind = parsingData['wind']['speed'];
//   //     print(wind);
//   //   } else {
//   //     print(response.statusCode);
//   //   }
//   // }
//
//   @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//     geoLocation();
//     //  fetchData();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Location'),
//         backgroundColor: Colors.orange,
//         actions: [
//           IconButton(onPressed: () {}, icon: const Icon(Icons.explore)),
//         ],
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             const Text(
//               'Coordinates Points',
//               style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
//             ),
//             const SizedBox(
//               height: 10,
//             ),
//             Text(
//               location,
//               style: const TextStyle(color: Colors.black, fontSize: 16),
//             ),
//             const SizedBox(
//               height: 10,
//             ),
//             const Text(
//               'ADDRESS',
//               style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
//             ),
//             const SizedBox(
//               height: 10,
//             ),
//             Text(Address),
//             ElevatedButton(
//                 onPressed: () async {
//                   Position position = await _getGeoLocationPosition();
//                   location =
//                       'Lat: ${position.latitude} , Long: ${position.longitude}';
//      //             getAddressFromLatLong(position);
//                 },
//                 child: const Text('Get Location'))
//           ],
//         ),
//       ),
//     );
//   }
// }
