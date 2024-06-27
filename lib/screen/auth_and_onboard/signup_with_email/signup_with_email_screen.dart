// import 'package:flutter/cupertino.dart';
// import 'package:flutter/gestures.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:securepoint/core/constants/size.dart';
//
// import '../../../api_client/api_repository.dart';
// import '../../const_iteam/const_textfile.dart';
// import '../../const_iteam/custom_button.dart';
// import '../signup_with_phone_number/otp_screen.dart';
// import '../signup_with_phone_number/signupwithphone.dart';
//
// class SignupWithEmailScreen extends StatefulWidget {
//   const SignupWithEmailScreen({super.key});
//
//   @override
//   State<SignupWithEmailScreen> createState() => _SignupWithEmailScreenState();
// }
//
// class _SignupWithEmailScreenState extends State<SignupWithEmailScreen> {
//
//
//
//   var isLoading =false.obs;
//   signUpWithEmail() async {
//     print("sdfg");
//     isLoading(true);
//     bool islogin =await ApiRepository.signUpWithEmail(email: emailTc.text,) ;
//     isLoading(false);
//     if(islogin){
//       next(emailTc.text);
//     }
//   }
//
//   next(number){
//     Navigator.push(context, MaterialPageRoute(builder: (context) =>  OtpScreen(number: number, isnumber: false,)));
//   }
//
//
//   TextEditingController emailTc =TextEditingController();
//
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       //resizeToAvoidBottomInset: f,
//       backgroundColor: Colors.white,
//       body: Column(
//         mainAxisAlignment: MainAxisAlignment.start,
//         crossAxisAlignment: CrossAxisAlignment.center,
//         children: [
//           Stack(
//             alignment: Alignment.centerLeft,
//             children: [
//               Container(
//                 height: 154.ah,
//                 width: MediaQuery.of(context).size.width,
//                 decoration: BoxDecoration(
//                   //color: Color(0xFF32CD30),
//                   //borderRadius: BorderRadius.only(bottomRight: Radius.circular(151))
//                     image: DecorationImage(
//                         fit: BoxFit.fill,
//                         image: AssetImage('assets/image/Rectangle 4.png',)
//                     )
//                 ),
//               ),
//
//               SizedBox(height: 10.ah),
//               Padding(
//                 padding:  EdgeInsets.only(left:27.4.h,),
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.start,
//                   crossAxisAlignment: CrossAxisAlignment.center,
//                   children: [
//                     Image.asset('assets/image/secur icon.png',height:58.ah,width: 43.aw,),
//                     SizedBox(width:20.aw),
//                     Text('SecurPoint', style:TextStyle(
//                       color: Colors.white,fontSize: 35.7.fSize,fontFamily: 'adobe-garamond-pro',
//                       fontWeight: FontWeight.w700,letterSpacing: 1,
//                     ))
//                   ],
//                 ),
//               )
//             ],
//           ),
//
//           Padding(
//             padding:  EdgeInsets.only(left: 27.h,right:27.h),
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.start,
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 SizedBox(height: 20.ah),
//                 Text('Welcome!',
//                   style: TextStyle(
//                       color: Color(0xff000000),fontWeight: FontWeight.w600,fontSize: 36.fSize
//                   ),
//                 ),
//                 SizedBox(height:33.28.ah),
//                 Text('Please enter your email to verify your account',
//                   style: TextStyle(
//                       color: Color(0xff000000).withOpacity(0.50),fontWeight: FontWeight.w600,fontSize:14.56.fSize
//                   ),
//                 ),
//                 SizedBox(height:32.ah),
//                 primaryTextfield(hintText: 'Enter Email', controller: emailTc),
//
//                 SizedBox(height:26.ah),
//                 InkWell(
//                   onTap: () {
//                     Navigator.push(context, MaterialPageRoute(builder: (context) =>SignupWithPhoneNumber() ));
//                   },
//                   child: Container(
//                     //alignment: Alignment.topRight,
//                     color: Colors.white,
//                     height: 30.ah,width:231.aw,
//                     child: RichText(
//                       text: TextSpan(
//                           text: ' Don’t have an email?',
//                           style: TextStyle(
//                             fontSize: 14.fSize,fontWeight: FontWeight.w500,color: Colors.black,
//                           ),
//                           // style: GoogleFonts.roboto(
//                           //   fontSize: 14.fSize,fontWeight: FontWeight.w500,color: Colors.black,
//                           // ),
//                           children: [
//                             TextSpan(
//                                 text: ' Use phone no.',
//                                 style: TextStyle(
//                                   fontSize: 14.fSize,fontWeight: FontWeight.w500,color:Color(0xFF32CD30),
//                                 ),
//                                 recognizer: TapGestureRecognizer()..onTap=(){
//                                   Navigator.push(context, MaterialPageRoute(builder: (context) =>SignupWithPhoneNumber() ));
//                                 }
//                             )
//                           ]
//                       ),
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//
//           SizedBox(height:26.ah),
//           Spacer(),
//           Padding(
//             padding:  EdgeInsets.only(left: 27.h,right:27.h),
//             child: Obx(
//               ()=> CustomPrimaryBtn(
//                 title: 'Send OTP', isLoading: isLoading.value,
//                 onTap: () {
//                   //Get.to(LoginScreen());
//                   signUpWithEmail();
//                 //  Navigator.push(context, MaterialPageRoute(builder: (context) => LoginScreen()));
//                 },),
//             ),
//           ),
//           SizedBox(height:80.ah),
//
//         ],
//       ),
//     );
//   }
// }


