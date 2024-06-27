// import 'package:flutter/material.dart';
// import 'package:geolocator/geolocator.dart';
// import 'package:google_maps_flutter/google_maps_flutter.dart';
// import 'package:permission_handler/permission_handler.dart';
//
// class LocationService {
//    Future<Position?> getCurrentLocation() async {
//     // Check location permission
//     if (await Permission.locationWhenInUse.request().isGranted) {
//       // Permission granted, get the location
//       return await Geolocator.getCurrentPosition(
//         desiredAccuracy: LocationAccuracy.high,
//       );
//     } else if (await Permission.locationWhenInUse.isDenied) {
//       // Permission denied, show a message to the user
//       print("Location permission denied");
//       return null;
//     } else if (await Permission.locationWhenInUse.isPermanentlyDenied) {
//       // Permission permanently denied, open app settings
//       openAppSettings();
//       return null;
//     } else {
//       // Permission not requested or denied without 'don't ask again'
//       PermissionStatus status = await Permission.locationWhenInUse.request();
//       if (status.isGranted) {
//         return await Geolocator.getCurrentPosition(
//           desiredAccuracy: LocationAccuracy.high,
//         );
//       } else {
//         print("Location permission denied");
//         return null;
//       }
//     }
//   }
//    Future<LatLng> getLocationLatLong() async {
//     final locationService = LocationService();
//     final position = await locationService.getCurrentLocation();
//     if (position != null) {
//       return LatLng(position.latitude, position.longitude);
//     } else {
//       print("Could not get location. Please check permissions.");
//       return LatLng(0000.937, 78.9629);
//     }
//   }
//
//
//
//
//
// }
//
// class LocationServiceDemo extends StatefulWidget {
//   const LocationServiceDemo({super.key});
//
//   @override
//   _LocationServiceDemoState createState() => _LocationServiceDemoState();
// }
//
// class _LocationServiceDemoState extends State<LocationServiceDemo> {
//   LatLng ? latLng ;
//
//   demo() async {
//     latLng = await  LocationService().getLocationLatLong();
//     setState(() {
//
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("Location Permission Example"),
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             Text("${latLng?.latitude }"),
//             SizedBox(height: 20),
//             ElevatedButton(
//               onPressed: (){
//                 demo();
//               },
//               child: Text("Get Location"),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
