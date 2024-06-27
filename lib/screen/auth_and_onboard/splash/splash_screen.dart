import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:securepoint/core/utils/pref_utils.dart';
import 'package:securepoint/screen/home_page/homescreen.dart';
import '../onboardings/onbord.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  bool isFivescondDone = false;

  name(context) async {
    await Future.delayed(const Duration(seconds: 2));
    isFivescondDone = true;
    setState(() {});

    await Future.delayed(const Duration(seconds: 3));
    onTap(context);
  }

  onTap(context) {
    bool isLoggedIn = PrefUtils().isLoggedIn();
    print("isLoggedIn == $isLoggedIn");
    if (isLoggedIn) {
      Get.offAll(() => HomeScreenNew());
    } else {
      Get.offAll(() => const OnBoard());
    }
  }

  @override
  void initState() {
    super.initState();
    name(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: isFivescondDone ? Colors.white : Color(0xff32CD30),
      body: Center(
        child: Container(
          height: 180, width: 150,
          //color: Colors.white,
          child: Image.asset(
            isFivescondDone
                ? 'assets/image/ic_security_24px.png'
                : 'assets/image/ic_security_24px (1).png',
            height: 180,
            width: 150,
            fit: BoxFit.fill,
          ),
          //FlutterLogo(size:MediaQuery.of(context).size.height)
        ),
      ),
    );
  }
}