import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:securepoint/core/constants/app_dialogs.dart';
import 'package:securepoint/core/constants/size.dart';
import '../../../api_client/api_repository.dart';
import '../../const_iteam/const_textfile.dart';
import '../../const_iteam/custom_button.dart';
import '../../t&c/trems_conditons.dart';
import 'otp_screen.dart';

class SignupWithEmailScreen extends StatefulWidget {
  const SignupWithEmailScreen({super.key});

  @override
  State<SignupWithEmailScreen> createState() => _SignupWithEmailScreenState();
}

class _SignupWithEmailScreenState extends State<SignupWithEmailScreen> {


  bool isEmail = true ;
  bool valuesecond = false;

  var isLoading =false.obs;

  signUpWithEmail() async {
    isLoading(true);
    bool islogin =await ApiRepository.signUpWithEmail(email: emailTc.text,) ;
    isLoading(false);
    if(islogin){
      next(emailTc.text);
    }
  }

  signUpWithPhoneNumber() async {
    isLoading(true);
    bool islogin =await ApiRepository.signUpWithPhoneNumber(number: phoneNumberTc.text,)         ;
    isLoading(false);
    if(islogin){
      next(phoneNumberTc.text);
    }
  }

  next(number){
    Navigator.push(context, MaterialPageRoute(builder: (context) =>  OtpScreen(number: number, isnumber: isEmail ? false : true,)));
  }


