import 'package:expandable_text/expandable_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:securepoint/screen/add_assets/edit_assets.dart';
import 'package:securepoint/core/constants/size.dart';
import 'package:securepoint/screen/dashboard_page/scaffold_layout.dart';
import 'package:velocity_x/velocity_x.dart';
import '../../core/utils/date_time_utils.dart';
import '../../model/assets_model.dart';
import '../Widget/carousel_demo/carousel_slider.dart';
import '../const_iteam/custom_button.dart';
import '../map_screen/user_map_screen.dart';

class MyAssetDetailsScreen extends StatefulWidget {
  final   Asset assetDetailsModel ;
  const  MyAssetDetailsScreen({super.key,required this.assetDetailsModel});

  @override
  State<MyAssetDetailsScreen> createState() => _MyAssetDetailsScreenState();
}

class _MyAssetDetailsScreenState extends State<MyAssetDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return ScaffoldLayout(
      activeIndex: 11,
      showBottomAppBar: true,
      appBar: AppBar(
        leading: InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: const Icon(Icons.arrow_back_outlined,color: Color(0xFF6A6A6A))),
        title: Text('My Asset Details',
          style: TextStyle(fontFamily: 'Inter',
              color: Color(0xFF6A6A6A),fontWeight: FontWeight.w600,fontSize:19.fSize
          ),
        ),
        centerTitle: true,
        actions: [
          const  Icon(Icons.share,size:20,color: Color(0xFF6A6A6A)),
          SizedBox(width: 20.aw),
        ],
        backgroundColor: Colors.white,surfaceTintColor: Colors.white,shadowColor: Colors.black26,
        elevation: 3,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [

          SizedBox(height: 30.ah),
          CarouselDemo(assetDetailsModel: widget.assetDetailsModel,),
          Padding(
            padding:  EdgeInsets.only(left: 20.h,right: 20.h),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(height:25.ah),
                InkWell(
                  onTap: () {
                    Get.to(()=>EditAssetsScreen(assetDetailsModel: widget.assetDetailsModel));
                  },
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const Icon(Icons.edit,size: 17,color: Color(0xff5E605E),),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text('Edit this asset',
                            style: TextStyle(fontFamily: 'Roboto',height: 1.ah,
                                color: Color(0xFF4F4F4F).withOpacity(0.70),fontWeight: FontWeight.w400,fontSize:11.fSize
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(height:3.ah),
                Text("${widget.assetDetailsModel.assetName}",
                  style: TextStyle(fontFamily: 'Roboto',height: 1.ah,
                      color: Color(0xFF4F4F4F),fontWeight: FontWeight.w500,fontSize:18.fSize
                  ),
                ),
                SizedBox(height:3.ah),
                Text(
                  formatToDayMonthTime(widget.assetDetailsModel.createdAt!),
                  // '${widget.assetDetailsModel.createdAt}',
                  style: TextStyle(fontFamily: 'Roboto',height: 1.ah,
                      color: Color(0xFF4F4F4F).withOpacity(0.50),fontWeight: FontWeight.w400,fontSize:10.fSize
                  ),
                ),


                SizedBox(height: 15.ah),
                Row(
                  //mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      width: 96.aw,height: 27.ah,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(40),
                        color: Color(0xFF32CD30),
                      ),
                      child:  Center(
                        child: Text('Promote Asset',
                          style: TextStyle(fontFamily: 'Roboto',
                              color: Colors.white,fontWeight: FontWeight.w600,fontSize:11.fSize
                          ),
                        ),
                      ),
                    ),

                    Text('UIC: ${widget.assetDetailsModel.uic}',
                      style: TextStyle(fontFamily: 'Roboto',
                          color: Color(0xFF32CD30),fontWeight: FontWeight.w500,fontSize:21.fSize
                      ),
                    ),
                  ],
                ),

                SizedBox(height: 20.ah),
                Row(
                  // mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    widget.assetDetailsModel.lock == 0 ?
                    Row(
                      //mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SvgPicture.asset('assets/icon/icon _warning_.svg',height: 15.ah,width: 16.aw,fit: BoxFit.fill,),
                          SizedBox(width:5.aw),

                          Text('This asset is not available!',
                            style: TextStyle(fontFamily: 'Roboto',
                                color: Color(0xFFBD3124),fontWeight: FontWeight.w400,fontSize:11.fSize
                            ),
                          ),
                        ]
                    ) : Container(),

                    InkWell(
                      onTap: () {
                        Get.to(()=>UserMapView(
                          userAssetsItemObj: widget.assetDetailsModel,
                          latLng: LatLng(double.parse("${widget.assetDetailsModel.latitude}"),double.parse("${widget.assetDetailsModel.longitude}")),));
                      },
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const Icon(Icons.location_on,size: 35,color: Color(0xFF6C6C6C)),
                          Text('View on map',
                            style: TextStyle(fontFamily: 'Roboto',
                                color: Color(0xFF6C6C6C),fontWeight: FontWeight.w400,fontSize:11.fSize
                            ),
                          ),
                        ],
                      ),
                    ),

                  ],
                ),

                SizedBox(height: 12.ah),
                Text("Asset Information",
                  style: TextStyle(fontFamily: 'Roboto',
                      letterSpacing: -0.41,
                      color:const Color(0xFF000000),fontWeight: FontWeight.w600,fontSize:15.fSize
                  ),
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
                      letterSpacing: -0.41
                    ),
                    maxLines: 3,
                    linkColor: Color(0xFF32CD30),
                  ),
                ),
                SizedBox(height: 64.ah),
                Center(
                  child: Text('Promote Asset',style:
                  TextStyle( fontFamily: 'Roboto',
                    fontSize: 13.fSize,fontWeight: FontWeight.w600,color: const Color(0xFF32CD30),
                  ),
                  ),
                ),
                SizedBox(height:5.ah),
                Center(
                  child: Text('Lorem ipsum dolor sit amet, consectetur \n           adipiscing elit,sed do eiu',style:
                  TextStyle(
                    letterSpacing: -0.41,
                    fontSize: 13.fSize,fontWeight: FontWeight.w400,color:Colors.black.withOpacity(0.50),
                  ),
                  ),
                ),

                SizedBox(height: 6.ah),
                Center(
                  child: CustomPrimaryBtn3(
                    title: 'Boost',
                    isLoading: false,
                    onTap: () {

                    },
                  ),
                ),

                SizedBox(height: 50.ah),
              ],
            ),
          ),

        ],
      ),
    );
  }
}
