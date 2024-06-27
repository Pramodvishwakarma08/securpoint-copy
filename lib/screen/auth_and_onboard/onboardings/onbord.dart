import 'package:flutter/material.dart';
import 'package:securepoint/screen/auth_and_onboard/login/login_with_email.dart';
import 'package:securepoint/core/constants/size.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:velocity_x/velocity_x.dart';
import 'onboard_one.dart';
import 'onboard_second.dart';
import 'onbord_three.dart';


class OnBoard extends StatefulWidget {
  const OnBoard({super.key});

  @override
  State<OnBoard> createState() => _OnBoardState();
}

class _OnBoardState extends State<OnBoard> {
 // PageController _pageController = PageController(initialPage: 0);

  int _currentPageIndex = 0;

  void _changeToNextPage() {
    if(_currentPageIndex < 2){
      print("asdfghj${_currentPageIndex}");
      _pageController.nextPage(
        duration: Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
      setState(() {
      });
    }else{
      onTapSkip();
    }

  }

  onTapSkip() async {
    Navigator.push(context, MaterialPageRoute(builder: (context) => LoginWithEmailScreen()));

  }


  final PageController _pageController =PageController();

 // OnBoardViewModel onBoardViewModel = OnBoardViewModel();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          SizedBox(height: 91.ah,),
          PageView(
            controller: _pageController,
            onPageChanged: (value) {
              _currentPageIndex =value;
              print("object$value");
            },
            children: const [
              OnBoardFirst(),
              OnBoardSecond(),
              OnBoardThird(),
            ],
          ).expand(),
          30.heightBox,
        // padding:  EdgeInsets.symmetric(horizontal:55.h),

          Padding(
            padding:  EdgeInsets.symmetric(horizontal:55.h),
           // padding:  EdgeInsets.only(left: 55.h,right: 58.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SmoothPageIndicator(
                  controller: _pageController, // PageController
                  count: 3,
                  effect:  WormEffect(
                    activeDotColor: Color(0xff32CD30),
                    dotColor:Color(0xff32CD30),
                    dotHeight: 6.5.ah,
                    dotWidth: 6.5.ah,
                  ), // your preferred effect
                  onDotClicked: (index) {},
                ),

                SizedBox(height: 30.ah),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                 // mainAxisSize: MainAxisSize.min,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        _changeToNextPage();
                        // Navigator.push(context,MaterialPageRoute(builder: (context) => SignupScreen()));
                      },
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Color(0xff32CD30),
                          minimumSize: Size(117.aw, 44.ah),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(11),
                          )),
                      child: "Next".
                      text.size(14)
                          .fontWeight(FontWeight.w400).color(Colors.white)
                          .make(),
                    ),

                   // Spacer(),

                    InkWell(
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => LoginWithEmailScreen()));
                      },
                      child: Text('Skip  ', style:TextStyle(
                        color: Color(0xff000000),fontSize:14.fSize,fontFamily: 'Roboto',
                        fontWeight: FontWeight.w700,
                      )),
                    )
                  ],
                ),

              ],
            ),
          ),
          50.heightBox,
        ],
      ),
    );
  }
}
class OnBoardViewModel {
  final PageController pageController = PageController();
}




// flutter_lints: ^3.0.0
// velocity_x: ^4.1.2
// sizer: ^2.0.15
// smooth_page_indicator: ^1.1.0
// flutter_svg: ^2.0.10+1
// hexcolor: ^3.0.1
// dotted_border: ^2.1.0
// pin_code_fields: ^8.0.1
// google_fonts: ^6.2.1
// dotted_line: ^3.2.2