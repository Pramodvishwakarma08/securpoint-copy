import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';
import 'package:securepoint/core/constants/size.dart';

import 'const_iteam/custom_button.dart';


class DeleteAccount_Screen extends StatefulWidget {
  const DeleteAccount_Screen({super.key});

  @override
  State<DeleteAccount_Screen> createState() => _DeleteAccount_ScreenState();
}

class _DeleteAccount_ScreenState extends State<DeleteAccount_Screen> {
  String otp = '';

  final defaultPinTheme = PinTheme(
    width: 66.58.aw,
    height: 66.58,
    textStyle:  TextStyle(
        fontSize: 23.92.fSize,fontFamily: 'Roboto',
        color: Color(0xff000000).withOpacity(0.80)
    ),
    decoration: BoxDecoration(
      // boxShadow: [
      //   // BoxShadow(
      //   //   color: Color(0xff000000).withOpacity(0.20),
      //   // ),
      //   BoxShadow(
      //     color: Color(0xff000000).withOpacity(0.20),
      //     spreadRadius: 0,
      //     blurRadius: 2.08,
      //     offset: Offset(0, 0),
      //   ),
      // ],
      color: Color(0xffEDEDED),
      borderRadius: BorderRadius.circular(15.6),
      border: Border.all(color: Colors.grey.withOpacity(0.30),
          width: 0.5.aw
      ),
    ),

  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
     // resizeToAvoidBottomInset: false,
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
                decoration: const BoxDecoration(
                  //color: Color(0xFF32CD30),
                  //borderRadius: BorderRadius.only(bottomRight: Radius.circular(151))
                    image: DecorationImage(
                        fit: BoxFit.fill,
                        image: AssetImage('assets/image/Rectangle 4.png',)
                    )
                ),
              ),

              Padding(
                padding:  EdgeInsets.only(left:27.4.h,),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    InkWell(
                      onTap:(){
                        Navigator.pop(context);
                      },
                        child: Image.asset('assets/image/Frame 427321032.png',height:58.ah,width: 43.aw,)),
                    SizedBox(width: 16.aw),
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
            padding:  EdgeInsets.only(left:27.4.h,right:25.9.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(height: 20.ah),
                Padding(
                  padding:  EdgeInsets.only(left:16.64.h,),
                  child: Text('OTP to\nConfirm Deletion',
                    style: TextStyle(height: 1.2.ah,
                        color: Color(0xff000000),fontWeight: FontWeight.w600,fontSize: 36.fSize
                    ),
                  ),
                ),

                SizedBox(height: 33.28.ah),
                Padding(
                  padding:  EdgeInsets.only(left:16.64.h,right:117.h),
                  child: Text('A 4-digit code has been sent to \n+91 (987)-654-3210',
                    style: TextStyle( fontFamily: 'Roboto',height: 1.3.ah,
                        color: Color(0xff000000).withOpacity(0.50),fontWeight: FontWeight.w600,fontSize:14.fSize
                    ),
                  ),
                ),


                SizedBox(height: 33.28.ah),
               /* Padding(
                  padding:  EdgeInsets.only(left:11.97.h,right:11.97.h),
                  child: PinCodeTextField(
                    keyboardType: TextInputType.number,
                    enablePinAutofill: true,
                    appContext: context,
                    length: 4,
                    onChanged: (value) {
                      setState(() {
                        otp = value;
                        print("$value");
                      });
                    },
                    pinTheme: PinTheme(
                      activeColor: Colors.green,
                      selectedColor: Colors.grey,
                      shape: PinCodeFieldShape.box,
                      inactiveColor:Color(0xff000000).withOpacity(0.20),
                      borderRadius: BorderRadius.circular(15.6),
                      fieldHeight: 70.58.ah,
                      fieldWidth: 66.58.aw,
                      disabledColor: Colors.black,
                      activeFillColor: Colors.purpleAccent,
                      inactiveFillColor: Color(0xff000000).withOpacity(0.20),
                      selectedFillColor: Colors.yellowAccent,
                    ),
                    animationType: AnimationType.fade,
                    cursorColor: Colors.black,
                    animationDuration: Duration(milliseconds: 300),
                    controller: null,
                  ),
                ),*/

                Padding(
                  padding:  EdgeInsets.only(left:11.97.h,right:11.97.h),
                  child: Pinput(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,

                    length: 4,
                    defaultPinTheme:defaultPinTheme,
                    focusedPinTheme: defaultPinTheme.copyWith(
                      decoration: defaultPinTheme.decoration!.copyWith(
                        border: Border.all(color: Color(0xffEDEDED),),),
                    ),
                    onCompleted: (pin) => debugPrint(pin),
                  ),
                ),

                SizedBox(height: 33.28.ah),
                Center(
                  child: RichText(
                    text: TextSpan(
                        text: 'Didn’t receive OTP?',
                        style: TextStyle(
                          fontSize: 14.fSize,fontWeight: FontWeight.w500,color: Colors.black,
                        ),

                        children: [
                          TextSpan(
                            text: ' Please resend',
                            style: TextStyle(decoration: TextDecoration.underline,
                              fontSize: 14.fSize,fontWeight: FontWeight.w500,color:Color(0xFF32CD30),
                            ),)]),),
                ),

              ],
            ),
          ),

          SizedBox(height: 33.28.ah),
          Spacer(),
          Padding(
            padding:  EdgeInsets.only(left:27.4.h,right:25.91.h),
            child: CustomPrimaryBtn(
              title: 'Delete my account', isLoading: false,
              onTap: () {
                // Get.to(NavigationScreen());;

             //   Navigator.push(context, MaterialPageRoute(builder: (context) => NavigationScreen()));

              },),
          ),
          SizedBox(height:80.ah),
        ],
      ),
    );

  }
}

