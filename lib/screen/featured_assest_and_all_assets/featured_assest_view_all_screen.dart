import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:securepoint/screen/Widget/CommonGridViewBuilder/common_gridview.dart';
import 'package:securepoint/screen/dashboard_page/scaffold_layout.dart';
import 'package:securepoint/core/constants/size.dart';
import '../Widget/search_textfield_widget.dart';
import '../drawer_screen/drawer_screen.dart';
import '../notification_screen/notification_screen.dart';
import 'featured_assest_controller.dart';

class FeaturedAssetsScreen extends StatefulWidget {
  const FeaturedAssetsScreen({super.key});

  @override
  State<FeaturedAssetsScreen> createState() => _FeaturedAssetsScreenState();
}

class _FeaturedAssetsScreenState extends State<FeaturedAssetsScreen> {
  FeaturedController controller = Get.put(FeaturedController());




  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller.getCategory();
    controller.firstLoad();
  }

  @override
  Widget build(BuildContext context) {
    return ScaffoldLayout(
      activeIndex: 7,
      showFloatingActionButton: true,
      appBar: AppBar(
        surfaceTintColor: Colors.white,
        backgroundColor: Colors.white,
        leading: InkWell(
            onTap: () {
              Get.to(() => const DrawerScreen(),
                  transition: Transition.leftToRight,
                  duration: Duration(milliseconds: 500));
            },
            child: const Icon(Icons.menu)),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 25),
            child: InkWell(
                onTap: () {
                  Get.to(() => const NotificationScreen());
                },
                child: SvgPicture.asset(
                  'assets/icon/Icon.svg',
                  height: 26.adaptSize,
                  width: 26.adaptSize,
                )),
          )
        ],
      ),
      showBottomAppBar: true,
      body: ListView(
        controller: controller.scrollController,
        children: [
          SizedBox(height: 20.ah),
          Center(
              child: SvgPicture.asset(
                'assets/icon/ic_security_24px.svg',
                height: 35.ah,
                width: 29.aw,
              )),
          SizedBox(height: 10.ah),
          Center(
            child: Text(
              "SecurPoint",
              style: TextStyle(
                fontFamily: 'adobe-garamond-pro',
                fontSize: 20.fSize,
                fontWeight: FontWeight.w400,
                color: Color(0xFF2B2C2B),
              ),
            ),
          ),
          SizedBox(height: 30.ah),
          Padding(
            padding: EdgeInsets.only(left: 18.0.aw, right: 18.aw),
            child: serchTextField(context: context,controller: controller.searchController ,onChange: (p0) {
              controller.page.value=1;
              controller.firstLoad();
            },),
          ),
          SizedBox(height: 20.ah),


          Padding(
            padding: EdgeInsets.only(left: 30.0.aw, right: 18.aw),
            child: Text(
              'All Assets',
              style: TextStyle(
                  fontFamily: 'Roboto',
                  color: const Color(0xff000000).withOpacity(0.70),
                  fontWeight: FontWeight.w500,
                  fontSize: 14.fSize),
            ),
          ),
          SizedBox(height: 20.ah,),
          Obx(
                () => controller.isFirstLoadRunning.value
                ? const Center(
              child: CircularProgressIndicator(strokeWidth: 2,),
            )
                : Obx(
                  () => SizedBox(
                  child: controller.isLoading.value
                      ? const Center(
                    child: Text(""),
                  )
                      : Obx(
                        () {
                      return GridViewBuilderCommonAssetCard(
                          assets: controller.assets.value);
                    },
                  )),
            ),
          ),
          Obx(() => controller.hasNextPage.value == false
              ? Container(
            height: 180,
            padding: const EdgeInsets.only(top: 30, bottom: 40),
            child: const Center(
              child: Text('No more assets found...!'),
            ),
          )
              : const SizedBox()),
          Obx(() => controller.isLoadMoreRunning.value == true
              ? const SizedBox(
            height: 180,
            child: Padding(
              padding: EdgeInsets.only(top: 10, bottom: 40),
              child: Center(
                child: CircularProgressIndicator(strokeWidth: 2),
              ),
            ),
          )
              : Container()),
          const SizedBox(
            height: 140,
          )
        ],
      ),

    );
  }

  Widget dottedLine() {
    return const DottedLine(
      direction: Axis.horizontal,
      alignment: WrapAlignment.center,
      lineLength: double.infinity,
      lineThickness: 1.0,
      dashLength: 2.0,
      dashColor: Color(0xffCECECE),
      dashRadius: 1.0,
      dashGapLength: 1.0,
      dashGapColor: Colors.transparent,
      dashGapRadius: 1.0,
    );
  }
}
