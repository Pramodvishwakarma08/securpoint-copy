import 'dart:convert';
import 'dart:ui';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:geocoding/geocoding.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:securepoint/core/constants/size.dart';
import 'CityToLatLongGoogleApiModel.dart';
import 'SerchCityGoogleApiModel.dart';



class MapScreen extends StatefulWidget {
  LatLng   mylatlong ;
   MapScreen({super.key, required this.mylatlong});

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {

  FocusNode _focusNode = FocusNode();





  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setMarkersdfg();

  }


  LatLng mylatlongOld = const LatLng(20.5937, 78.9629);
  String address = '';
  bool isShowMap =true;
  bool isShowfloatingActionButton =true;

  setMarkersdfg() async {
     mylatlongOld = widget.mylatlong;
     List<Placemark> result = await placemarkFromCoordinates(mylatlongOld.latitude, mylatlongOld.longitude);
     if (result.isNotEmpty) {
       address =
       '${result[0].name}, ${result[0].locality} ${result[0].administrativeArea}';
     }

     setState(() {});
     Fluttertoast.showToast(msg: '📍' + address);
     setState(() {
     });
  }

  setMarker(LatLng value) async {
    print("object_____$value}");
    mylatlongOld = value;
    List<Placemark> result = await placemarkFromCoordinates(value.latitude, value.longitude);

    if (result.isNotEmpty) {
      address =
          '${result[0].name}, ${result[0].locality} ${result[0].administrativeArea}';
    }

    setState(() {});
    Fluttertoast.showToast(msg: '📍' + address);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      persistentFooterAlignment: AlignmentDirectional.bottomCenter,
      body: Stack(
        children: [
           if(isShowMap)GoogleMap(
            initialCameraPosition: CameraPosition(target: mylatlongOld, zoom: 12),
            markers: {
              Marker(
                  infoWindow: InfoWindow(title: address),
                  position: mylatlongOld,
                  draggable: true,
                  markerId: MarkerId('1'),
                  onDragEnd: (value) {
                    print(value);
                    setMarker(value);
                  }),
            },
            onTap: (value) {
              setMarker(value);
            },
          ),
          SafeArea(
              child: Column(
                children: [
                  Center(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 15.0, right: 15,top: 15),
                      child: TextField(
                        onTap: () {
                          isShowfloatingActionButton =false;
                          setState(() {});
                        },
                          focusNode: _focusNode,
                          controller: serchText,
                          onChanged: (value) {
                            serchCity(serchText:serchText.text ,context: context);
                          },
                          decoration: inputDecoration()),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 15.0, right: 15,top: 0),
                    child: Container(color: Colors.white,
                      width: double.infinity,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 10.0,right: 10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            for(int i=0 ;i< lenth ; i++)
                              InkWell(
                                onTap: () async {
                                   isShowMap=false;
                                   setState(() {});
                                  await cityNameSelatLong(context: context, name: '${serchCityGoogleApiModel.predictions?[i].description}');
                                  setMarker(LatLng(cityToLatLongGoogleApiModel.results?[0].geometry?.location?.lat?? 0.0, cityToLatLongGoogleApiModel.results?[0].geometry?.location?.lng?? 0.0));
                                  lenth=0;
                                   isShowfloatingActionButton=true;
                                   isShowMap=true;
                                   setState(() {});
                                  serchText.clear();
                                  _focusNode.unfocus();
                                  setState(() {
                                  });

                                },
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child:  Text("${serchCityGoogleApiModel.predictions?[i].description}"),
                                ),
                              ),
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              )),
          isShowfloatingActionButton ?  Positioned(
            bottom: 20,
            child: InkWell(
              onTap: () {
                var latitude = mylatlongOld.latitude;
                var longitude = mylatlongOld.longitude;
                Get.back(result: mylatlongOld );
              },
              child: Container(
                color: Colors.transparent,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 20.0),
                      child: Container(
                        width: 260.aw,
                        height: 120.ah,
                        padding: const EdgeInsets.only(top: 12),
                        decoration: ShapeDecoration(
                          color: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(22),
                          ),
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              textAlign: TextAlign.center,
                              maxLines: 2,overflow: TextOverflow.ellipsis,
                              "${address}",
                              style: TextStyle(
                                  color: Color(0xFF32CD30), fontWeight: FontWeight.bold),
                            ),

                            Container(
                              width: 355.aw,
                              height: 40,
                              padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 4),
                              clipBehavior: Clip.antiAlias,
                              decoration: BoxDecoration(
                                color: Color(0xFF32CD30),
                                borderRadius: BorderRadius.only(
                                  bottomLeft:Radius.circular(22),
                                  bottomRight:Radius.circular(22),
                                ),

                              ),
                              child: Center(
                                child: Text(
                                  'Add this location',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 16,
                                    fontFamily: 'Roboto',
                                    fontWeight: FontWeight.w700,
                                    height: 0,
                                  ),
                                ),
                              ),),
                          ],
                        ),
                      ),
                    )

                  ],
                ),
              ),
            ),
          ) : SizedBox(),
        ],
      ),
    );
  }
  TextEditingController serchText = TextEditingController();
  SerchCityGoogleApiModel serchCityGoogleApiModel = SerchCityGoogleApiModel();
  CityToLatLongGoogleApiModel cityToLatLongGoogleApiModel =CityToLatLongGoogleApiModel();
  int lenth = 0;

  serchCity({String? serchText,required BuildContext context}) async {
    var dio = Dio();
    var response = await dio.request(
      'https://maps.googleapis.com/maps/api/place/autocomplete/json?key=AIzaSyDZe_WAS5-_o4EDqwuZtJms9ywovof4BkM&input=$serchText',
      options: Options(
        method: 'GET',
      ),
    );

    if (response.statusCode == 200) {
      print(json.encode(response.data));
      serchCityGoogleApiModel = SerchCityGoogleApiModel.fromJson(response.data);
      lenth =serchCityGoogleApiModel.predictions?.length ?? 0;
      setState(() {});

    } else {
      print(response.statusMessage);
    }
  }
  cityNameSelatLong({required String name,required BuildContext context}) async {
    var dio = Dio();
    var response = await dio.request(
      'https://maps.googleapis.com/maps/api/geocode/json?address=$name, India&key=AIzaSyDZe_WAS5-_o4EDqwuZtJms9ywovof4BkM',
      options: Options(
        method: 'GET',
      ),
    );

    if (response.statusCode == 200) {
      print(json.encode(response.data));
      cityToLatLongGoogleApiModel = CityToLatLongGoogleApiModel.fromJson(response.data);
      setState(() {});
    }
    else {
      print(response.statusMessage);
    }
  }


  InputDecoration inputDecoration(){
    return InputDecoration(
      fillColor: Color(0xffFAFAFA),
      filled: true,
      counterText: "",
      contentPadding: EdgeInsets.only(left: 15.h),
      // filled: true,
      // fillColor: Colors.grey.withOpacity(.25),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(50.h),
        borderSide: BorderSide(
          color: Color(0xFFDEDEDE),
          width: 1.aw,
        ),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(50.h),
        borderSide: BorderSide(
          color: Color(0xFFDEDEDE),
          width: 1.aw,
        ),
      ),
      errorStyle: TextStyle(color: Colors.red),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(50.h),
        borderSide: BorderSide(
          color: Colors.red,
          width: 1.aw,
        ),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(50.h),
        borderSide: BorderSide(
          color: Color(0xFF32CD30),
          width: 1,
        ),
      ),

      hintText: "Search",
      hintStyle: TextStyle(
          color: Color(0xff666666),
          fontFamily: 'Roboto',
          fontWeight: FontWeight.w400,
          fontSize: 20.fSize),
      suffixIcon: Icon(Icons.search_rounded),
    );
  }
}
