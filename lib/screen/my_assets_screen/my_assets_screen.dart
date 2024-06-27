import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:securepoint/core/constants/size.dart';
import 'package:securepoint/screen/Widget/search_textfield_widget.dart';
import 'package:securepoint/screen/dashboard_page/scaffold_layout.dart';
import '../Widget/asset_card/custom_card_for_my_assets.dart';
import 'my_assets_controller.dart';

class MyAssetsScreen extends StatefulWidget {
  const MyAssetsScreen({super.key});

  @override
  State<MyAssetsScreen> createState() => _MyAssetsScreenState();
}

class _MyAssetsScreenState extends State<MyAssetsScreen> {
  MyAssetsController controller = Get.put(MyAssetsController());

  @override
  Widget build(BuildContext context) {
    return ScaffoldLayout(
      showFloatingActionButton: true,
      activeIndex: 2,
      appBar: AppBar(
        leading: Navigator.canPop(context) == false
            ? Container()
            : InkWell(
                onTap: () {
                  Get.back();
                },
                child: const Icon(Icons.arrow_back_outlined,
                    color: Color(0xFF6A6A6A))),
        // automaticallyImplyLeading: true,
        title: Text(
          'My Assets',
          style: TextStyle(
              fontFamily: 'Inter',
              color: const Color(0xFF6A6A6A),
              fontWeight: FontWeight.w600,
              fontSize: 19.fSize),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        surfaceTintColor: Colors.white,
        shadowColor: Colors.black26,
        elevation: 3,
      ),
      showBottomAppBar: true,
      body: ListView(
        children: [
          Padding(
            padding: EdgeInsets.only(left: 20.h, right: 20.h),
            child: Column(
              children: [
                SizedBox(height: 10.ah),
                serchTextField(
                  context: context,
                  controller: controller.searchController,
                  onChange: (p0) {
                    controller.getMyasset();
                    // _onSearchChanged();
                  },
                ),
                SizedBox(height: 20.ah),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: 10.h),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Obx(
                            () => Text(
                              '${controller.isLoading.value ? 0 : controller.myAssetsModel.total} items',
                              style: TextStyle(
                                  decoration: TextDecoration.underline,
                                  decorationColor:
                                      Color(0xff263238).withOpacity(0.70),
                                  color: Color(0xff263238).withOpacity(0.70),
                                  fontWeight: FontWeight.w500,
                                  fontSize: 13.fSize),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20.ah),
              ],
            ),
          ),
          Obx(
            () => controller.isLoading.value
                ? const Center(
                    child: CircularProgressIndicator(strokeWidth: 2,),
                  )
                : controller.myAssetsModel.assets!.isEmpty
                    ? SizedBox(
                        height: 400.ah,
                        child: const Center(
                          child: Text("No assets to display"),
                        ))
                    : GridView.builder(
                        shrinkWrap: true,
                        primary: false,
                        physics: const NeverScrollableScrollPhysics(),
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(

                            // crossAxisCount: 2,
                            // mainAxisExtent: 262.ah,
                            // mainAxisSpacing: 21.ah,
                            // crossAxisSpacing: 24.aw
                            crossAxisCount: 2,
                            mainAxisExtent: 248.ah,
                            mainAxisSpacing: 21.ah,
                            crossAxisSpacing: 22.aw),
                        itemCount: controller.myAssetsModel.assets?.length ?? 0,
                        itemBuilder: (context, index) {
                          return CustomCardForMyAsset(
                            assetDetailsModel:
                                controller.myAssetsModel.assets![index],
                            index: index,
                          );
                        },
                      ),
          ),
          SizedBox(
            height: Platform.isIOS ? 70.ah : 120.ah,
          )
        ],
      ),
    );
  }
}
