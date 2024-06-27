import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:securepoint/core/constants/size.dart';
import '../../../model/assets_model.dart';
import '../custom_image_view.dart';

class CarouselDemo extends StatefulWidget {
  final   Asset assetDetailsModel ;
  const  CarouselDemo({super.key,required this.assetDetailsModel});

  @override
  State<CarouselDemo> createState() => _CarouselDemoState();
}

class _CarouselDemoState extends State<CarouselDemo> {
  @override
  Widget build(BuildContext context) {
    return  CarouselSlider(
      options: CarouselOptions(
        height:181.ah,
        autoPlay: true,
        enlargeCenterPage: true,
        aspectRatio: 1/1.404,
        autoPlayInterval: Duration(seconds: 3),
        autoPlayAnimationDuration: Duration(milliseconds: 800),
        autoPlayCurve: Curves.fastOutSlowIn,
        pauseAutoPlayOnTouch: true,
        scrollDirection: Axis.horizontal,
      ),
      items: widget.assetDetailsModel.assetImages!.map((item) => Container(
        child:    Padding(
          padding:  EdgeInsets.only(top: 20.0.ah),
          child: Center(
            child: Stack(
                alignment: Alignment.center,
                clipBehavior: Clip.none,
                children: [
                  CustomImageView(
                    height:161.ah,
                    width:226.aw,
                    imagePath: item.imageUrl,
                    fit: BoxFit.cover,
                    radius:  BorderRadius.circular(10),
                  ),

                  Positioned(
                      right: -20.0.h,
                      top: -20.0.v,
                      child: Container(
                        width: 75.0.aw,
                        height: 75.0.ah,
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
                          child: Image.asset( widget.assetDetailsModel.lock == 0 ?   'assets/image/tala.png' : "assets/image/tala_open.png",
                            width: 35.0.aw,
                            height: 47.0.ah,
                            fit: BoxFit.contain,
                          ),
                        ),
                      )
                  )

                ]
            ),
          ),
        ),
        // child: Center(
        //   child: Image.network(item.images!, fit: BoxFit.cover, width: 1000),
        // ),
      )).toList(),
    );
  }
}


