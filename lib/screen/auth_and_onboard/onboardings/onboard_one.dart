import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:securepoint/core/constants/size.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:velocity_x/velocity_x.dart';

import 'onbord.dart';

class OnBoardFirst extends StatelessWidget {
  const OnBoardFirst({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    //OnBoardViewModel onBoardViewModel = OnBoardViewModel();

    return Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [

            Container(
              height:376.ah,
              width: 376.ah,
              //color: Colors.green,
              decoration: BoxDecoration(
               image: DecorationImage(
                   image: AssetImage('assets/image/Authentication-rafiki 1.png'),
                 fit: BoxFit.cover
               )
              ),
            ),

            Center(
              child: /*Text('Find a Perfect    \nSecure Item.',
                style: TextStyle(fontFamily: 'Roboto',height: 1.2.ah,letterSpacing:1.6,
                    color: Color(0xff000000),fontWeight: FontWeight.w700,fontSize:37.66.fSize
                ),
              ),*/
              Text('Find a Perfect     \nSecure Item.',
                style: TextStyle(fontFamily: 'Roboto',height: 1.2.ah,letterSpacing: 1,
                    color: Color(0xff000000),fontWeight: FontWeight.w700,fontSize:37.66.fSize
                ),
              ),
            ),
            SizedBox(height: 15.ah,),
            Center(
              child: /*Text('One place with the best secure Item. Apply\nto all of them with a single profileand get\nin touch with best seller directly',
                style: TextStyle(fontFamily: 'Roboto',letterSpacing: 0.8,fontStyle: FontStyle.normal,
                    color: Color(0xff000000),fontWeight: FontWeight.w500,fontSize:14.fSize,height: 1.3.ah
                ),
              ),*/
              Text('One place with the best secure Item. Apply \nto all of them with a single profile and get \nin touch with best seller directly.',
                style: TextStyle(fontFamily: 'Roboto',letterSpacing: 0.8,fontStyle: FontStyle.normal,
                    color: Color(0xff000000),fontWeight: FontWeight.w500,fontSize:14.fSize,height: 1.3.ah
                ),
              ),
            ),

       /* SizedBox(height: 30.ah,),
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            // Image.asset('assets/image/image 1.png',height:48.ah,width: 48.aw,),

            // One place with the best secure Item. Apply to all of them with a single profile and get in touch with best seller directly.
          ],
        ),*/

        SizedBox(height: 20.ah,),
    ]
        );
  }
}
// Image.asset(
//   "assets/image/Authentication-rafiki 1.png",
//   height:376.ah,
//   width: 376.ah,
//   fit:BoxFit.fill ,
// ),
