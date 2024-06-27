
import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:securepoint/core/utils/pref_utils.dart';
import 'package:securepoint/screen/Widget/custom_image_view.dart';
import 'package:securepoint/screen/accountsetting_screen.dart';
import 'package:securepoint/screen/my_assets_screen/my_assets_screen.dart';
import 'package:securepoint/screen/premium_plan/premium_screen.dart';
import 'package:securepoint/screen/saved_assets/save_assets.dart';
import 'package:securepoint/core/constants/size.dart';
import '../../api_client/api_repository.dart';
import '../../core/utils/date_time_utils.dart';
import '../../core/utils/obscureString.dart';
import '../about_screen.dart';
import '../add_assets/add_assets.dart';
import '../auth_and_onboard/login/login_with_email.dart';
import '../auth_and_onboard/profile/ProfileModel.dart';
import '../auth_and_onboard/profile/my_profile_screen.dart';
import '../faq_screen.dart';

class DrawerScreen extends StatefulWidget {
  const DrawerScreen({super.key});

  @override
  State<DrawerScreen> createState() => _DrawerScreenState();
}

class _DrawerScreenState extends State<DrawerScreen> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getProfile();
  }

  MyProfileModel ? profileModel  = MyProfileModel();
  var isLoading =false.obs;
  getProfile() async {
    isLoading(true);
    profileModel = await  ApiRepository.getProfile();
    isLoading(false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: InkWell(
            onTap: () {
              Get.back();
            },
            child:const Icon(Icons.arrow_back_outlined,color: Color(0xFF6A6A6A))),
        backgroundColor: Colors.white,surfaceTintColor: Colors.white,shadowColor: Colors.black26,
        elevation: 3,
      ),

      body: Obx(
          ()=> isLoading.value ?const Center(child: CircularProgressIndicator(strokeWidth: 2,),) : Padding(
          padding:  EdgeInsets.only(left:19.5.h,right:19.5.h),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(height: 34.5.ah),
                Padding(
                  padding:  EdgeInsets.only(right:20.h),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(profileModel?.user?.nameStatus == 0 ? obscureString("${profileModel?.user?.fullName}") : profileModel?.user?.fullName ?? "",
                            style: TextStyle(
                                color: Color(0xFF6A6A6A),fontWeight: FontWeight.w500,fontSize:13.fSize
                            ),
                          ),
                          Text('SecurPoint user since ${formatToMonthYear(profileModel!.user!.createdAt!)}',
                            style: TextStyle(
                                color: Color(0xFF000000),fontWeight: FontWeight.w400,fontSize:10.fSize
                            ),
                          ),
                        ],
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => MyProfileScreen())).then((value) {
                            getProfile();
                          });
                        },
                        child: CustomImageView(
                          height: 59.ah,
                          width: 59.ah,
                          imagePath: profileModel?.user?.avatarUrl,
                          radius:  BorderRadius.circular(100),
                        ),
                      ),
                    ],
                  ),
                ),

                SizedBox(height:20.ah),
                Row(
                  children: [
                    Text("Get SecurPoint",
                      style: TextStyle(
                        fontSize: 13.fSize,fontWeight: FontWeight.w500,color:Color(0xFF000000).withOpacity(0.50),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(bottom: 7.v),
                      child: Text("+",
                        style: TextStyle(
                            color:Color(0xFF32CD30),fontWeight: FontWeight.w400,fontSize:12.fSize
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 21.ah),
                Padding(
                  padding: EdgeInsets.only(left: 12.h,right: 12.h),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    //mainAxisSize: MainAxisSize.min,
                    children: [
                      //SizedBox(width: 20.aw),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          SvgPicture.asset('assets/icon/Vector.svg',height: 34.ah,width: 34.ah,),
                          SizedBox(height: 10.ah),
                          Text('Lorem ipsum dolor sit\n    amet, consectetur',
                            style: TextStyle(fontFamily: 'Roboto', color: Color(0xff000000).withOpacity(0.50),
                                fontWeight: FontWeight.w400,fontSize:9.fSize
                            ),
                          ),
                        ],
                      ),

                      //SizedBox(width: 20.aw),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          SvgPicture.asset('assets/icon/Vector (1).svg',height: 34.ah,width: 34.ah,),
                          SizedBox(height: 10.ah),
                          Text('Lorem ipsum dolor sit\n    amet, consectetur',
                            style: TextStyle(fontFamily: 'Roboto', color: Color(0xff000000).withOpacity(0.50),
                                fontWeight: FontWeight.w400,fontSize:9.fSize
                            ),
                          ),
                        ],
                      ),

                      //SizedBox(width:20.aw),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          SvgPicture.asset('assets/icon/Star 1.svg',height: 34.ah,width: 34.ah,),
                          SizedBox(height: 10.ah),
                          Text('Lorem ipsum dolor sit\n    amet, consectetur',
                            style: TextStyle(fontFamily: 'Roboto', color: Color(0xff000000).withOpacity(0.50),
                                fontWeight: FontWeight.w400,fontSize:9.fSize
                            ),
                          ),
                        ],
                      ),


                    ],
                  ),
                ),

                SizedBox(height:22.ah),
                Padding(
                  padding:  EdgeInsets.only(left:13.h,right:13.h),
                  child: InkWell(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => PremiumScreen(),));
                    },
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      height: 107.ah,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: Color(0xFF32CD30),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text('Get your premium plan today!',
                              style: TextStyle(fontFamily: 'Roboto',
                                  color: Color(0xffFFFFFF),fontWeight: FontWeight.w500,
                                  fontSize:13.fSize
                              ),
                            ),
                            //SizedBox(height: 6.ah),
                            Text("It's optional for you.",
                              style: TextStyle(fontFamily: 'Roboto', color: Color(0xffFFFFFF),fontWeight: FontWeight.w500,fontSize:10.fSize
                              ),
                            ),
                            SizedBox(height:10.ah),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  width:142.aw,height:34.ah,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(40),
                                      color: Colors.white
                                  ),
                                  child:  Center(
                                    child: Text('Access more for less',
                                      style: TextStyle(fontFamily: 'Roboto',
                                          color: Color(0xFF32CD30),fontWeight: FontWeight.w400,fontSize:13.fSize
                                      ),
                                    ),
                                  ),
                                ),

                                Align(
                                  alignment: Alignment.bottomRight,
                                  child: Row(
                                    children: [
                                      Text("SecurPoint",
                                        style: TextStyle(
                                            color: Colors.white,fontWeight: FontWeight.w400,fontSize:16.fSize
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(bottom: 7.v),
                                        child: Text("+",
                                          style: TextStyle(
                                              color: Colors.white,fontWeight: FontWeight.w400,fontSize:12.fSize
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),

                          ],
                        ),
                      ),
                    ),
                  ),
                ),

                SizedBox(height:25.ah),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SvgPicture.asset('assets/icon/addasse.svg',height: 18.ah,width: 18.aw,),
                    SizedBox(width: 20.aw),
                    //color: Color(0xff4F4F4F),
                    InkWell(
                      onTap: () {
                        Get.to(()=>const AddAssetsScreen());
                      },
                      child: Text('Add Assets',
                        style: TextStyle( fontFamily: 'Roboto',
                            color:const Color(0xff000000).withOpacity(0.70),fontWeight: FontWeight.w400,fontSize:12.fSize
                        ),
                      ),
                    ),
                  ],
                ),

                SizedBox(height:20.ah),
                InkWell(
                  onTap: () {
                    Get.to(()=>const MyAssetsScreen());
                   // Navigator.push(context, MaterialPageRoute(builder: (context) => MYAsset_Details()));
                  },
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      SvgPicture.asset('assets/icon/yenicon.svg',height:20.ah,width: 18.aw,),
                      SizedBox(width: 20.aw),
                      InkWell(

                        child: Text('Your Assets',
                          style: TextStyle( fontFamily: 'Roboto',
                              color: Color(0xff000000).withOpacity(0.70),fontWeight: FontWeight.w400,fontSize:12.fSize
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                SizedBox(height:20.ah),
                InkWell(
                  onTap: () {
                    Get.to(()=>const SavedAssets());
                  },
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      SvgPicture.asset('assets/icon/Group 2247 (1).svg',height: 18.ah,width: 18.aw,),
                      SizedBox(width: 20.aw),
                      InkWell(
                        child: Text('Saved Assets',
                          style: TextStyle( fontFamily: 'Roboto',
                              color: Color(0xff000000).withOpacity(0.70),fontWeight: FontWeight.w400,fontSize:12.fSize
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                SizedBox(height:20.ah),
                Padding(
                  padding:  EdgeInsets.only(right:25.h),
                  child: DottedLine(
                    direction: Axis.horizontal,
                    alignment: WrapAlignment.center,
                    lineLength: double.infinity,
                    lineThickness: 1.0,
                    dashLength: 2.0,
                    dashColor: Color(0xffCECECE),
                    dashRadius: 1.0,
                    dashGapLength: 1.0,
                    dashGapColor: Colors.transparent,
                    dashGapRadius: 1.0,
                  ),
                ),

                SizedBox(height:19.ah),
                InkWell(
                  onTap: () {
                   // Navigator.push(context, MaterialPageRoute(builder: (context) => SearchNoData_screen()));
                    Navigator.push(context, MaterialPageRoute(builder: (context) => AccountSettingScreen()));
                  },
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      SvgPicture.asset('assets/icon/Group 2247 (2).svg',height: 18.ah,width: 18.aw,),
                      SizedBox(width: 20.aw),
                      InkWell(
                        child: Text('Account Settings',
                          style: TextStyle( fontFamily: 'Roboto',
                              color: Color(0xff000000).withOpacity(0.70),fontWeight: FontWeight.w400,fontSize:12.fSize
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                SizedBox(height:19.ah),
                InkWell(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => PremiumScreen(),));
                  },
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      SvgPicture.asset('assets/icon/ic_security_24px (2).svg',height: 18.ah,width: 18.aw,),
                      SizedBox(width: 20.aw),
                      Row(
                        children: [
                          Text("Get SecurPoint",
                            style: TextStyle(
                              fontSize: 13.fSize,fontWeight: FontWeight.w500,color:Color(0xFF000000).withOpacity(0.50),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(bottom: 7.v),
                            child: Text("+",
                              style: TextStyle(
                                  color:Color(0xFF000000).withOpacity(0.50),fontWeight: FontWeight.w400,fontSize:12.fSize
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),


                SizedBox(height:19.ah),
                Padding(
                  padding:  EdgeInsets.only(right:25.h),
                  child: DottedLine(
                    direction: Axis.horizontal,
                    alignment: WrapAlignment.center,
                    lineLength: double.infinity,
                    lineThickness: 1.0,
                    dashLength: 2.0,
                    dashColor: Color(0xffCECECE),
                    dashRadius: 1.0,
                    dashGapLength: 1.0,
                    dashGapColor: Colors.transparent,
                    dashGapRadius: 1.0,
                  ),
                ),

                SizedBox(height:19.ah),
                Text('Support',
                  style: TextStyle( fontFamily: 'Roboto',
                      color: Color(0xff000000),fontWeight: FontWeight.w400,fontSize:12.fSize
                  ),
                ),
                SizedBox(height:14.ah),
                InkWell(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => FAQ()));
                  },
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      SvgPicture.asset('assets/icon/ic_live_help_24px.svg',height: 18.ah,width: 18.aw,),
                      SizedBox(width: 20.aw),
                      InkWell(
                        child:Text('FAQs & Help Centre',
                          style: TextStyle( fontFamily: 'Roboto',
                              color: Color(0xff000000).withOpacity(0.70),fontWeight: FontWeight.w400,fontSize:12.fSize
                          ),
                        ),
                      )
                    ],
                  ),
                ),

                SizedBox(height:14.ah),

                InkWell(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => AboutScreen()));
                  },
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      SvgPicture.asset('assets/icon/ic_error_24px.svg',height: 18.ah,width: 18.aw,),
                      SizedBox(width: 20.aw),
                      InkWell(

                        child:Text('About this app',
                          style: TextStyle( fontFamily: 'Roboto',
                              color: Color(0xff000000).withOpacity(0.70),fontWeight: FontWeight.w400,fontSize:12.fSize
                          ),
                        ),
                      )
                    ],
                  ),
                ),

                SizedBox(height:19.ah),
                Padding(
                  padding:  EdgeInsets.only(right:25.h),
                  child: DottedLine(
                    direction: Axis.horizontal,
                    alignment: WrapAlignment.center,
                    lineLength: double.infinity,
                    lineThickness: 1.0,
                    dashLength: 2.0,
                    dashColor: Color(0xffCECECE),
                    dashRadius: 1.0,
                    dashGapLength: 1.0,
                    dashGapColor: Colors.transparent,
                    dashGapRadius: 1.0,
                  ),
                ),

                SizedBox(height:19.ah),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    //Icon(Icons.share),
                    SvgPicture.asset('assets/icon/share_24px (1).svg',height: 18.ah,width: 18.aw,color: Color(0xff32CD30),),
                    SizedBox(width: 20.aw),
                    Text('Share SecurPoint with your friends',
                      style: TextStyle( fontFamily: 'Roboto',
                          color: Color(0xff000000).withOpacity(0.70),fontWeight: FontWeight.w400,fontSize:12.fSize
                      ),
                    ),
                  ],
                ),

                SizedBox(height:19.ah),
                InkWell(
                  onTap: () {
                //    Navigator.push(context, MaterialPageRoute(builder: (context) => SignInScreen()));
                  },
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      SvgPicture.asset('assets/icon/logout (1).svg',height: 18.ah,width: 18.aw, color:Color(0xffC60000)),
                      SizedBox(width: 20.aw),
                      InkWell(
                        onTap: () {
                          Get.offAll(()=>LoginWithEmailScreen());
                          PrefUtils().logout();
                        },

                        child: Text('Log out',
                          style: TextStyle( fontFamily: 'Roboto',
                              color: Color(0xff000000).withOpacity(0.70),fontWeight: FontWeight.w400,fontSize:12.fSize
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                SizedBox(height: 20.ah),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
