import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:securepoint/core/constants/size.dart';
import 'package:securepoint/core/utils/pref_utils.dart';
import 'package:securepoint/screen/Widget/cummon_card_to_item_view/floatingActionButton_add_assset.dart';
import 'package:securepoint/screen/Widget/custom_image_view.dart';
import 'package:securepoint/screen/dashboard_page/scaffold_layout.dart';
import '../../core/utils/date_time_utils.dart';
import '../../core/utils/obscureString.dart';
import '../../model/assets_model.dart';
import '../auth_and_onboard/user_profile/user_profile_screen.dart';
import 'dart:math' as math;
import '../home_page/homescreen.dart';
import '../my_assets_screen/my_assets_screen.dart';

class UserMapView extends StatefulWidget {
  final Asset userAssetsItemObj;
  LatLng latLng;
  UserMapView(
      {super.key, required this.latLng, required this.userAssetsItemObj});

  @override
  State<UserMapView> createState() => _UserMapViewState();
}

class _UserMapViewState extends State<UserMapView> {
  String address = 'Lucknow';
  bool isShowDialogBox = true;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setMarker(widget.latLng);
    openBottomSheet(context);
  }

  setMarker(LatLng value) async {
    List<Placemark> result =
        await placemarkFromCoordinates(value.latitude, value.longitude);
    if (result.isNotEmpty) {
      address =
          '${result[0].name}, ${result[0].locality} ${result[0].administrativeArea}';
    }
    setState(() {});
  }

  Future<void> openBottomSheet(BuildContext context) async {
  await  Future.delayed(const Duration(microseconds:500));
    _bottomSheetWidget(context);
  }




  @override
  Widget build(BuildContext context) {
    return ScaffoldLayout(
      activeIndex: 6,
      showFloatingActionButton: true,
      showBottomAppBar: true,
      // persistentFooterAlignment: AlignmentDirectional.bottomCenter,
      body: Stack(
        children: [
          GoogleMap(
            initialCameraPosition:
                CameraPosition(target: widget.latLng, zoom: 12),
            markers: {
              Marker(
                  infoWindow: InfoWindow(title: address),
                  position: widget.latLng,
                  draggable: false,
                  markerId: const MarkerId('1'),
                  onDragEnd: (value) {
                    print(value);
                    // setMarker(value);
                  }),
            },
            onTap: (value) {
              //  setMarker(value);
            },
          ),
          Positioned(
              right: 30 + 45,
              top: 295,
              child: Transform.rotate(
                angle: 45 * math.pi / 180, // Convert degrees to radians
                child: Padding(
                  padding: EdgeInsets.only(
                      left: 10.aw, right: 10.aw, bottom: 10.ah, top: 10.ah),
                  child: Container(
                    height: 80,
                    width: 80,
                    decoration: BoxDecoration(
                      border:
                          Border.all(width: 4, color: const Color(0xff32CD30)),
                      color: Color(0xff8B8B8B).withOpacity(.70),
                      boxShadow: [
                        BoxShadow(
                          color: Color.fromRGBO(139, 139, 139,
                              0.76), // Drop shadow color: #8B8B8B with 76% opacity
                          offset:
                              Offset(0, 20), // Drop shadow offset: X 0, Y 16
                          blurRadius: 28, // Drop shadow blur: 28
                          spreadRadius: 0, // Drop shadow spread: 0
                        ),
                      ],
                    ),
                    // child: CustomImageView(
                    //   imagePath: widget.userAssetsItemObj.images?[0].images,
                    //   fit: BoxFit.cover,
                    //   border: Border.all(width: 0,color: Colors.transparent),
                    //   radius: BorderRadius.circular(17),
                    // ),
                  ),
                ),
              )),
          Positioned(
              right: 20 + 45,
              top: 280,
              child: InkWell(
                onTap: () {
                  _bottomSheetWidget(context);
                },
                child: Container(
                  height: 100,
                  width: 120,
                  decoration: BoxDecoration(
                    border: Border.all(width: 4, color: const Color(0xff32CD30)),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: CustomImageView(
                    imagePath: widget.userAssetsItemObj.assetImages?[0].imageUrl,
                    fit: BoxFit.cover,
                    border: Border.all(width: 0, color: Colors.transparent),
                    radius: BorderRadius.circular(17),
                  ),
                ),
              )),
          Positioned(
              right: 10 + 40,
              top: 268,
              child: Container(
                height: 40,
                width: 40,
                decoration: BoxDecoration(
                    border: Border.all(
                      color: const Color(0xFFCBCECA), // Border color: #CBCECA
                      width: 0.7, // Border width: 0.7px
                    ),
                    boxShadow: const [
                      BoxShadow(
                        color: Color.fromRGBO(0, 0, 0,
                            0.25), // Drop shadow color: #000000 with 25% opacity
                        offset: Offset(0, 6), // Drop shadow offset: X 0, Y 6
                        blurRadius: 9, // Drop shadow blur: 9
                        spreadRadius: 0, // Drop shadow spread: 0
                      ),
                    ],
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(100)),
                child: Center(
                  child: CustomImageView(
                    height: 25,
                    imagePath: widget.userAssetsItemObj.lock! == 0
                        ? 'assets/image/tala.png'
                        : "assets/image/tala_open.png",
                    border: Border.all(width: 0, color: Colors.transparent),
                  ),
                ),
              )),
          // if(isShowDialogBox)
          //     Positioned(
          //     bottom: 35.ah,
          //     child: InkWell(
          //       onTap: () {
          //         _bottomSheetWidget(context);
          //       },
          //
          //       child: Container(color: Colors.white,height: 338.ah,width: MediaQuery.of(context).size.width,
          //         child: Padding(
          //           padding:  EdgeInsets.only(left: 32.0.aw,right:32.aw),
          //           child: Column(
          //             crossAxisAlignment: CrossAxisAlignment.start,
          //             children: [
          //               SizedBox(height: 9.ah,),
          //               Center(child: Container(height: 4.ah,width: 45.aw,
          //                 decoration: BoxDecoration(
          //                   borderRadius: BorderRadius.circular(50),
          //                   color: Color(0xff4A4A4F),
          //                 ),
          //              )
          //               ),
          //               SizedBox(height: 21.ah,),
          //               Center(
          //                 child: Text(
          //                   "${widget.userAssetsItemObj.assetName}" ,
          //                   textAlign: TextAlign.center,
          //                   style: const TextStyle(
          //                     color: Colors.black,
          //                     fontSize: 15,
          //                     fontFamily: 'Roboto',
          //                     fontWeight: FontWeight.w500,
          //                   ),
          //                 ),
          //               ),
          //                SizedBox(height: 6.ah),
          //               Center(
          //                 child: Text(
          //                   'UIC: ${widget.userAssetsItemObj.uic}',
          //                   style: const TextStyle(
          //                     color: Color(0xFF32CD30),
          //                     fontSize: 15,
          //                     fontFamily: 'Roboto',
          //                     fontWeight: FontWeight.w500,
          //                   ),
          //                 ),
          //               ),
          //                SizedBox(height: 21.ah),
          //
          //               Row(
          //                 children: [
          //                   Column(
          //                     crossAxisAlignment: CrossAxisAlignment.start,
          //                     children: [
          //                       Text(
          //                         obscureString(widget.userAssetsItemObj.user?.fullName ?? "Je*****d"),
          //                         textAlign: TextAlign.center,
          //                         style: TextStyle(
          //                           color: const Color(0xFF6A6A6A),
          //                           fontSize: 15.adaptSize,
          //                           fontFamily: 'Roboto',
          //                           fontWeight: FontWeight.w600,
          //                           letterSpacing: -0.41,
          //                         ),
          //                       ),
          //                       Text(
          //                         'SecurPoint user since ${formatToMonthYear(widget.userAssetsItemObj.user!.createdAt!)}',
          //                         style:  TextStyle(
          //                           color: Color(0xFF414853),
          //                           fontSize: 12.adaptSize,
          //                           fontFamily: 'Roboto',
          //                           fontWeight: FontWeight.w400,
          //                           letterSpacing: -0.41,
          //                         ),
          //                       ),
          //                       const SizedBox(height:14),
          //                       Row(
          //                         mainAxisAlignment: MainAxisAlignment.start,
          //                         children: [
          //                         Container(
          //                           width: 100.aw,
          //                           height: 25.ah,
          //                           decoration: ShapeDecoration(
          //                             color: Colors.white,
          //                             shape: RoundedRectangleBorder(
          //                               side: const BorderSide(width: 1, color: Color(0xFF32CD30)),
          //                               borderRadius: BorderRadius.circular(8),
          //                             ),
          //                           ),
          //                           child:  Center(child: Text(
          //                             'Search More',
          //                             textAlign: TextAlign.center,
          //                             style: TextStyle(
          //                               color: Color(0xFF32CD30),
          //                               fontSize: 13.adaptSize,
          //                               fontFamily: 'Roboto',
          //                               fontWeight: FontWeight.w500,
          //                               height: 0,
          //                             ),
          //                           ),),
          //                         ),
          //                         SizedBox(width:7.aw),
          //                         PrefUtils().getUserId() == "${widget.userAssetsItemObj.userId}" ?const SizedBox() :
          //                         InkWell(
          //                           onTap: () {
          //                             Get.to(() => UserProfileScreen(
          //                               userID: '${widget.userAssetsItemObj.userId}',
          //                             ));
          //                           },
          //                           child: Container(
          //                             width: 100.aw,
          //                             height: 25.ah,
          //                             decoration: ShapeDecoration(
          //                               color: const Color(0xFF32CD30),
          //                               shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          //                             ),
          //                             child:  Center(child:Text(
          //                               'Contact Owner',
          //                               textAlign: TextAlign.center,
          //                               style: TextStyle(
          //                                 color: Colors.white,
          //                                 fontSize: 13.adaptSize,
          //                                 fontFamily: 'Roboto',
          //                                 fontWeight: FontWeight.w500,
          //                                 height: 0,
          //                               ),
          //                             ),),
          //                           ),
          //                         ),
          //
          //                       ],)
          //
          //                     ],),
          //                   const Spacer(),
          //                   CustomImageView(
          //                     height: 65,
          //                     width: 65,
          //                     imagePath: widget.userAssetsItemObj.user?.avatarUrl,
          //                     fit: BoxFit.cover,
          //                     radius: BorderRadius.circular(100),
          //                   )
          //                 ],
          //               ),
          //             ],
          //           ),
          //         ),
          //
          //       ),
          //     ),
          //               ),

          //x and share icon row

          SafeArea(
            child: Container(
              height: 40,
              width: MediaQuery.of(context).size.width,
              child: Padding(
                padding: EdgeInsets.only(left: 30.0.aw, right: 30.aw),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      height: 37.adaptSize,
                      width: 37.adaptSize,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(100),
                        boxShadow: [
                          BoxShadow(
                            color: Color.fromRGBO(0, 0, 0, 0.84), // 84% opacity
                            offset: Offset(0, 0),
                            blurRadius: 4,
                            spreadRadius: 0,
                          ),
                        ],
                      ),
                      child: CustomImageView(
                        imagePath: "assets/image/x.svg",
                        onTap: () {
                          Get.back();
                        },
                      ),
                    ),
                    Container(
                      height: 37.adaptSize,
                      width: 37.adaptSize,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(100),
                        boxShadow:const [
                          BoxShadow(
                            color: Color.fromRGBO(0, 0, 0, 0.84), // 84% opacity
                            offset: Offset(0, 0),
                            blurRadius: 4,
                            spreadRadius: 0,
                          ),
                        ],
                      ),
                      child: CustomImageView(
                        imagePath: "assets/image/share.svg",
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  _bottomSheetWidget(BuildContext context) {
    showModalBottomSheet(
        context: context,

        // isScrollControlled: true,
        builder: (context) {
          return FractionallySizedBox(
              heightFactor: .70,
              child: GestureDetector(
                onTap: () {
                  Get.back();
                },
                child: Container(
                  color: Colors.white,
                  height: 338.ah,
                  width: MediaQuery.of(context).size.width,
                  child: Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(left: 32.0.aw, right: 32.aw),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: 9.ah,
                            ),
                            Center(
                                child: Container(
                              height: 4.ah,
                              width: 45.aw,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(50),
                                color: Color(0xff4A4A4F),
                              ),
                            )),
                            SizedBox(
                              height: 21.ah,
                            ),
                            Center(
                              child: Text(
                                "${widget.userAssetsItemObj.assetName}",
                                textAlign: TextAlign.center,
                                style: const TextStyle(
                                  color: Colors.black,
                                  fontSize: 15,
                                  fontFamily: 'Roboto',
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                            SizedBox(height: 6.ah),
                            Center(
                              child: Text(
                                'UIC: ${widget.userAssetsItemObj.uic}',
                                style: const TextStyle(
                                  color: Color(0xFF32CD30),
                                  fontSize: 15,
                                  fontFamily: 'Roboto',
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                            SizedBox(height: 21.ah),
                            Row(
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      obscureString(widget.userAssetsItemObj
                                              .user?.fullName ??
                                          "Je*****d"),
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        color: const Color(0xFF6A6A6A),
                                        fontSize: 15.adaptSize,
                                        fontFamily: 'Roboto',
                                        fontWeight: FontWeight.w600,
                                        letterSpacing: -0.41,
                                      ),
                                    ),
                                    Text(
                                      'SecurPoint user since ${formatToMonthYear(widget.userAssetsItemObj.user!.createdAt!)}',
                                      style: TextStyle(
                                        color: Color(0xFF414853),
                                        fontSize: 12.adaptSize,
                                        fontFamily: 'Roboto',
                                        fontWeight: FontWeight.w400,
                                        letterSpacing: -0.41,
                                      ),
                                    ),
                                    const SizedBox(height: 14),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Container(
                                          width: 100.aw,
                                          height: 25.ah,
                                          decoration: ShapeDecoration(
                                            color: Colors.white,
                                            shape: RoundedRectangleBorder(
                                              side: const BorderSide(
                                                  width: 1,
                                                  color: Color(0xFF32CD30)),
                                              borderRadius:
                                                  BorderRadius.circular(8),
                                            ),
                                          ),
                                          child: Center(
                                            child: Text(
                                              'Search More',
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                color: Color(0xFF32CD30),
                                                fontSize: 13.adaptSize,
                                                fontFamily: 'Roboto',
                                                fontWeight: FontWeight.w500,
                                                height: 0,
                                              ),
                                            ),
                                          ),
                                        ),
                                        SizedBox(width: 7.aw),
                                        PrefUtils().getUserId() ==
                                                "${widget.userAssetsItemObj.userId}"
                                            ? const SizedBox()
                                            : InkWell(
                                                onTap: () {
                                                  Get.to(
                                                      () => UserProfileScreen(
                                                            userID:
                                                                '${widget.userAssetsItemObj.userId}',
                                                          ));
                                                },
                                                child: Container(
                                                  width: 100.aw,
                                                  height: 25.ah,
                                                  decoration: ShapeDecoration(
                                                    color:
                                                        const Color(0xFF32CD30),
                                                    shape:
                                                        RoundedRectangleBorder(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        8)),
                                                  ),
                                                  child: Center(
                                                    child: Text(
                                                      'Contact Owner',
                                                      textAlign:
                                                          TextAlign.center,
                                                      style: TextStyle(
                                                        color: Colors.white,
                                                        fontSize: 13.adaptSize,
                                                        fontFamily: 'Roboto',
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        height: 0,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                      ],
                                    )
                                  ],
                                ),
                                const Spacer(),
                                CustomImageView(
                                  height: 65,
                                  width: 65,
                                  imagePath:
                                      widget.userAssetsItemObj.user?.avatarUrl,
                                  fit: BoxFit.cover,
                                  radius: BorderRadius.circular(100),
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                      Spacer(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(right: 16.aw),
                            child: floatingActionButtonAddAssets(padding: 10.0),
                          ),
                        ],
                      ),
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black
                                  .withOpacity(0.06), // #000000 with 6% opacity
                              offset: const Offset(0, -4), // X: 0, Y: -4
                              blurRadius: 4, // Blur radius: 4
                              spreadRadius: 0, // Spread radius: 0
                            ),
                          ],
                        ),
                        height: 80.ah,
                        child: Padding(
                          padding: EdgeInsets.only(bottom: 15.0.ah),
                          child: Container(
                            child: Row(
                              children: [
                                SizedBox(
                                  width: 92.aw,
                                  height: 61.ah,
                                ),
                                InkWell(
                                  onTap: () {
                                    Get.offAll(() => HomeScreenNew());
                                  },
                                  child: SizedBox(
                                    width: 65.aw,
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        CustomImageView(
                                          imagePath:
                                              "assets/image/home_icon.svg",
                                          height: 19.adaptSize,
                                          width: 17.adaptSize,
                                        ),
                                        const Text(
                                          "Home",
                                          style: TextStyle(
                                              fontSize: 11,
                                              fontWeight: FontWeight.w400,
                                              color: Color(0xff333333)),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                                const Spacer(),
                                InkWell(
                                  onTap: () {
                                    Get.offAll(() => const MyAssetsScreen());
                                  },
                                  child: SizedBox(
                                    width: 65.aw,
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        CustomImageView(
                                          imagePath:
                                              "assets/image/asset_icon.svg",
                                          height: 17.adaptSize,
                                          width: 16.adaptSize,
                                        ),
                                        const Text(
                                          "Asset",
                                          style: TextStyle(
                                              fontSize: 11,
                                              fontWeight: FontWeight.w400,
                                              color: Color(0xff333333)),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                                const Spacer(),
                                InkWell(
                                  onTap: () {
                                   // Get.offAll(() => const MessagesScreenNew1());
                                  },
                                  child: SizedBox(
                                    width: 65.aw,
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        CustomImageView(
                                          imagePath:
                                              "assets/image/msg_black_icon.svg",
                                          height: 15.adaptSize,
                                          width: 15.adaptSize,
                                        ),
                                        const Text(
                                          "Messages",
                                          style: TextStyle(
                                              fontSize: 11,
                                              fontWeight: FontWeight.w400,
                                              color: Color(0xff333333)),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: 92.aw,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ));
        });
  }
}
