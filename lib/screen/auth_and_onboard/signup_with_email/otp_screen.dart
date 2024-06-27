import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pinput/pinput.dart';
import 'package:securepoint/core/constants/size.dart';
import 'dart:async';
import '../../../api_client/api_repository.dart';
import '../../const_iteam/custom_button.dart';
import '../set_password/set_password_screen.dart';

class OtpScreen extends StatefulWidget {
  final String number;
  final bool isnumber;

  const OtpScreen({super.key, required this.number, required this.isnumber});

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  Timer? _timer;
  int _start = 60;
  bool _isButtonDisabled = true;


  void startTimer() {
    _start = 60;
    _isButtonDisabled = true;
    _timer = Timer.periodic(Duration(seconds: 1), (Timer timer) {
      if (_start == 0) {
        setState(() {
          _isButtonDisabled = false;
          timer.cancel();
        });
      } else {
        setState(() {
          _start--;
        });
      }
    });
  }

  @override
  void initState() {
    super.initState();
    startTimer();
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }




  var isLoading = false.obs;
  String otp = "";

  verifyOtpWithNumber() async {
    isLoading(true);
    bool islogin = await ApiRepository.verifyOtpWithNumber(
      number: widget.number,
      otp: otp,
      isnumber: widget.isnumber,
    );
    isLoading(false);
    if (islogin) {
      ontapContinue();
    }
  }

  ontapContinue() {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => SetPasswordScreen(
                  email: widget.number,
                  isnumber: widget.isnumber,
                )));
  }

  final defaultPinTheme = PinTheme(
    width: 66.58.adaptSize,
    height: 66.58,
    textStyle: TextStyle(
        fontSize: 23.92.fSize,
        fontFamily: 'Roboto',
        color: Color(0xff000000).withOpacity(0.80)),
    decoration: BoxDecoration(
      color: Color(0xffEDEDED),
      borderRadius: BorderRadius.circular(15.6),
      border: Border.all(color: Colors.grey.withOpacity(0.30), width: 0.5.aw),
    ),
  );
  final TextEditingController textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Stack(
            alignment: Alignment.centerLeft,
            children: [
              // Container(
              //   height:50.ah,
              //   width: MediaQuery.of(context).size.width,
              //   color: Color(0xFF32CD30),
              // ),
              // SizedBox(height: 20.ah,),
              Container(
                height: 154.ah,
                width: MediaQuery.of(context).size.width,
                decoration: const BoxDecoration(
                    //color: Color(0xFF32CD30),
                    //borderRadius: BorderRadius.only(bottomRight: Radius.circular(151))
                    image: DecorationImage(
                        fit: BoxFit.fill,
                        image: AssetImage(
                          'assets/image/Rectangle 4.png',
                        ))),
              ),

              Padding(
                padding: EdgeInsets.only(
                  left: 27.4.h,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.asset(
                      'assets/image/secur icon.png',
                      height: 58.ah,
                      width: 43.aw,
                    ),
                    SizedBox(width: 20.aw),
                    Text('SecurPoint',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 35.7.fSize,
                          fontFamily: 'adobe-garamond-pro',
                          fontWeight: FontWeight.w700,
                          letterSpacing: 1,
                        ))
                  ],
                ),
              )
            ],
          ),

          Padding(
            padding: EdgeInsets.only(left: 27.4.h, right: 25.9.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(height: 20.ah),
                Padding(
                  padding: EdgeInsets.only(left: 16.64.h, right: 53.4.h),
                  child: Text(
                    'OTP Verification',
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w600,
                        fontSize: 36.fSize),
                  ),
                ),
                SizedBox(height: 33.ah),
                Padding(
                  padding: EdgeInsets.only(left: 16.64.h, right: 117.h),
                  child: Text(
                    'A 4-digit code has been sent to \n ${widget.number}',
                    style: TextStyle(
                        fontFamily: 'Roboto',
                        height: 1.3.ah,
                        color: Color(0xff000000).withOpacity(0.50),
                        fontWeight: FontWeight.w600,
                        fontSize: 14.fSize),
                  ),
                ),
                SizedBox(height: 33.28.ah),
                Padding(
                  padding: EdgeInsets.only(left: 11.97.h, right: 11.97.h),
                  child: Pinput(
                    controller: textEditingController,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    length: 4,
                    defaultPinTheme: defaultPinTheme,
                    focusedPinTheme: defaultPinTheme.copyWith(
                      decoration: defaultPinTheme.decoration!.copyWith(
                        border: Border.all(
                          color: Color(0xffEDEDED),
                        ),
                      ),
                    ),
                    onCompleted: (pin) {
                      otp = pin;
                    },
                  ),
                ),
                SizedBox(height: 33.28.ah),
                Center(
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Didn’t receive OTP?   ',
                          style: TextStyle(
                            fontFamily: 'Roboto',
                            fontSize: 14.56.fSize,
                            fontWeight: FontWeight.w500,
                            color: Color(0xff000000),
                          ),
                        ),
                        InkWell(
                          onTap: () async {
                            if (_isButtonDisabled == false) {
                              textEditingController.text = "";
                              otp = "";
                              print("sdfg");
                              if (widget.isnumber) {
                                await ApiRepository.signUpWithPhoneNumber(
                                  number: widget.number,
                                );
                                startTimer();
                              } else {
                                await ApiRepository.signUpWithEmail(
                                  email: widget.number,
                                );
                                startTimer();
                              }
                            }
                          },
                          child: Text(
                            _isButtonDisabled == false
                                ? "Resend Otp"
                                : "Resend OTP in $_start",
                            style: TextStyle(
                              decoration: TextDecoration.underline,
                              fontFamily: 'Roboto',
                              fontSize: 14.56.fSize,
                              fontWeight: FontWeight.w500,
                              color: Color(0xFF32CD30),
                            ),
                          ),
                        ),
                      ]),
                )
              ],
            ),
          ),

          //SizedBox(height:30.ah),
          SizedBox(height: 33.28.ah),
          Spacer(),
          Padding(
            padding: EdgeInsets.only(left: 27.4.h, right: 25.91.h),
            child: Obx(
              () => CustomPrimaryBtn(
                title: 'Continue',
                isLoading: isLoading.value,
                onTap: () {
                  verifyOtpWithNumber();

                  // Get.to(Demo_deshboardPage());
                  //
                  // Navigator.push(context, MaterialPageRoute(builder: (context) => MainScreen()));
                },
              ),
            ),
          ),
          SizedBox(height: 80.ah),
        ],
      ),
    );
  }
}