  TextEditingController emailTc =TextEditingController();
  TextEditingController phoneNumberTc =TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //resizeToAvoidBottomInset: f,
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Stack(
            alignment: Alignment.centerLeft,
            children: [
              Container(
                height: 154.ah,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  //color: Color(0xFF32CD30),
                  //borderRadius: BorderRadius.only(bottomRight: Radius.circular(151))
                    image: DecorationImage(
                        fit: BoxFit.fill,
                        image: AssetImage('assets/image/Rectangle 4.png',)
                    )
                ),
              ),

              SizedBox(height: 10.ah),
              Padding(
                padding:  EdgeInsets.only(left:27.4.h,),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.asset('assets/image/secur icon.png',height:58.ah,width: 43.aw,),
                    SizedBox(width:20.aw),
                    Text('SecurPoint', style:TextStyle(
                      color: Colors.white,fontSize: 35.7.fSize,fontFamily: 'adobe-garamond-pro',
                      fontWeight: FontWeight.w700,letterSpacing: 1,
                    ))
                  ],
                ),
              )
            ],
          ),

          Padding(
            padding:  EdgeInsets.only(left: 27.h,right:27.h),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 20.ah),
                Text('Welcome!',
                  style: TextStyle(
                      color: Color(0xff000000),fontWeight: FontWeight.w600,fontSize: 36.fSize
                  ),
                ),
                SizedBox(height:33.28.ah),
                Text(isEmail==false  ?'Please enter your phone number to verify \nyour account' :   'Please enter your email to verify your account',
                  style: TextStyle(
                      color: Color(0xff000000).withOpacity(0.50),fontWeight: FontWeight.w600,fontSize:14.56.fSize
                  ),
                ),
                SizedBox(height:32.ah),

                isEmail ?  primaryTextfield(hintText: 'Enter Email', controller: emailTc)
                    : primaryTextfield(hintText: 'Enter Phone no', controller: phoneNumberTc),

                SizedBox(height:26.ah),
                InkWell(
                  onTap: () {
                    isEmail = !isEmail ;
                    setState(() {

                    });
                    //  Navigator.push(context, MaterialPageRoute(builder: (context) =>SignupWithPhoneNumber() ));
                  },
                  child: Container(
                    color: Colors.white,
                    height: 30.ah,width:231.aw,
                    child: RichText(
                      text: TextSpan(
                          text: '${isEmail ? "Don’t have an email?" : "Don’t have a phone no.?" } ',
                          style: TextStyle(
                            fontSize: 14.fSize,fontWeight: FontWeight.w500,color: Colors.black,
                          ),
                          children: [
                            TextSpan(
                              text: ' ${isEmail ? "Use phone no." : "Use Email"}',
                              style: TextStyle(
                                fontSize: 14.fSize,fontWeight: FontWeight.w500,color:Color(0xFF32CD30),
                              ),
                            )
                          ]
                      ),
                    ),
                  ),
                ),

                SizedBox(height:26.ah),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Checkbox(
                      visualDensity: VisualDensity(horizontal: -4, vertical: -4),
                      activeColor: Colors.green,
                      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      //checkColor: Colors.black,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(3.5),
                        side: BorderSide(
                            color:Color(0xFF32CD30),
                            width: 1.aw
                        ),
                      ),
                      value: valuesecond,
                      onChanged: ( value) {
                        setState(() {
                          this.valuesecond = value!;
                        });
                      },
                    ),

                    SizedBox(width:10.aw),
                    InkWell(
                      onTap:() {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => TreamsConditionPage() ));
                      },
                      child: RichText(
                        text: TextSpan(
                            text: 'By creating an account, you agree to our ',
                            style:TextStyle(
                              fontSize:10.fSize,fontWeight: FontWeight.w500,color: Colors.black,
                            ),
                            children: [
                              TextSpan(
                                text: 'Terms & Conditions.',
                                style: TextStyle(
                                  fontSize: 10.fSize,fontWeight: FontWeight.w500,color:Color(0xFF32CD30),
                                ),)]),),
                    ),


                  ],
                ),
              ],
            ),
          ),

          SizedBox(height:26.ah),
          Spacer(),
          Padding(
            padding:  EdgeInsets.only(left: 27.h,right:27.h),
            child: Obx(
                  ()=> CustomPrimaryBtn(
                title: 'Send OTP', isLoading: isLoading.value,
                onTap: () {
                  if(valuesecond){
                    if(isEmail){
                      print("object");
                      signUpWithEmail();
                    }else{
                      signUpWithPhoneNumber();
                    }
                  }else{
                    AppDialog.taostMessage("Please accept the terms and conditions to proceed.");
                  }


                  //  Navigator.push(context, MaterialPageRoute(builder: (context) => LoginScreen()));
                },),
            ),
          ),
          SizedBox(height:80.ah),

        ],
      ),
    );
  }
}
