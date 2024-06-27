import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:securepoint/core/constants/size.dart';
import 'package:velocity_x/velocity_x.dart';

class OnBoardThird extends StatelessWidget {
  const OnBoardThird({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
     // mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          width: 450.adaptSize,
          child: Container(
            margin:EdgeInsets.only(left:44.h,right:44.h),
            height:362.ah,
            width: 339.aw,
            //color: Colors.green,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/image/imgg.png'),
                    fit: BoxFit.cover
                )
            ),
          ),
        ),

        SizedBox(height: 25.ah,),
        Center(
          child: Text('Trusted Item on\nTrusted Location',
            style: TextStyle(fontFamily: 'Roboto',height: 1.2.ah,letterSpacing: 1.6,
                color: Color(0xff000000),fontWeight: FontWeight.w700,fontSize:37.66.fSize
            ),
          ),
        ),
        SizedBox(height: 15.ah,),
        Center(
          child: Text('One place with the best secure Item. Apply\nto all of them with a single profile and get\nin touch with best seller directly.            ',
            style: TextStyle(fontFamily: 'Roboto',letterSpacing:0.8,fontStyle: FontStyle.normal,
                color: Color(0xff000000),fontWeight: FontWeight.w500,fontSize:14.fSize,height: 1.3.ah
            ),
          ),
        ),


       // SizedBox(height: 20.ah,),
      ],
    );
  }
}
