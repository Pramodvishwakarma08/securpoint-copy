import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:securepoint/core/constants/size.dart';
import 'package:velocity_x/velocity_x.dart';

class OnBoardSecond extends StatelessWidget {
  const OnBoardSecond({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
       /* Image.asset(
          "assets/image/Plain credit card-pana 1.png",
          height:354.ah,
          width: 354.ah,
          fit:BoxFit.fill ,
        ),*/
        Container(
          height:376.ah,
          width: 376.ah,
          //color: Colors.green,
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/image/Frame 288948.png'),
                  fit: BoxFit.cover
              )
          ),
        ),

        Center(
          child: Text('Pay As Secure \nAs You Deserve ',
            style: TextStyle(fontFamily: 'Roboto',height: 1.2.ah,letterSpacing: 1.6,
                color: Color(0xff000000),fontWeight: FontWeight.w700,fontSize:37.66.fSize
            ),
          ),
        ),
        SizedBox(height: 15.ah,),
        Center(
          child: Text('One place with the best secure Item. Apply \nto all of them with a single profile and get \nin touch with best seller directly.',
            style: TextStyle(fontFamily: 'Roboto',letterSpacing: 0.8,fontStyle: FontStyle.normal,
                color: Color(0xff000000),fontWeight: FontWeight.w500,fontSize:14.fSize,height: 1.3.ah
            ),
          ),
        ),

        /*SizedBox(height: 30.ah,),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            // Image.asset('assets/image/image 1.png',height:48.ah,width: 48.aw,),

          ],
        ),*/


        SizedBox(height: 20.ah,),
      ],
    );
  }
}
