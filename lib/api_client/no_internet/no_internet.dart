import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:securepoint/core/utils/size_utils.dart';
import 'package:securepoint/screen/home_page/homescreen.dart';

// ignore_for_file: must_be_immutable
class NoInternetScreen extends StatelessWidget {
  NoInternetScreen({Key? key}) : super(key: key,);

  var name = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: double.maxFinite,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: 1.v),
            const Text("Connect to the internet"),
            SizedBox(height: 20.v),
            const Text("You're offline. Check your connection."),
            SizedBox(height: 20.v),
            OutlinedButton(onPressed: () {
              Get.offAll(()=> HomeScreenNew());
            }, child: const Text("Retry"))

            // CustomImageView(
            //   imagePath: "assets/image/splash.png",
            //   height: 169,
            //   width: 162,
            // ),
          ],
        ),
      ),
    );
  }
}
