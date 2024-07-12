import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:securepoint/core/constants/size.dart';
import 'package:securepoint/screen/Widget/custom_image_view.dart';
import 'package:securepoint/screen/const_iteam/custom_button.dart';
import 'package:securepoint/screen/home_page/homescreen.dart';

class SuccessFullyPage extends StatelessWidget {
  const SuccessFullyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Column(
        mainAxisAlignment:MainAxisAlignment.center,
        children: [
          Center(
            child: CustomImageView(
              imagePath: "assets/image/paymentsuccessful.png",
            ),
          ),
          SizedBox(
            height: 100.ah,
          ),
          CustomPrimaryBtn(title: "Back To Home", isLoading: false, onTap: () {
            Get.offAll(()=>const HomeScreenNew());
          },)
        ],
      ),
    );
  }
}
