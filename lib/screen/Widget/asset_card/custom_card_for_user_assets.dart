import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:securepoint/core/utils/size_utils.dart';
import '../../../model/assets_model.dart';
import '../custom_image_view.dart';
import '../../asset_details/assets_details_screen.dart';
import '../../map_screen/user_map_screen.dart';

class CustomCardForUserAsset extends StatelessWidget {
  final int index;
  final Asset AssetObj;
  final EdgeInsetsGeometry ? isPadding ;
  const  CustomCardForUserAsset({super.key,required this.index,required this.AssetObj,this.isPadding});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: isPadding ??  EdgeInsets.only(left: index % 2 ==0 ?  30.0.aw : 0,right:  index % 2 == 1 ?  30.0.aw : 0),
      child: Column(
        children: [
          SizedBox(
            width: MediaQuery.of(context).size.width*.45,height: 113.ah,
            child: Stack(
                alignment: Alignment.center,
                clipBehavior: Clip.none,
                children: [

                  CustomImageView(
                     height:113.ah,
                    width:156.aw,
                    imagePath: AssetObj.assetImages!.isEmpty ?  null :     AssetObj.assetImages?[0].imageUrl,
                    radius: BorderRadius.circular(10),
                    fit: BoxFit.cover,
                  ),
                  SizedBox(
                    height:113.ah,
                    width:156.aw,
                    // color: Colors.yellow,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(height: 40.ah,),
                        if(AssetObj.status == "Stolen") Container(
                          height: 23.ah, width:156.aw,
                          decoration: BoxDecoration(
                            color: Color(0xffBD3124).withOpacity(0.50),
                            //borderRadius: BorderRadius.all(Radius.circular(5))
                          ),
                          child: Center(
                            child:  Text('Stolen',
                              style: TextStyle(fontFamily: 'Roboto',
                                  color: Colors.white,fontWeight: FontWeight.w500,fontSize:12.fSize
                              ),
                            ),
                          ),
                        ),

                      ],
                    ),
                  ),

                  Positioned(
                      right: -14.0.h,
                      top: -16.0.v,
                      child: Container(
                        height: 50.0.adaptSize,
                        width: 50.0.adaptSize,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(
                              width: 0.7.aw,
                              color: Color(0xffCBCECA)
                          ),
                          shape: BoxShape.circle,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.25),
                              spreadRadius: 0,
                              blurRadius: 9,
                              offset: Offset(0, 6),
                            ),
                          ],
                        ),

                        child: Center(
                          child: Image.asset( AssetObj.lock == 0 ? 'assets/image/tala.png' : "assets/image/tala_open.png",
                            width: 20.0.aw,
                            height: 27.0.ah,
                            fit: BoxFit.contain,
                          ),
                        ),


                      )
                  )

                ]
            ),
          ),
          SizedBox(height: 5.ah,),
          SizedBox(
            width: MediaQuery.of(context).size.width,
            child:  Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    if( AssetObj.lock == 0)SvgPicture.asset('assets/icon/icon _warning_.svg',height: 15.ah,width: 16.aw,fit: BoxFit.fill,),
                    if( AssetObj.lock == 0)SizedBox(width:10.aw),
                    Container(
                      width: 127.aw,
                      child: Text('${AssetObj.assetName}' ,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(fontFamily: 'Roboto',
                            color: HexColor('#5E605E'),fontWeight: FontWeight.w600,fontSize:15.fSize
                        ),
                      ),
                    ),
                  ],
                ),
                // Text('${AssetObj.assetName}',
                //   style: TextStyle(fontFamily: 'Roboto',
                //       color: HexColor('#5E605E'),fontWeight: FontWeight.w600,fontSize:15.fSize
                //   ),
                // ),
                Text('UIC: ${AssetObj.uic}',
                  overflow:TextOverflow.ellipsis,
                  style: TextStyle(fontFamily: 'Roboto',
                      color: HexColor('#32CD30'),fontWeight: FontWeight.w500,fontSize:15.fSize
                  ),
                ),
                Container(
                  height: 34.ah,
                  child: Text('${AssetObj.assetDetails}',
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(fontFamily: 'Roboto',
                        color: HexColor('#000000'),fontWeight: FontWeight.w400,fontSize:12.fSize
                    ),
                  ),
                ),
                SizedBox(height:4.ah),
                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InkWell(
                        onTap: () {
                          Get.back();
                          Get.to(()=> AssetDetailsScreen(assetDetailsModel: AssetObj));
                        },
                        child: Container(
                          width: 96.aw,height: 27.ah,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(40),
                            color: Color(0xFF32CD30),
                          ),
                          child:  Center(
                            child: Text('View Asset',
                              style: TextStyle(fontFamily: 'Roboto',
                                  color: Colors.white,fontWeight: FontWeight.w600,fontSize:14.fSize
                              ),
                            ),
                          ),
                        ),
                      ),
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
                          Get.to(()=>UserMapView(
                            latLng: LatLng(
                              tryParseDouble(
                                  "${AssetObj.latitude}"),
                              tryParseDouble(
                                  "${AssetObj.longitude}"),
                            ), userAssetsItemObj: AssetObj,));
                        },
                        child: const Icon(Icons.location_on,
                            size: 25, color: Color(0xFF6C6C6C)),
                      ),
                    ],
                  ),
                ),

              ],
            ),
          ),
        ],
      ),
    );
  }
}
