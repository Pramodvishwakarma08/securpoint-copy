import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:securepoint/api_client/api_repository.dart';
import 'package:securepoint/core/utils/size_utils.dart';
import 'package:securepoint/screen/add_assets/edit_assets.dart';
import '../../../model/assets_model.dart';
import '../../my_asset_details/my_assets_details.dart';
import '../../my_assets_screen/my_assets_controller.dart';
import '../../Widget/custom_image_view.dart';

class CustomCardForMyAsset extends StatefulWidget {
  final int index ;
  final Asset assetDetailsModel ;
  const CustomCardForMyAsset({super.key,required this.assetDetailsModel,required this.index});

  @override
  State<CustomCardForMyAsset> createState() => _CustomCardForMyAssetState();
}

class _CustomCardForMyAssetState extends State<CustomCardForMyAsset> {

  MyAssetsController controller =Get.put(MyAssetsController());

  bool  isLock2 =false;
  bool  isEye2 =false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.only(left: widget.index % 2 ==0 ?  30.0.aw : 0,right:  widget.index % 2 == 1 ?  30.0.aw : 0),
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
                    width:double.infinity,
                    imagePath: widget.assetDetailsModel.assetImages!.isEmpty   ? null : widget.assetDetailsModel.assetImages![0].imageUrl,
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
                        if(widget.assetDetailsModel.status == "Stolen") Container(
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
                      right: -10.0.h,
                      top: -10.0.v,
                      child: Container(
                        width: 40.0.aw,
                        height: 40.0.ah,
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
                          child: Image.asset( widget.assetDetailsModel.lock == 0 ? 'assets/image/tala.png' : "assets/image/tala_open.png",
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
          SizedBox(height: 10.ah,),
          SizedBox(
            width: MediaQuery.of(context).size.width,height: 112.ah,
            child:  Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    if( widget.assetDetailsModel.lock == 0)SvgPicture.asset('assets/icon/icon _warning_.svg',height: 15.ah,width: 16.aw,fit: BoxFit.fill,),
                    if( widget.assetDetailsModel.lock == 0)SizedBox(width:10.aw),
                    Container(
                      width: 128.aw,
                      child: Text('${widget.assetDetailsModel.assetName}' ,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(fontFamily: 'Roboto',
                            color: HexColor('#5E605E'),fontWeight: FontWeight.w600,fontSize:15.fSize
                        ),
                      ),
                    ),
                  ],
                ),

                Text('UIC: ${widget.assetDetailsModel.uic}',
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(fontFamily: 'Roboto',
                      color: HexColor('#32CD30'),fontWeight: FontWeight.w500,fontSize:15.fSize
                  ),
                ),
                Container(
                  height: 30.ah,
                  child: Text("${widget.assetDetailsModel.assetDetails}" ,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(fontFamily: 'Roboto',
                        color: HexColor('#000000'),fontWeight: FontWeight.w400,fontSize:12.fSize
                    ),
                  ),
                ),
                SizedBox(height:8.ah),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [

                    InkWell(onTap: () {
                      if(widget.assetDetailsModel.lock == 1){
                        widget.assetDetailsModel.lock = 0;
                        ApiRepository.lockAndUnlock(id: widget.assetDetailsModel.id.toString(), lockAndUnlock: "0" ,);
                        setState(() {});
                      }else{
                        ApiRepository.lockAndUnlock(id: widget.assetDetailsModel.id.toString(), lockAndUnlock: "1" ,);
                        widget.assetDetailsModel.lock = 1;
                        setState(() {});
                      }
                    },
                        child: widget.assetDetailsModel.lock == 1 ? Icon(Icons.lock_open,color: HexColor('#5E605E')) : Icon(Icons.lock,color: HexColor('#5E605E'),)) ,

                    InkWell(onTap: () {
                      Get.to(()=>MyAssetDetailsScreen(assetDetailsModel: widget.assetDetailsModel,));}, child: isEye2? Icon(Icons.visibility_off,color: HexColor('#5E605E'),): Icon(Icons.remove_red_eye,color: HexColor('#5E605E'))),
                    InkWell(onTap: () {Get.to(()=>EditAssetsScreen(assetDetailsModel: widget.assetDetailsModel));}, child: Icon(Icons.edit,color: HexColor('#5E605E'),)),
                    InkWell(onTap: () {showAlertDialog(context);}, child: Icon(Icons.delete,color: HexColor('#5E605E'),))
                  ],
                ),

              ],
            ),

          ),
        ],
      ),
    );

  }

  showAlertDialog(BuildContext context) {
    AlertDialog alert = AlertDialog(
      backgroundColor: Colors.white,
      surfaceTintColor: Colors.white,
      title: Column(
        children: [
          Center(child: Text(' Delete this Asset',
            style: TextStyle(color: Color(0XFF5E605E),fontWeight: FontWeight.w600,
              fontSize:20.adaptSize,fontFamily: 'Roboto',
            ),),
          ),
        ],
      ),
      content: Row(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          InkWell(
            onTap: () async {
              await ApiRepository.detelAssets(widget.assetDetailsModel.id.toString()).then((value) async {
                controller.getMyasset();
              });
              //  controller.getAssets();
              Get.back();

              //  Navigator.pop(context);
            },
            child: Container(
              height: 44.adaptSize,width:130.adaptSize,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: Color(0xff32CD30),

              ),
              child:  Center(
                child: Text('Yes',
                  style: TextStyle(color: Color(0XFFFFFFFF),fontWeight: FontWeight.w700,
                    fontSize:15.adaptSize,fontFamily: 'Roboto',
                  ),),
              ),
            ),
          ),
        const  SizedBox(width: 5),
          InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: Container(
              height: 44.adaptSize,width:130.adaptSize,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: Color(0xff32CD30),

              ),
              child:  Center(
                child: Text('No',
                  style: TextStyle(color: Color(0XFFFFFFFF),fontWeight: FontWeight.w700,
                    fontSize:15.adaptSize,fontFamily: 'Roboto',
                  ),),
              ),
            ),
          ),
        ],
      ),

    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }
}
