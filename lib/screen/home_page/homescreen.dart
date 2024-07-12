import 'dart:io';
import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:securepoint/screen/Widget/CommonGridViewBuilder/common_gridview.dart';
import 'package:securepoint/screen/Widget/custom_image_view.dart';
import 'package:securepoint/screen/dashboard_page/scaffold_layout.dart';
import 'package:securepoint/screen/home_page/home_screen_controller.dart';
import 'package:securepoint/core/constants/size.dart';
import 'package:share_plus/share_plus.dart';
import '../Widget/bottom_sheet_widgets.dart';
import '../Widget/search_textfield_widget.dart';
import '../all_categories/all_category_screen.dart';
import '../drawer_screen/drawer_screen.dart';
import '../featured_assest_and_all_assets/featured_assest_view_all_screen.dart';
import '../filtere_assets_by_categories_screen/fillter_assets_screen.dart';
import '../notification_screen/notification_screen.dart';




class HomeScreenNew extends StatefulWidget {
  const HomeScreenNew({super.key});

  @override
  State<HomeScreenNew> createState() => _HomeScreenNewState();
}

class _HomeScreenNewState extends State<HomeScreenNew> {


  HomeScreenController homeScreenController = Get.put(HomeScreenController());
  ShareController shareControllernotuse = Get.put(ShareController(),permanent: true);

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    return ScaffoldLayout(
      activeIndex: 1,
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
        children: [
          Padding(
            padding: EdgeInsets.only(left: 18.0.aw, right: 18.aw),
            child: Column(
              children: [
                SizedBox(height: 20.ah),
                // Use Builder to get the widget context
                ElevatedButton(
                  onPressed: () async {
                    try {
                      await Share.share("pramid");
                    } catch (e) {
                      print("Error: $e");
                    }
                  },
                  child: const Text('Share'),
                ),


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
                serchTextField(context: context,controller:homeScreenController.serchController,onChange: (p0) {
                  homeScreenController.getHome();
                  setState(() {
                  });
                },),
                SizedBox(height: 20.ah),
                viewAllRow(name: 'Categories', onTap: () => Get.to(() =>const AllCategories()), Subname: 'View all'),



              ],
            ),

          ),
          Padding(
            padding: EdgeInsets.only(left: 18.0.aw, right: 0.aw),
            child: categories(),
          ),

          Padding(
            padding: EdgeInsets.only(left: 20.0.aw, right: 20.aw),
            child: Column(
              children: [
                dottedLine(),
                SizedBox(height: 20.ah),
                viewAllRow(name: 'Featured Assets', onTap: () {Get.to(()=> const FeaturedAssetsScreen());}, Subname: 'View more',),
                SizedBox(height: 15.ah),
              ],
            ),

          ),
          Obx(()=> SizedBox(
                child:  homeScreenController.isLoading.value ? const Center(child: Text(""),) : GridViewBuilderCommonAssetCard(assets: homeScreenController.homePageModel.assets!)),
          ),
          SizedBox(height:Platform.isIOS ?  85.ah : 105.ah,),
        ],
      ),


    );
  }

  Widget categories() {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: 186.ah,
      child: Obx(
        () => homeScreenController.isLoading.value
            ? const Center(
                child: CircularProgressIndicator(strokeWidth: 2,),
              )
            : ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemCount: homeScreenController.homePageModel
                        .categories?.length ??
                    0,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.only(
                      right: 10,
                    ),
                    child: InkWell(
                      onTap: () {
                        Get.to(()=>FilteredAssetsScreen(categreyID: homeScreenController!.homePageModel!.categories![index],));

                      },
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Card(
                            color: Colors.white,
                            shadowColor: Colors.white70,
                            child: CustomImageView(
                              width: 127.aw,
                              height: 100.ah,
                              imagePath: homeScreenController
                                  .homePageModel
                                  .categories?[index]
                                  .categoryImage,
                              radius: BorderRadius.circular(15),
                              fit: BoxFit.cover,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text(
                                  '${homeScreenController.homePageModel.categories?[index].categoryName}'
                                      .capitalizeFirst!,
                                  style: TextStyle(
                                    fontFamily: 'Roboto',
                                    color: Color(0xFF3F423F),
                                    fontWeight: FontWeight.w600,
                                    fontSize: 14.fSize,
                                  ),
                                ),
                                Text(
                                  '${homeScreenController.homePageModel.categories?[index].count} items',
                                  style: TextStyle(
                                    fontFamily: 'Roboto',
                                    color:const Color(0xFF000000).withOpacity(0.50),
                                    fontWeight: FontWeight.w400,
                                    fontSize: 12.fSize,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
      ),
    );
  }
  Widget viewAllRow({required String name,required String Subname, Function()? onTap}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '  ${name}',
          style: TextStyle(
              fontFamily: 'Roboto',
              color: Color(0xff000000).withOpacity(0.70),
              fontWeight: FontWeight.w500,
              fontSize: 14.fSize),
        ),
        InkWell(
          onTap: onTap,
          child: Container(
            alignment: Alignment.topRight,
            color: Colors.white,
            height: 30.ah,
            child: Text(
              '${Subname} ',
              style: TextStyle(
                  fontFamily: 'Roboto',
                  color: const Color(0xff000000).withOpacity(0.70),
                  fontWeight: FontWeight.w400,
                  fontSize: 13.fSize,
                  decoration: TextDecoration.underline,
                  decorationColor: Color(0xff000000).withOpacity(0.70)),
            ),
          ),
        ),
      ],
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


