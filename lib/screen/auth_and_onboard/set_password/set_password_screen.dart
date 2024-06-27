import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:securepoint/api_client/api_repository.dart';
import 'package:securepoint/core/constants/app_dialogs.dart';
import 'package:securepoint/core/constants/size.dart';

import '../../const_iteam/const_textfile.dart';
import '../../const_iteam/custom_button.dart';
import '../login/login_with_email.dart';
import '../signup_with_email/signup_with_email_screen.dart';


class SetPasswordScreen extends StatefulWidget {
  final String email;
  final bool isnumber;
  const SetPasswordScreen({super.key,required this.email,required this.isnumber});

  @override
  State<SetPasswordScreen> createState() => _SetPasswordScreenState();
}

class _SetPasswordScreenState extends State<SetPasswordScreen> {

  var isLoading =false.obs;
  setPassWord() async {
    isLoading(true);
    bool islogin =await ApiRepository.setPassWord(email: widget.email, password: passwordTC.text, isnumber: widget.isnumber,);
    isLoading(false);
    if(islogin){
      Navigator.push(context, MaterialPageRoute(builder: (context) => const LoginWithEmailScreen()));
    }
  }


  TextEditingController passwordTC =TextEditingController();
  TextEditingController  cPasswordTC =TextEditingController();

  bool signCheck = false;
  bool isEyePassword = true;
  bool isEyeCPassword = true;
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
                              fontSize:20.fSize,fontWeight: FontWeight.w400,color: Color(0xFF2B2C2B),
                            ),
                            children: [
                              TextSpan(
                                text: 'Point',
                                style: TextStyle(fontFamily: 'adobe-garamond-pro',
                                  fontSize: 20.fSize,fontWeight: FontWeight.w400,color:Color(0xFF525452),
                                ),)
                            ]),),

                    ),

                    SizedBox(height:94.14.ah),
                    Text('Create Password',
                      style: TextStyle(fontFamily: 'Roboto',
                        color: Color(0xff6C6C6C),fontWeight: FontWeight.w400,fontSize:18.fSize,
                      ),
                    ),

                    SizedBox(height:34.ah),
                    CustomTextFormField1(
                      obscureText: isEyePassword,
                      hintText: 'Enter Password',
                      controller: passwordTC,
                      hintStyle: TextStyle(
                          color: Color(0xff666666),fontFamily: 'Roboto',
                          fontWeight: FontWeight.w400,
                          fontSize: 12.fSize),
                      //contentPadding: const EdgeInsets.only(left: 10,right: 10),
                      suffix:  InkWell(
                          onTap: () {
                            isEyePassword = !isEyePassword;
                            setState(() {
                              //  isEye = !isEye;
                            });
                          },
                          child: isEyePassword? Icon(Icons.visibility_off_outlined,color: HexColor('#5E605E'),): Icon(Icons.visibility_outlined,color: HexColor('#5E605E'))),
                    ),
                    // SizedBox(height:26.ah),
                    // primaryTextfieldSg(hintText: 'Password', controller: null),

                    SizedBox(height:26.ah),
                    CustomTextFormField1(
                      obscureText: isEyeCPassword,
                      hintText: 'Re Enter Password',
                      controller: cPasswordTC,
                      hintStyle: TextStyle(
                          color: Color(0xff666666),fontFamily: 'Roboto',
                          fontWeight: FontWeight.w400,
                          fontSize: 12.fSize),
                      //contentPadding: const EdgeInsets.only(left: 10,right: 10),
                      suffix:  InkWell(
                          onTap: () {
                            isEyeCPassword = !isEyeCPassword;
                            setState(() {
                              //  isEye = !isEye;
                            });
                          },
                          child: isEyeCPassword? Icon(Icons.visibility_off_outlined,color: HexColor('#5E605E'),): Icon(Icons.visibility_outlined,color: HexColor('#5E605E'))),
                    ),

                    SizedBox(height:23.5.ah),
                    SizedBox(height:32.ah),
                    Padding(
                      padding: EdgeInsets.only(left: 9.h,right: 9.h),
                      child: Center(
                        child: Obx(
                              ()=> CustomPrimaryBtn01(
                            title: 'Create Password',
                            isLoading: isLoading.value,
                            onTap: () {
                              if(passwordTC.text == cPasswordTC.text){
                                setPassWord();
                              }else{
                                AppDialog.taostMessage("Password not match");
                              }
                              // Get.to(EditAssets());
                              // Navigator.push(context, MaterialPageRoute(builder: (context) => EditAssets()));

                            },),
                        ),
                      ),
                    ),

                    SizedBox(height:20.ah),

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
