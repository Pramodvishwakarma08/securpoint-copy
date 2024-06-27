import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:securepoint/screen/auth_and_onboard/splash/splash_screen.dart';
import 'core/utils/initial_bindings.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  //lock == 1
  //unlock == 0
 // lockAndUnlock: lockUnlock == "Lock" ? "0" : '1',






  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialBinding: InitialBindings(),
      title: 'SecurPoint',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xff32CD30)),
        useMaterial3: true,
      ),
      home: const SplashScreen(),
      //demo 2 jun
      //demo 2 jun
      //demo 2 jun
    );
  }
}


