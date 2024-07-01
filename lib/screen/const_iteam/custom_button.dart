import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:securepoint/core/constants/size.dart';

class CustomPrimaryBtn extends StatelessWidget {
  const CustomPrimaryBtn(
      {required this.title,
        // required this.validator,
        required this.isLoading,
        required this.onTap});
  final Function()? onTap;
  // var validator;
  final String title;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 50.96.ah,
        width: 336.96.aw,
        child: Center(
          child: isLoading
              ? Container(
              height: 34.adaptSize,
              width: 34.adaptSize,
              child: CircularProgressIndicator(
                color: Colors.white,
                strokeWidth: 2,
              ))
              : Text(
            '$title',
            style: TextStyle(
              color: Color(0xffFFFFFF),
              fontSize: 16.64.adaptSize,
              fontFamily: 'Roboto',
              fontWeight: FontWeight.w600,
              height: 0,
              letterSpacing: 0.90,
            ),
          ),
        ),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: Color(0xFF32CD30)
        ),
      ),
    );
  }
}



class CustomPrimaryBtn1 extends StatelessWidget {
  const CustomPrimaryBtn1(
      {required this.title,
        // required this.validator,
        required this.isLoading,
        required this.onTap});
        final Function()? onTap;
  // var validator;
  final String title;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 40.ah,
        width: 304.aw,
        child: Center(
          child: isLoading
              ? Container(
              height: 34.adaptSize,
              width: 34.adaptSize,
              child: CircularProgressIndicator(
                color: Colors.white,
                strokeWidth: 2,
              ))
              : Text(
            '$title',
            style: TextStyle(
              color: Colors.white,
              fontSize: 16.6.adaptSize,
              fontFamily: 'Roboto',
              fontWeight: FontWeight.w600,
              height: 0,
              letterSpacing: 0.90,
            ),
          ),
        ),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(31),
            color: Color(0xFF32CD30)
        ),
      ),
    );
  }
}

class CustomPrimaryBtn01 extends StatelessWidget {
  const CustomPrimaryBtn01(
      {required this.title,
        // required this.validator,
        required this.isLoading,
        required this.onTap});
  final Function()? onTap;
  // var validator;
  final String title;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 40.ah,
        width: 324.aw,
        child: Center(
          child: isLoading
              ? Container(
              height: 34.adaptSize,
              width: 34.adaptSize,
              child: CircularProgressIndicator(
                color: Colors.white,
                strokeWidth: 2,
              ))
              : Text(
            '$title',
            style: TextStyle(
              color: Colors.white,
              fontSize: 16.6.adaptSize,
              fontFamily: 'Roboto',
              fontWeight: FontWeight.w600,
              height: 0,
              letterSpacing: 0.90,
            ),
          ),
        ),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(31),
            color: Color(0xFF32CD30)
        ),
      ),
    );
  }
}




class CustomPrimaryBtn11 extends StatelessWidget {
  const CustomPrimaryBtn11(
      {required this.title,
        // required this.validator,
        required this.isLoading,
        required this.onTap});
  final Function()? onTap;
  // var validator;
  final String title;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 40.ah,
        width: 324.aw,
        child: Center(
          child: isLoading
              ? Container(
              height: 34.adaptSize,
              width: 34.adaptSize,
              child: CircularProgressIndicator(
                color: Colors.white,
                strokeWidth: 2,
              ))
              : Text(
            '$title',
            style: TextStyle(
              color: Colors.white,
              fontSize: 16.6.adaptSize,
              fontFamily: 'Roboto',
              fontWeight: FontWeight.w600,
              height: 0,
              letterSpacing: 0.90,
            ),
          ),
        ),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(31),
            color: Color(0xFF32CD30)
        ),
      ),
    );
  }
}


class CustomPrimaryBtn2 extends StatelessWidget {
  const CustomPrimaryBtn2(
      {required this.title,
        // required this.validator,
        required this.isLoading,
        required this.onTap});
  final Function()? onTap;
  // var validator;
  final String title;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 44.ah,
        width: 342.aw,
        child: Center(
          child: isLoading
              ? Container(
              height: 34.adaptSize,
              width: 34.adaptSize,
              child: CircularProgressIndicator(
                color: Colors.white,
                strokeWidth: 2,
              ))
              : Text(
            '$title',
            style: TextStyle(
              color: Colors.white,
              fontSize: 16.6.adaptSize,
              fontFamily: 'Inter',
              fontWeight: FontWeight.w600,
              height: 0,
              letterSpacing: 0.90,
            ),
          ),
        ),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(31),
            color: Color(0xFFC60000)
        ),
      ),
    );
  }
}




class CustomPrimaryBtn3 extends StatelessWidget {
  const CustomPrimaryBtn3(
      {required this.title,
        // required this.validator,
        required this.isLoading,
        required this.onTap});
  final Function()? onTap;
  // var validator;
  final String title;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 27.ah,
        width: 96.aw,
        child: Center(
          child: isLoading
              ? Container(
              height: 34.adaptSize,
              width: 34.adaptSize,
              child: CircularProgressIndicator(
                color: Colors.white,
                strokeWidth: 2,
              ))
              : Text(
            '$title',
            style: TextStyle(
              color: Colors.white,
              fontSize: 12.6.adaptSize,
              fontFamily: 'Inter',
              fontWeight: FontWeight.w600,
              height: 0,
              letterSpacing: 0.90,
            ),
          ),
        ),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(31),
            color: Color(0xFF32CD30),
        ),
      ),
    );
  }
}
