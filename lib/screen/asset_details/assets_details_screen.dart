import 'package:expandable_text/expandable_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:securepoint/api_client/api_repository.dart';
import 'package:securepoint/core/constants/size.dart';
import 'package:securepoint/screen/Widget/asset_card/custom_card_for_user_assets.dart';
import 'package:securepoint/screen/Widget/custom_image_view.dart';
import 'package:securepoint/screen/dashboard_page/scaffold_layout.dart';
import '../../core/utils/bottomSheetWidget.dart';
import '../../core/utils/date_time_utils.dart';
import '../../model/assets_model.dart';
import '../Widget/carousel_demo/carousel_slider.dart';
import '../auth_and_onboard/user_profile/user_profile_screen.dart';
import '../map_screen/user_map_screen.dart';
import 'asset_details_controler.dart';

class AssetDetailsScreen extends StatefulWidget {
  final Asset assetDetailsModel;
  const AssetDetailsScreen({super.key, required this.assetDetailsModel});

  @override
  State<AssetDetailsScreen> createState() => _AssetDetailsScreenState();
}

class _AssetDetailsScreenState extends State<AssetDetailsScreen> {
  bool isSave = false;
  AssetsDetailsController controller =Get.put(AssetsDetailsController());

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    isSave = widget.assetDetailsModel.alreadySaved ?? false;
    controller.getRelaredAssets("${widget.assetDetailsModel.categoryId}");
  }




  @override
  Widget build(BuildContext context) {
    return ScaffoldLayout(
      activeIndex: 10,
      appBar: AppBar(
        leading: InkWell(
            onTap: () {
              Get.back();
            },
            child: const Icon(Icons.arrow_back_outlined,
                color: Color(0xFF6A6A6A))),
        title: Text(
          'Asset Details',
          style: TextStyle(
              fontFamily: 'Inter',
              color: const Color(0xFF6A6A6A),
              fontWeight: FontWeight.w600,
              fontSize: 19.fSize),
        ),
        centerTitle: true,
        actions: [
          isSave == false
              ? InkWell(
                  onTap: () async {
                    print("line72${isSave}");
                    isSave = true;
                    await ApiRepository.addToFavourite(
                        assetId: "${widget.assetDetailsModel.id}");
                    setState(() {});
                    print("line76${isSave}");
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: CustomImageView(
                      imagePath: "assets/image/save_icon_unfill.svg",
                    ),
                  ),
                )
              : InkWell(
                  onTap: () async {
                    isSave = false;
                    await ApiRepository.addToFavourite(
                        assetId: "${widget.assetDetailsModel.id}");
                    setState(() {});
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: CustomImageView(
                      imagePath: "assets/image/save_fill.svg",
                    ),
                  ),
                ),
          SizedBox(width: 4.aw),
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Icon(Icons.share, size: 20, color: Color(0xFF6A6A6A)),
          ),
          SizedBox(width: 20.aw),
        ],
        backgroundColor: Colors.white,
        surfaceTintColor: Colors.white,
        shadowColor: Colors.black26,
        elevation: 3,
      ),
      showBottomAppBar: true,
      body: ListView(
        children: [
          SizedBox(height: 30.ah),
          CarouselDemo(
            assetDetailsModel: widget.assetDetailsModel,
          ),
          SizedBox(height: 30.ah),
          Padding(
            padding: EdgeInsets.only(left: 20.aw, right: 20.aw),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                InkWell(
                  onTap: () {
                    bottomSheetWidget(context);
                  },
                  child: Row(
                    children: [
                      Text(
                        'Report this asset ',
                        style: TextStyle(
                            fontFamily: 'Roboto',
                            height: 1.ah,
                            color: const Color(0xFF4F4F4F).withOpacity(0.70),
                            fontWeight: FontWeight.w400,
                            fontSize: 11.fSize),
                      ),
                      Icon(
                        Icons.info,
                        color: const Color(0xFF4F4F4F).withOpacity(0.70),
                        size: 10,
                      )
                    ],
                  ),
                ),
                SizedBox(height: 5.ah),
                Text(
                  "${widget.assetDetailsModel.assetName}",
                  style: TextStyle(
                      fontFamily: 'Roboto',
                      height: 1.ah,
                      color: const Color(0xFF4F4F4F),
                      fontWeight: FontWeight.w500,
                      fontSize: 18.fSize),
                ),
                SizedBox(height: 5.ah),
                Text(
                  // '${widget.assetDetailsModel.createdAt}',
                  formatToDayMonthTime(widget.assetDetailsModel!.createdAt!),
                  style: TextStyle(
                      fontFamily: 'Roboto',
                      height: 1.ah,
                      color: Color(0xFF4F4F4F).withOpacity(0.50),
                      fontWeight: FontWeight.w400,
                      fontSize: 10.fSize),
                ),
                SizedBox(height: 15.ah),
                Row(
                  //mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    InkWell(
                      onTap: () {
                        Get.to(() => UserProfileScreen(
                              userID: '${widget.assetDetailsModel.userId}',
                            ));
                      },
                      child: Container(
                        width: 96.aw,
                        height: 27.ah,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(40),
                          color: Color(0xFF32CD30),
                        ),
                        child: Center(
                          child: Text(
                            "Contact Owner",
                            style: TextStyle(
                                fontFamily: 'Roboto',
                                color: Colors.white,
                                fontWeight: FontWeight.w600,
                                fontSize: 11.fSize),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      child: Text(
                        'UIC: ${widget.assetDetailsModel.uic}',
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                            fontFamily: 'Roboto',
                            color: const Color(0xFF32CD30),
                            fontWeight: FontWeight.w500,
                            fontSize: 21.fSize),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 12.ah),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    widget.assetDetailsModel.lock == 0
                        ? Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                                SvgPicture.asset(
                                  'assets/icon/icon _warning_.svg',
                                  height: 15.ah,
                                  width: 16.aw,
                                  fit: BoxFit.fill,
                                ),
                                SizedBox(width: 5.aw),
                                Text(
                                  'This asset is not available!',
                                  style: TextStyle(
                                      fontFamily: 'Roboto',
                                      color: const Color(0xFFBD3124),
                                      fontWeight: FontWeight.w400,
                                      fontSize: 11.fSize),
                                ),
                              ])
                        : Container(),
                    InkWell(
                      onTap: () {
                        double tryParseDouble(String input) {
                          try {
                            return double.parse(input);
                          } catch (e) {
                            print("Error: $e");
                            return 0.0;
                          }
                        }

                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => UserMapView(
                                    userAssetsItemObj: widget.assetDetailsModel,
                                    latLng: LatLng(
                                      tryParseDouble(
                                          "${widget.assetDetailsModel.latitude}"),
                                      tryParseDouble(
                                          "${widget.assetDetailsModel.longitude}"),
                                    ))));
                      },
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const Icon(Icons.location_on,
                              size: 35, color: Color(0xFF6C6C6C)),
                          Text(
                            'View on map',
                            style: TextStyle(
                                fontFamily: 'Roboto',
                                color: Color(0xFF6C6C6C),
                                fontWeight: FontWeight.w400,
                                fontSize: 11.fSize),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 12.ah),
                Text(
                  "Asset Information",
                  style: TextStyle(
                      fontFamily: 'Roboto',
                      letterSpacing: -0.41,
                      color: Color(0xFF000000),
                      fontWeight: FontWeight.w600,
                      fontSize: 15.fSize),
                ),
                SizedBox(height: 10.ah),
                Padding(
                  padding:  EdgeInsets.only(right: 53.0.aw),
                  child: ExpandableText(
                    '${widget.assetDetailsModel.assetDetails}',
                    expandText: 'See more',
                    collapseText: 'See less',
                    style: TextStyle(
                      fontFamily: 'Roboto',
                      fontSize: 13.fSize,
                      fontWeight: FontWeight.w400,
                      color: const Color(0xFF0000000).withOpacity(0.50),
                      letterSpacing: -0.41,
                    ),
                    maxLines: 3,
                    linkColor: Color(0xFF32CD30),
                  ),
                ),
                SizedBox(height: 20.ah),
                viewAllRow(
                  name: 'Related Items',
                  onTap: () {},
                ),


              ],
            ),
          ),
          Obx(
              ()=>controller.isLoading.value ? Center(child: CircularProgressIndicator(strokeWidth: 2,),) :  Padding(
              padding: EdgeInsets.only(left: 20.aw, right: 0.h),
              child: SizedBox(
                height: 250.ah,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: controller.allAssetsModel.assets?.length ?? 0,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding:  EdgeInsets.only(right: 28.0.aw,top: 20.ah),
                      child: SizedBox(
                          width: 158.aw,
                          child: CustomCardForUserAsset(index: index, AssetObj: controller.allAssetsModel.assets![index],isPadding: EdgeInsets.only(),)),
                    );
                  },),
              ),
            ),
          ),
          SizedBox(height: 100.ah),
        ],
      ),
    );
  }

  Widget viewAllRow({required String name, Function()? onTap}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '$name',
          style: TextStyle(
              fontFamily: 'Roboto',
              color: const Color(0xff000000).withOpacity(0.70),
              fontWeight: FontWeight.w500,
              fontSize: 14.fSize),
        ),
        InkWell(
          onTap: onTap,
          child: Container(
            alignment: Alignment.topRight,
            color: Colors.white,
            height: 30.ah,
            width: 50.aw,
            child: Text(
              'View all ',
              style: TextStyle(
                  fontFamily: 'Roboto',
                  color: Color(0xff000000).withOpacity(0.70),
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
}
