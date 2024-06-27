import 'package:expandable_text/expandable_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:securepoint/api_client/api_repository.dart';
import 'package:securepoint/screen/Widget/CommonGridViewBuilder/common_gridview.dart';
import 'package:securepoint/screen/Widget/custom_image_view.dart';
import 'package:securepoint/core/constants/size.dart';
import '../../../core/utils/date_time_utils.dart';
import '../../notification_screen/notification_screen.dart';
import 'UserProfileModel.dart';

class UserProfileScreen extends StatefulWidget {
  final String userID;
  const UserProfileScreen({super.key, required this.userID});

  @override
  State<UserProfileScreen> createState() => _UserProfileScreenState();
}

class _UserProfileScreenState extends State<UserProfileScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getUserProfile(widget.userID);
  }

  GetUserByIdModel? profileModel = GetUserByIdModel();
  var isLoading = false.obs;
  getUserProfile(userId) async {
    isLoading(true);
    profileModel = await ApiRepository.getUserProfile(userId: userId);
    isLoading(false);
  }

  String obscureString(String input) {
    if (input.length <= 2) {
      return input;
    }
    String firstCharacter = input[0];
    String lastCharacter = input[input.length - 1];
    String middleAsterisks = '*' * (input.length - 2);

    return '$firstCharacter$middleAsterisks$lastCharacter';
  }

  @override
  Widget build(BuildContext context) {
    final List<String> items = List.generate(20, (index) => 'Item $index');
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: const Icon(Icons.arrow_back_outlined, color: Color(0xFF6A6A6A))),
        title: Text(
          'Profile',
          style: TextStyle(
              fontFamily: 'Inter',
              color: const Color(0xFF6A6A6A),
              fontWeight: FontWeight.w600,
              fontSize: 19.fSize),
        ),
        centerTitle: true,
        actions: [
          InkWell(
              onTap: () {
                Get.to(()=>NotificationScreen());
              },
              child: SvgPicture.asset(
                'assets/icon/Icon.svg',
                height: 22.ah,
                width: 22.aw,
              )),
          SizedBox(width: 30.aw),
          SvgPicture.asset(
            'assets/icon/Union (1).svg',
            height: 22.ah,
            width: 22.aw,
          ),
          SizedBox(width: 20.aw),
        ],
        backgroundColor: Colors.white,
        surfaceTintColor: Colors.white,
        shadowColor: Colors.black26,
        elevation: 3,
      ),
      body: Obx(
        () => isLoading.value
            ? const Center(
                child: CircularProgressIndicator(strokeWidth: 2,),
              )
            : ListView(
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 17.h, right: 17.h),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 20.ah),
                        Padding(
                          padding: EdgeInsets.only(left: 13.h, right: 20.h),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              CustomImageView(
                                height: 65.aw,
                                width: 65.aw,
                                imagePath: profileModel?.user?.avatarUrl ??
                                    "assets/image/img.png",
                                radius: BorderRadius.circular(100),
                                fit: BoxFit.cover,
                              ),
                              SizedBox(width: 10.aw),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    obscureString(
                                        profileModel?.user?.fullName?.name ?? "*******"),
                                    style: TextStyle(
                                        color: const Color(0xFF6A6A6A),
                                        fontWeight: FontWeight.w500,
                                        fontSize: 15.fSize),
                                  ),
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      SvgPicture.asset(
                                        'assets/icon/Vector (5).svg',
                                        height: 12.ah,
                                        width: 12.aw,
                                      ),
                                      SizedBox(width: 10.aw),
                                      Text(
                                        'SecurPoint user since ${formatToMonthYear(profileModel!.user!.createdAt!)}',
                                        style: TextStyle(
                                            fontFamily: 'Roboto',
                                            color: const Color(0xff414853),
                                            fontWeight: FontWeight.w400,
                                            fontSize: 12.fSize),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      RichText(
                                        text: TextSpan(
                                            text:
                                                '${"0"}  ',
                                            style: TextStyle(
                                              fontSize: 14.fSize,
                                              fontWeight: FontWeight.w400,
                                              color: const Color(0xFF32CD30),
                                            ),
                                            children: [
                                              TextSpan(
                                                text: ' Active listings',
                                                style: TextStyle(
                                                  fontFamily: 'Roboto',
                                                  fontSize: 13.fSize,
                                                  fontWeight: FontWeight.w400,
                                                  color: const Color(0xff414853),
                                                ),
                                              )
                                            ]),
                                      ),
                                      const SizedBox(
                                        width: 20,
                                      ),
                                      Row(
                                        children: [
                                          Text(
                                            'Report this profile ',
                                            style: TextStyle(
                                                fontFamily: 'Roboto',
                                                height: 1.ah,
                                                color: const Color(0xFF4F4F4F)
                                                    .withOpacity(0.70),
                                                fontWeight: FontWeight.w400,
                                                fontSize: 11.fSize),
                                          ),
                                          Icon(
                                            Icons.info,
                                            color: const Color(0xFF4F4F4F)
                                                .withOpacity(0.70),
                                            size: 10,
                                          )
                                        ],
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 8.ah),
                                  Row(
                                    children: [
                                      SizedBox(width: 8.aw),
                                      InkWell(
                                        onTap: () {
                                        //   Navigator.push(
                                        //       context,
                                        //       MaterialPageRoute(
                                        //           builder: (context) =>
                                        //               const MessagesScreenNew1()));
                                        },
                                        child: Container(
                                          width: 180.aw,
                                          height: 30.ah,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(8),
                                            color: const Color(0xFF32CD30),
                                          ),
                                          child: Center(
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Image.asset(
                                                  "assets/image/msg_icon.png",
                                                  height: 20,
                                                ),
                                                const SizedBox(
                                                  width: 10,
                                                ),
                                                Text(
                                                  'Messages',
                                                  style: TextStyle(
                                                      fontFamily: 'Roboto',
                                                      color: Colors.white,
                                                      fontWeight:
                                                          FontWeight.w600,
                                                      fontSize: 14.fSize),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 47.ah),
                        Row(
                          children: [
                            Text(
                              "Owner’s Note",
                              style: TextStyle(
                                  letterSpacing: -0.41,
                                  fontFamily: 'Roboto',
                                  color: const Color(0xFF5E605E),
                                  fontWeight: FontWeight.w600,
                                  fontSize: 14.fSize),
                            ),
                            SizedBox(
                              width: 5.aw,
                            ),
                          ],
                        ),
                        SizedBox(height: 2.ah),
                        Padding(
                          padding: EdgeInsets.only(right: 50.0.aw),
                          child: ExpandableText(
                            '${profileModel?.user?.notes ?? ""}',
                            expandText: 'See more',
                            collapseText: 'See less',
                            style: TextStyle(
                              fontFamily: 'Roboto',
                              fontSize: 13.fSize,
                              fontWeight: FontWeight.w400,
                              letterSpacing: -0.41,
                              color: const Color(0xFF0000000).withOpacity(0.50),
                            ),
                            maxLines: 3,
                            linkColor: Color(0xFF32CD30),
                          ),
                        ),
                        SizedBox(height: 31.ah),
                        Row(
                          // mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'This User’s Assets',
                              style: TextStyle(
                                  fontFamily: 'Roboto',
                                  color: const Color(0xff5E605E),
                                  fontWeight: FontWeight.w600,
                                  fontSize: 15.fSize),
                            ),
                            InkWell(
                              onTap: () {
                                // Navigator.push(context, MaterialPageRoute(builder: (context) => Populars_Allcity()));
                              },
                              child: Row(
                                children: [
                                  Text(
                                    'Share',
                                    style: TextStyle(
                                        fontFamily: 'Roboto',
                                        color:
                                            const Color(0xff111111).withOpacity(0.50),
                                        fontWeight: FontWeight.w400,
                                        fontSize: 14.fSize),
                                  ),
                                  SizedBox(width: 6.aw),
                                  const Icon(Icons.share,
                                      size: 20, color: Color(0xFF6A6A6A))
                                ],
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 12.ah),
                        Center(
                          child: Card(
                            color: Colors.white,
                            // shadowColor: Colors.xblack,
                            surfaceTintColor: Colors.white,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(43),
                                side: BorderSide(
                                    color: const Color(0xffEBEBEB), width: 1.aw)),
                            elevation: 3,
                            child: Container(
                              // width: 293,
                              width: MediaQuery.of(context).size.width,
                              height: 52.ah,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                color: Colors.white70,
                                borderRadius: BorderRadius.circular(43),
                              ),
                              child: TextField(
                                cursorColor: const Color(0xFF000000),
                                style: const TextStyle(color: Colors.black),
                                decoration: InputDecoration(
                                    contentPadding:
                                        EdgeInsets.all(15.adaptSize),
                                    prefixIcon: //Image.asset('assets/images/seearch.png',),
                                        //Icon(Icons.search, color: Colors.grey,),
                                        Padding(
                                      padding: const EdgeInsets.all(13.0),
                                      child: SvgPicture.asset(
                                        'assets/icon/Icon (1).svg',
                                        height: 6.ah,
                                        width: 6.8.aw,
                                      ),
                                    ),
                                    hintText: "Search Assets",
                                    hintStyle: TextStyle(
                                        fontFamily: 'Roboto',
                                        color:
                                            const Color(0xff000000).withOpacity(0.30),
                                        fontSize: 16.fSize,
                                        fontWeight: FontWeight.w400),
                                    border: InputBorder.none),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 38.ah),
                        Padding(
                          padding: EdgeInsets.only(left: 10.h),
                          child: Text(
                            "View all",
                            style: TextStyle(
                                fontFamily: 'Roboto',
                                decoration: TextDecoration.underline,
                                color: const Color(0xFF263238).withOpacity(0.70),
                                fontWeight: FontWeight.w500,
                                fontSize: 13.fSize),
                          ),
                        ),
                        SizedBox(height: 20.ah),
                      ],
                    ),
                  ),
                  GridViewBuilderCommonAssetCard(assets: profileModel!.user!.asset!),
                  SizedBox(height: 10.ah),
                ],
              ),
      ),
    );
  }
}
