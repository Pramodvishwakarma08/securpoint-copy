import 'package:expandable_text/expandable_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:securepoint/api_client/api_repository.dart';
import 'package:securepoint/screen/Widget/asset_card/custom_card_for_my_assets.dart';
import 'package:securepoint/screen/Widget/custom_image_view.dart';
import 'package:securepoint/core/constants/size.dart';
import 'package:securepoint/screen/dashboard_page/scaffold_layout.dart';
import '../../../core/utils/date_time_utils.dart';
import '../../../core/utils/obscureString.dart';
import '../../Widget/search_textfield_widget.dart';
import '../../add_assets/add_assets.dart';
import '../../my_assets_screen/my_assets_controller.dart';
import '../../notification_screen/notification_screen.dart';
import '../edit_profile/my_edit_profile.dart';
import 'ProfileModel.dart';

class MyProfileScreen extends StatefulWidget {
  const MyProfileScreen({super.key});

  @override
  State<MyProfileScreen> createState() => _MyProfileScreenState();
}

class _MyProfileScreenState extends State<MyProfileScreen> {
  MyAssetsController controller = Get.put(MyAssetsController());

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getProfile();
  }

  MyProfileModel? profileModel = MyProfileModel();
  var isLoading = false.obs;
  getProfile() async {
    isLoading(true);
    profileModel = await ApiRepository.getProfile();
    isLoading(false);
  }

  @override
  Widget build(BuildContext context) {
    final List<String> items = List.generate(20, (index) => 'Item $index');
    return ScaffoldLayout(
      activeIndex: 13,
      appBar: AppBar(
        leading: InkWell(
            onTap: () {
              Get.back();
            },
            child: const Icon(Icons.arrow_back_outlined,
                color: Color(0xFF6A6A6A))),
        title: Text(
          'My Profile',
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
                Get.to(()=>const NotificationScreen());
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
                child: CircularProgressIndicator(strokeWidth: 1),
              )
            : ListView(
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 27.aw, right: 27.aw),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 20.ah),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Padding(
                              padding: EdgeInsets.only(bottom: 10.v),
                              child: InkWell(
                                onTap: () {
                                  onTapEditProfile();
                                },
                                child: CustomImageView(
                                  height: 65.aw,
                                  width: 65.aw,
                                  imagePath: profileModel?.user?.avatarUrl ??
                                      "assets/image/img.png",
                                  radius: BorderRadius.circular(100),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            SizedBox(width: 10.aw),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              //mainAxisSize: MainAxisSize.min,
                              children: [
                                InkWell(
                                    onTap: () {
                                      onTapEditProfile();
                                    },
                                    child: Icon(
                                      Icons.edit,
                                      size: 20.adaptSize,
                                      color: const Color(0xff5E605E),
                                    )),
                                profileModel?.user?.nameStatus == 0
                                    ? hideProfileName()
                                    : unhideProfileName(),
                                SizedBox(width: 5.aw),
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
                                          text: '${"0"}  ',
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
                                                color:
                                                    const Color(0xff414853),
                                              ),
                                            )
                                          ]),
                                    ),
                                  ],
                                ),
                                SizedBox(height: 10.ah),
                                Row(
                                  children: [
                                    InkWell(
                                      onTap: () {
                                        Get.to(()=>AddAssetsScreen());
                                      },
                                      child: Container(
                                        width: 100.aw,
                                        height: 31.ah,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(8),
                                            border: Border.all(
                                              color: const Color(0xFF32CD30),
                                            )),
                                        child: Center(
                                          child: Text(
                                            'Add Asset',
                                            style: TextStyle(
                                                fontFamily: 'Roboto',
                                                color:
                                                    const Color(0xFF32CD30),
                                                fontWeight: FontWeight.w600,
                                                fontSize: 14.fSize),
                                          ),
                                        ),
                                      ),
                                    ),
                                    SizedBox(width: 8.aw),
                                    InkWell(
                                      onTap: () {
                                    //    Get.to(()=>const MessagesScreenNew1());
                                      },
                                      child: Container(
                                        width: 100.aw,
                                        height: 31.ah,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(8),
                                          color: const Color(0xFF32CD30),
                                        ),
                                        child: Center(
                                          child: Text(
                                            'Messages',
                                            style: TextStyle(
                                                fontFamily: 'Roboto',
                                                color: Colors.white,
                                                fontWeight: FontWeight.w600,
                                                fontSize: 14.fSize),
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
                            InkWell(
                                onTap: () {
                                  onTapEditProfile();
                                },
                                child: Icon(
                                  Icons.edit,
                                  color: const Color(0xff5E605E),
                                  size: 20.adaptSize,
                                ))
                          ],
                        ),
                        SizedBox(height: 2.ah),
                        Padding(
                          padding: EdgeInsets.only(right: 50.0.aw),
                          child: ExpandableText(
                            '${profileModel?.user?.notes}',
                            expandText: 'See more',
                            collapseText: 'See less',
                            style: TextStyle(
                              fontFamily: 'Roboto',
                              fontSize: 13.fSize,
                              letterSpacing: -0.41,
                              fontWeight: FontWeight.w400,
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
                              'My Assets',
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
                                        color: const Color(0xff111111)
                                            .withOpacity(0.50),
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
                        SizedBox(height: 16.ah),
                        Padding(
                          padding:  EdgeInsets.symmetric(horizontal: 5.0.aw),
                          child: serchTextField(
                            context: context,
                            controller: controller.searchController,
                            onChange: (p0) {
                              controller.getMyasset();
                              // _onSearchChanged();
                            },
                          ),
                        ),

                        SizedBox(height: 25.ah),
                        Padding(
                          padding: EdgeInsets.only(left: 20.aw),
                          child: Text(
                            "View all",
                            style: TextStyle(
                                fontFamily: 'Roboto',
                                decoration: TextDecoration.underline,
                                color:
                                    const Color(0xFF263238).withOpacity(0.70),
                                fontWeight: FontWeight.w500,
                                fontSize: 13.fSize),
                          ),
                        ),
                        SizedBox(height: 20.ah),
                      ],
                    ),
                  ),





                  Obx(
                    () => controller.isLoading.value
                        ? const Center(
                            child: CircularProgressIndicator(strokeWidth: 2,),
                          )
                        : GridView.builder(
                            shrinkWrap: true,
                            primary: false,
                            physics: const NeverScrollableScrollPhysics(),
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 2,
                                    mainAxisExtent: 248.ah,
                                    mainAxisSpacing: 21.ah,
                                    crossAxisSpacing: 14.aw),
                            itemCount: controller.myAssetsModel.assets?.length ?? 0,
                            itemBuilder: (context, index) {
                              return CustomCardForMyAsset(
                                assetDetailsModel: controller.myAssetsModel.assets![index],
                                index: index,
                              );
                            },
                          ),
                  ),
                  SizedBox(height: 10.ah),
                ],
              ),
      ),

      showFloatingActionButton: true,
    );
  }

  Widget hideProfileName() {
    return InkWell(
      onTap: () {
        ApiRepository.hideAndUnHide(nameStatus: "1");
        profileModel?.user?.nameStatus = 1;
        setState(() {});
      },
      child: Row(
        children: [
          Text(
            obscureString(profileModel?.user?.fullName ?? ""),
            style: TextStyle(
                color: const Color(0xFF6A6A6A),
                fontWeight: FontWeight.w500,
                fontSize: 15.fSize),
          ),
          SizedBox(width: 28.aw),
          Text(
            'Unhide',
            style: TextStyle(
                color: const Color(0xFF6A6A6A),
                fontWeight: FontWeight.w400,
                fontSize: 11.fSize),
          ),
          SizedBox(width: 5.aw),
          Icon(
            Icons.remove_red_eye,
            color: HexColor('#5E605E'),
            size: 14.adaptSize,
          )
        ],
      ),
    );
  }

  Widget unhideProfileName() {
    return InkWell(
      onTap: () {
        ApiRepository.hideAndUnHide(nameStatus: "0");
        profileModel?.user?.nameStatus = 0;
        setState(() {});
      },
      child: Row(
        children: [
          Text(
            profileModel?.user?.fullName ?? "",
            style: TextStyle(
                color: const Color(0xFF6A6A6A),
                fontWeight: FontWeight.w500,
                fontSize: 15.fSize),
          ),
          SizedBox(width: 28.aw),
          Text(
            'hide',
            style: TextStyle(
                color: const Color(0xFF6A6A6A),
                fontWeight: FontWeight.w400,
                fontSize: 11.fSize),
          ),
          SizedBox(width: 5.aw),
          Icon(
            Icons.visibility_off,
            color: HexColor('#5E605E'),
            size: 14.adaptSize,
          )
        ],
      ),
    );
  }

  onTapEditProfile(){
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) =>
                  EditProfileScreen(
                    fullName: profileModel
                        ?.user
                        ?.fullName ??
                        "",
                    email: profileModel
                        ?.user?.email ??
                        "",
                    phoneNumber: profileModel
                        ?.user?.phoneNo ??
                        "",
                    imageUrl: profileModel
                        ?.user
                        ?.avatarUrl ??
                        "",
                    notes: profileModel
                        ?.user?.notes ??
                        "",
                  ))).then((value) {
        getProfile();
      });

  }
}
