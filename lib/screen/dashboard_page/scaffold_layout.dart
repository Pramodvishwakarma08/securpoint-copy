import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:securepoint/core/constants/size.dart';
import 'package:securepoint/screen/Widget/custom_image_view.dart';
import 'package:securepoint/screen/home_page/homescreen.dart';
import '../Widget/cummon_card_to_item_view/floatingActionButton_add_assset.dart';
import '../chat/Pages/chats/chats_screen.dart';
import '../my_assets_screen/my_assets_screen.dart';

class ScaffoldLayout extends StatefulWidget {
  const ScaffoldLayout({
    super.key,
    this.showBottomAppBar = false,
    this.showFloatingActionButton = false,
    required this.activeIndex,
    this.appBar,
    this.body,
  });
  final bool showBottomAppBar;
  final bool showFloatingActionButton;
  final int activeIndex;
  final  PreferredSizeWidget ? appBar ;
  final Widget ? body ;

  @override
  State<ScaffoldLayout> createState() => _ScaffoldLayoutState();
}

class _ScaffoldLayoutState extends State<ScaffoldLayout> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: widget.appBar,
      floatingActionButton : widget.showFloatingActionButton == true ? floatingActionButtonAddAssets() : null ,
      bottomNavigationBar:widget.showBottomAppBar == true ?   Container(
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.06), // #000000 with 6% opacity
              offset: Offset(0, -4), // X: 0, Y: -4
              blurRadius: 4, // Blur radius: 4
              spreadRadius: 0, // Spread radius: 0
            ),
          ],
        ),
        height:Platform.isIOS ? 75.ah :  66.ah ,
        width: MediaQuery.of(context).size.width,
        child: Padding(
          padding:  EdgeInsets.only(bottom:Platform.isIOS ? 10.ah : 0.ah),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(width: 92.aw,),
              InkWell(
                onTap: () {
                  if(widget.activeIndex==1){
                  }else{
                    Get.offAll(()=> const HomeScreenNew(),transition: Transition.rightToLeft,);
                  }
                },
                child: SizedBox(
                  width: 65.aw,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      CustomImageView(
                        imagePath: "assets/image/home_icon.svg",
                        height: 19.adaptSize,width: 17.adaptSize,
                      ),
                      const Text("Home",style: TextStyle(fontSize: 11,fontWeight:FontWeight.w400,color: Color(0xff333333)),)
                    ],
                  ),
                ),
              ),
              const Spacer(),
              InkWell(
                onTap: () {
                  if(widget.activeIndex==2){

                  }else{
                    Get.offAll(()=>  MyAssetsScreen(),transition: Transition.rightToLeft);
                  }

                },
                child: SizedBox(
                  width: 65.aw,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      CustomImageView(
                        imagePath: "assets/image/asset_icon.svg",
                        height: 17.adaptSize,width: 16.adaptSize,
                      ),
                      const Text("Asset",style: TextStyle(fontSize: 11,fontWeight:FontWeight.w400,color: Color(0xff333333)),)
                    ],
                  ),
                ),
              ),
              const Spacer(),
              InkWell(
                onTap: () {
                  if(widget.activeIndex==3){

                  }else{
                    Get.offAll(()=> ChatsScreen(chatmodels: [],),transition: Transition.rightToLeft);
                  }

                },
                child: SizedBox(
                  width: 65.aw,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      CustomImageView(
                        imagePath: "assets/image/msg_black_icon.svg",
                        height: 15.adaptSize,width: 15.adaptSize,
                      ),
                      const Text("Messages",style: TextStyle(fontSize: 11,fontWeight:FontWeight.w400,color: Color(0xff333333)),)
                    ],
                  ),
                ),
              ),
              SizedBox(width: 92.aw,),
            ],
          ),
        ),
      ) : null,
      body: widget.body ?? Container(),
    );
  }
}
