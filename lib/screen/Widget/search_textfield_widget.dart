import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:securepoint/core/constants/size.dart';

Widget serchTextField({required BuildContext  context, TextEditingController? controller,Function(String)? onChange}){
  return  Padding(
    padding: EdgeInsets.only(left: 4.aw, right: 4.aw),
    child: Center(
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: 52.ah,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color:const Color(0xffFFFFFF),
          borderRadius: BorderRadius.circular(43),
          boxShadow: [
            BoxShadow(
              color: Color(0xff000000).withOpacity(0.25),
              spreadRadius: -1,
              blurRadius: 6,
              offset: Offset(0, 2),
            ),
          ],
        ),
        child: TextField(
          cursorColor: const Color(0xFF000000),
          style: const TextStyle(color: Colors.black),
          controller: controller,
          onChanged: onChange,
          decoration: InputDecoration(
              contentPadding: EdgeInsets.all(15.adaptSize),
              prefixIcon: Padding(padding: const EdgeInsets.all(13.0),
                child: SvgPicture.asset(
                  'assets/icon/Icon (1).svg',
                  height: 6.ah,
                  width: 6.8.aw,
                ),
              ),
              hintText: "Search Assets",
              hintStyle: TextStyle(
                  color: Color(0xff000000).withOpacity(0.30),
                  fontSize: 16.fSize,
                  fontWeight: FontWeight.w400),
              border: InputBorder.none),
        ),
      ),
    ),
  );
}