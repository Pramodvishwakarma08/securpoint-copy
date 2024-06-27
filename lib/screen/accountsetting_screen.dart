import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:securepoint/screen/confirm_delete_screen.dart';
import 'package:securepoint/screen/notification_preffrence.dart';
import 'package:securepoint/core/constants/size.dart';

import 'auth_and_onboard/profile/my_profile_screen.dart';

class AccountSettingScreen extends StatefulWidget {
  const AccountSettingScreen({super.key});

  @override
  State<AccountSettingScreen> createState() => _AccountSettingScreenState();
}

class _AccountSettingScreenState extends State<AccountSettingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(Icons.arrow_back_outlined,color: Color(0xFF6A6A6A))),
        title: Text('Account Settings',
          style: TextStyle(fontFamily: 'Inter',
              color: Color(0xFF6A6A6A),fontWeight: FontWeight.w600,fontSize:19.fSize
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,surfaceTintColor: Colors.white,shadowColor: Colors.black26,
        elevation: 3,
      ),

      body: Padding(
        padding:  EdgeInsets.only(left:20.h,right:20.h),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            SizedBox(height:24.ah),

              InkWell(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => Notification_Preference()));
                },
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    //SvgPicture.asset('assets/icon/Group 2247 (1).svg',height: 18.ah,width: 18.aw,),
                    SvgPicture.asset('assets/icon/bellicons.svg',height:18.ah,width:18.aw,fit: BoxFit.fill,color: Color(0xff4F4F4F),),
                    SizedBox(width: 22.aw),
                    InkWell(
                      child:Text('Notification Settings',
                        style: TextStyle( fontFamily: 'Roboto',
                            color: Color(0xff000000).withOpacity(0.70),fontWeight: FontWeight.w400,fontSize:12.fSize
                        ),
                      ),
                    )
                  ],
                ),
              ),

            SizedBox(height:20.ah),
            InkWell(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => MyProfileScreen())).then((value){

                });
              },
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  //SvgPicture.asset('assets/icon/Group 2247 (1).svg',height: 18.ah,width: 18.aw,),
                  SvgPicture.asset('assets/icon/mainaccount.svg',height:18.ah,width:18.aw,fit: BoxFit.fill,),
                  SizedBox(width: 20.aw),
                  InkWell(
                    child:Text('My Account',
                      style: TextStyle( fontFamily: 'Roboto',
                          color: Color(0xff000000).withOpacity(0.70),fontWeight: FontWeight.w400,fontSize:12.fSize
                      ),
                    ),
                  )
                ],
              ),
            ),


            SizedBox(height:20.ah),
            InkWell(
              onTap: () {
               // Navigator.push(context, MaterialPageRoute(builder: (context) => MyProfile_Screen()));
              },
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  //SvgPicture.asset('assets/icon/Group 2247 (1).svg',height: 18.ah,width: 18.aw,),
                  SvgPicture.asset('assets/icon/ic_payment_24px.svg',height:18.ah,width:18.aw,fit: BoxFit.fill,),
                  SizedBox(width: 17.aw),
                  InkWell(
                    child:Text('Payment Method',
                      style: TextStyle( fontFamily: 'Roboto',
                          color: Color(0xff000000).withOpacity(0.70),fontWeight: FontWeight.w400,fontSize:12.fSize
                      ),
                    ),
                  )
                ],
              ),
            ),

           SizedBox(height:20.ah),
           InkWell(
          onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => DeleteAccount_Screen()));
          },
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              //SvgPicture.asset('assets/icon/Group 2247 (1).svg',height: 18.ah,width: 18.aw,),
              SvgPicture.asset('assets/icon/Group 2247 (3).svg',height:18.ah,width:18.aw,fit: BoxFit.fill,),
              SizedBox(width: 22.aw),
              InkWell(

                child:Text('Delete Account',
                  style: TextStyle( fontFamily: 'Roboto',
                      color: Color(0xff000000).withOpacity(0.70),fontWeight: FontWeight.w400,fontSize:12.fSize
                  ),
                ),
              )
            ],
          ),
        )
          ],
        ),
      )
    );
  }
}