/*
class OtpPage extends StatefulWidget {
  String number;
  String otp;
  OtpPage(  {Key? key, required this.number,required this.otp}) : super(key: key);

  @override
  State<OtpPage> createState() => _OtpPageState();
}

class _OtpPageState extends State<OtpPage> {
  OtpController otpController = Get.put(OtpController());

  String otp = '';

  final _formKey = GlobalKey<FormState>();

  // Future<otp_verify> OTPaccount() async {
  //   check().then((intenet) {
  //     if (intenet != null && intenet) {
  //       // Internet Present Case
  //       showLoaderDialog(context);
  //     } else {
  //       Fluttertoast.showToast(
  //           msg: "Please check your Internet connection!!!!",
  //           toastLength: Toast.LENGTH_SHORT,
  //           gravity: ToastGravity.BOTTOM,
  //           backgroundColor: HexColor('#ED1D22'),
  //           textColor: Colors.white,
  //           fontSize: 16.0);
  //     }
  //   }
  //   );
  //
  //   Map toMap() {
  //     var map = new Map<String, dynamic>();
  //
  //     map["code"] = Codecontroller.text.toString();
  //     map["phone_number"] = widget.number.toString();
  //     return map;
  //   }
  //   print('LLLL');
  //   var response = await http.post(
  //     Uri.parse("https://forreal.net:4000/users/phone_code_verification"),
  //
  //     // (" ${AppUrl.baseurl}/signup")
  //     body: toMap(),
  //   );
  //   print('MMMMM');
  //
  //   Navigator.pop(context);
  //   success = (otp_verify.fromJson(json.decode(response.body)).success);
  //   message = (otp_verify.fromJson(json.decode(response.body)).message);
  //
  //   print('NNNNn');
  //
  //   print("success 123 ==${success}");
  //   print("success 123 ==${message}");
  //   if (success == true) {
  //     if (success == true) {
  //       print("success 123 ==${success}");
  //       //  Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (_)=>BottomBar_Screen()));
  //       Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => LoginScreenPage()),);
  //     }
  //   } else {
  //     Navigator.pop(context);
  //     print('else==============');
  //   }
  //   print('OOOO');
  //   return otp_verify.fromJson(json.decode(response.body));
  // }
  // Future<bool> check() async {
  //   var connectivityResult = await (Connectivity().checkConnectivity());
  //   if (connectivityResult == ConnectivityResult.mobile) {
  //     return true;
  //   } else if (connectivityResult == ConnectivityResult.wifi) {
  //     return true;
  //   }
  //   return false;
  // }
  // showLoaderDialog(BuildContext context) {
  //   AlertDialog alert = AlertDialog(
  //     content: Row(
  //       children: [
  //         CircularProgressIndicator(strokeWidth: 2,),
  //         Container(
  //           margin: EdgeInsets.only(left: 7), child: Text("Login ...",),),
  //       ],
  //     ),
  //   );
  //   print('PPPPPP');
  //   showDialog(
  //     barrierDismissible: false,
  //     context: context,
  //     builder: (BuildContext context) {
  //       return alert;
  //     },
  //   );
  // }

  @override
  void initState() {
    print("${widget.number}");
    print("otp geeta user signup${widget.otp}");
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        leading: Padding(
          padding: EdgeInsets.symmetric(horizontal: 8, vertical: 5),
          child: InkWell(
              onTap: () {
                Get.back();
              },
              child: SvgPicture.asset(
                'assets/icons/btn.svg',
              )),
        ),
      ),
      body: Form(
        // key: _formKey,
        child: Center(
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 50),
            child: Column(
              children: [
                customTextCommon(
                    text: "Type the verification code",
                    fSize: 18,
                    fWeight: FontWeight.w500,
                    lineHeight: 20),
                customTextCommon(
                    text: " we’ve sent you",
                    fSize: 18,
                    fWeight: FontWeight.w500,
                    lineHeight: 20),
                SizedBox(height: 140.h),
                Text("OTP : ${widget.otp}",style: TextStyle(fontSize: 14,fontWeight: FontWeight.w500),),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 30, vertical: 30),
                  child: PinCodeTextField(
                    keyboardType: TextInputType.number,
                    enablePinAutofill: true,
                    appContext: context,
                    length: 4,
                    onChanged: (value) {
                      setState(() {
                        otp = value;
                        print("$value");
                      });
                    },
                    pinTheme: PinTheme(
                      activeColor: Colors.redAccent,
                      selectedColor: Colors.redAccent,
                      shape: PinCodeFieldShape.box,
                      borderRadius: BorderRadius.circular(15),
                      fieldHeight: 65,
                      fieldWidth: 62,
                      activeFillColor: Colors.purpleAccent,
                      inactiveFillColor: Colors.grey,
                      selectedFillColor: Colors.yellowAccent,
                    ),
                    animationType: AnimationType.fade,
                    cursorColor: Colors.black,
                    animationDuration: Duration(milliseconds: 300),
                    controller: otpController.Codecontroller,
                  ),
                ),

                SizedBox(height: 20),
                InkWell(
                    onTap: () {
                      // otpController.otpverify("${widget.number}");
                    },
                    child: Text(
                      'Send again',
                      style: CustomTextStyle.ote,
                    )),
                // TextButton(onPressed: (){
                //   OTPaccount();
                //   print("sdfghfd");
                //   print(Codecontroller.value.text);
                // }, child: Text("sumbit")),
                Spacer(),
                customPrimaryBtn(
                    btnText: "Sumbit",
                    btnFun: () {
                      print(otpController.Codecontroller.value.text);
                      otpController.otpverify("${widget.number}");
                    }),
                SizedBox(
                  height: 30,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
*/
