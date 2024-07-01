import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:securepoint/core/constants/size.dart';
import '../../add_assets/add_assets.dart';





Widget floatingActionButtonAddAssets({double ? padding}){
  return Padding(
    padding:  EdgeInsets.only(bottom: Platform.isIOS ? 30.0.ah : 0.ah),
    child: InkWell(
      onTap: () {
        Get.to(()=>const AddAssetsScreen());
      },
      child: Container(
        width: 134,
        height: 58,
        decoration: ShapeDecoration(
          color: Colors.white,
          shape: RoundedRectangleBorder(
            side: const BorderSide(width: 1, color: Color(0xFFD9D6D6)),
            borderRadius: BorderRadius.circular(40),
          ),
          shadows: const [
            BoxShadow(
              color: Color(0x3F000000),
              blurRadius: 4,
              offset: Offset(0, 4),
              spreadRadius: 0,
            )
          ],
        ),
        child: Center(
          child:  Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(width: 5,),
               Text(
                'Add assets',
                style: TextStyle(
                  color: const Color(0xFF6A6A6A),
                  fontSize: 14.adaptSize,
                  fontFamily: 'Roboto',
                  fontWeight: FontWeight.w500,
                  height: 0.10,
                  letterSpacing: -0.41,
                ),
              ),
              const SizedBox(width: 5,),
              Container(
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                          color: Color(0xFF32CD30),width:3
                      )
                  ),
                  height: 48,width: 48,
                  child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Image.asset('assets/image/plusss.png',height: 20,width: 19,)
                  )

                //Icon(Icons.add,color: Color(0xFF32CD30)),
              )

            ],
          ),
        ),
      ),
    ),
  );
}

