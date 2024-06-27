import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:securepoint/api_client/api_repository.dart';
import 'package:securepoint/core/constants/size.dart';
import 'package:securepoint/screen/forgot_password/forgot_password.dart';
import 'package:securepoint/screen/home_page/homescreen.dart';
import '../../const_iteam/const_textfile.dart';
import '../../const_iteam/custom_button.dart';
import '../signup_with_email/signup_with_email_screen.dart';


class LoginWithEmailScreen extends StatefulWidget {
  const LoginWithEmailScreen({super.key});

  @override
  State<LoginWithEmailScreen> createState() => _LoginWithEmailScreenState();
}

class _LoginWithEmailScreenState extends State<LoginWithEmailScreen> {

   var isLoading =false.obs;
   bool isEmail =true;
  login() async {
    isLoading(true);
   bool islogin = await ApiRepository.loginWithEmailPassword(email: emailPhoneTC.text, password: passwordTC.text,isEmail: isEmail);
    isLoading(false);
    if(islogin){
      Get.offAll(()=>HomeScreenNew());
   }
  }


  TextEditingController emailPhoneTC =TextEditingController();
  TextEditingController  passwordTC =TextEditingController();

  bool signCheck = false;
  bool isEye = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: CustomScrollView(
        slivers: [
          SliverFillRemaining(
            hasScrollBody: false,
            child: Padding(
              padding: EdgeInsets.only(left: 24.h,right: 24.h),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(height: 110.ah),
                    Center(child: SvgPicture.asset('assets/icon/ic_security_24px.svg',height: 35.ah,width:29.aw,)),

                    SizedBox(height:7.8.ah),
                    Center(
                      child: RichText(
                        text: TextSpan(
                            text: 'Secur',
                            style:TextStyle(fontFamily: 'adobe-garamond-pro',
                              fontSize:20.fSize,fontWeight: FontWeight.w400,color:const Color(0xFF2B2C2B),
                            ),
                            children: [
                              TextSpan(
                                text: 'Point',
                                style: TextStyle(fontFamily: 'adobe-garamond-pro',
                                  fontSize: 20.fSize,fontWeight: FontWeight.w400,color:const Color(0xFF525452),
                                ),)
                            ]),),

                    ),

                    SizedBox(height:94.14.ah),
                    Text('Sign in',
                      style: TextStyle(fontFamily: 'Roboto',
                        color:const Color(0xff6C6C6C),fontWeight: FontWeight.w400,fontSize:18.fSize,
                      ),
                    ),

                    SizedBox(height:34.ah),
                    primaryTextfieldSg(
                      hintText: 'Email/Phone', controller: emailPhoneTC,onChanged: (p0) {
                        String pattern = r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}$';
                        RegExp regex = RegExp(pattern);
                        if (!regex.hasMatch(p0)) {
                          isEmail =false;
                        }else{
                          print("ok");
                          isEmail =true;
                        }

                    },),
                    SizedBox(height:26.ah),
                    CustomTextFormField1(
                      obscureText: isEye,
                      hintText: 'Password',
                      controller: passwordTC,
                      hintStyle: TextStyle(
                          color: Color(0xff666666),fontFamily: 'Roboto',
                          fontWeight: FontWeight.w400,
                          fontSize: 12.fSize),
                      suffix:  InkWell(
                          onTap: () {
                            setState(() {
                              isEye = !isEye;
                            });
                          },
                          child: isEye? Icon(Icons.visibility_off_outlined,color: HexColor('#5E605E'),): Icon(Icons.visibility_outlined,color: HexColor('#5E605E'))),
                    ),


                    SizedBox(height:23.5.ah),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
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
                                borderRadius: BorderRadius.circular(3),
                                side: BorderSide(
                                    color:Color(0xFF000000).withOpacity(0.50),
                                    width: 1.aw
                                ),

                              ),
                              value: signCheck,
                              onChanged: ( value) {
                                setState(() {
                                  this.signCheck = value!;
                                });
                              },
                            ),

                            Text('  Remember me',
                              style: TextStyle(fontFamily: 'Roboto',
                                color: const Color(0xff9A9A9A),fontWeight: FontWeight.w400,fontSize:12.fSize,
                              ),
                            ),
                          ],
                        ),

                        InkWell(
                          onTap: () {
                            Get.to(()=>ForgotPasswordScreen());
                          },
                          child: Text('Forgot password?',
                            style: TextStyle(fontFamily: 'Roboto',
                              color: const  Color(0xff9A9A9A),fontWeight: FontWeight.w400,fontSize:12.fSize,
                            ),
                          ),
                        ),
                      ],
                    ),

                    SizedBox(height:32.ah),
                    Padding(
                      padding: EdgeInsets.only(left: 9.h,right: 9.h),
                      child: Center(
                        child: Obx(
                          ()=> CustomPrimaryBtn01(
                            title: 'Sign in',
                            isLoading: isLoading.value,
                            onTap: () {
                              login();
                              // Get.to(EditAssets());
                              // Navigator.push(context, MaterialPageRoute(builder: (context) => EditAssets()));

                            },),
                        ),
                      ),
                    ),

                    SizedBox(height:20.ah),
                    const  Spacer(),
                    InkWell(
                      onTap:()  {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => const SignupWithEmailScreen() ));
                      },
                      child: Center(
                        child: RichText(
                          text: TextSpan(
                              text: "Don't have an account?",
                              style:TextStyle( fontFamily: 'Times New Roman',
                                  fontSize:14.fSize,fontWeight: FontWeight.w400,color:const Color(0xff9A9A9A)
                              ),
                              children: [
                                TextSpan(
                                  text: ' Sign up',
                                  style: TextStyle(fontFamily: 'Times New Roman',
                                    fontSize: 14.fSize,fontWeight: FontWeight.w700,color:const Color(0xFF32CD30),
                                  ),)]),),
                      ),
                    ),

                    SizedBox(height:50.ah),
                  ]

              ),
            ),
          ),
        ],
      )
      ,
    );
  }
}
