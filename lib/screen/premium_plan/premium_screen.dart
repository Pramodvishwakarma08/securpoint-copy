import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:securepoint/api_client/api_client.dart';
import 'package:securepoint/api_client/api_repository.dart';
import 'package:securepoint/core/constants/size.dart';
import 'package:securepoint/screen/premium_plan/premium_screen_controller.dart';
import 'package:securepoint/screen/premium_plan/sucfull_page.dart';
import '../const_iteam/custom_button.dart';
import 'PremiumPlanModel.dart';
import 'PurchasePlanModel.dart';
import 'go_to_strip_page.dart';

class PremiumScreen extends StatefulWidget {
  const PremiumScreen({super.key});

  @override
  State<PremiumScreen> createState() => _PremiumScreenState();
}

class _PremiumScreenState extends State<PremiumScreen> {
  PremiumScreenController controller = Get.put(PremiumScreenController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(Icons.arrow_back_outlined, color: Color(0xFF6A6A6A))),
        title: Text(
          'Premium',
          style: TextStyle(
              fontFamily: 'Inter',
              color: Color(0xFF6A6A6A),
              fontWeight: FontWeight.w600,
              fontSize: 19.fSize),
          /*style: TextStyle(fontFamily: 'Inter',
              color: Color(0xFF6A6A6A),fontWeight: FontWeight.w600,fontSize:15.fSize
          ),*/
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        surfaceTintColor: Colors.white,
        shadowColor: Colors.black26,
        elevation: 3,
      ),
      body: Padding(
        padding: EdgeInsets.only(left: 30.h, right: 33.h),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          //mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(height: 23.ah),
            Center(
                child: SvgPicture.asset(
              'assets/icon/ic_security_24px.svg',
              height: 77.6.ah,
              width: 58.6.aw,
            )),
            SizedBox(height: 15.ah),
            Center(
              child: RichText(
                text: TextSpan(
                    text: 'Secur',
                    style: TextStyle(
                      fontFamily: 'adobe-garamond-pro',
                      fontSize: 30.fSize,
                      fontWeight: FontWeight.w400,
                      color: Color(0xFF2B2C2B),
                    ),
                    children: [
                      TextSpan(
                        text: 'Point+',
                        style: TextStyle(
                          fontFamily: 'adobe-garamond-pro',
                          fontSize: 30.fSize,
                          fontWeight: FontWeight.w400,
                          color: Color(0xFF525452),
                        ),
                      )
                    ]),
              ),
              //Text('SecurPoint +',
              //   style: TextStyle(fontFamily: 'Times New Roman',
              //       color: Colors.black,fontWeight: FontWeight.w400,fontSize:30
              //   ),
              // ),
            ),
            SizedBox(height: 15.ah),
            Center(
              child: Container(
                width: 327.aw,
                height: 279.ah,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(13),
                    border: Border.all(color: Color(0xffCDCDCD), width: 1.aw)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SizedBox(
                      height: 32.ah,
                    ),
                    Text(
                      'Benefits',
                      style: TextStyle(
                          color: Color(0xff32CD30),
                          fontWeight: FontWeight.w600,
                          fontSize: 14.fSize),
                    ),
                    SizedBox(
                      height: 20.ah,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Column(
                              children: [
                                Container(
                                  height: 46.ah,
                                  width: 46.aw,
                                  decoration: BoxDecoration(
                                      color: Color(0xff4AB848),
                                      shape: BoxShape.circle),
                                  child: Center(
                                      child: SvgPicture.asset(
                                    'assets/icon/Vector (3).svg',
                                    height: 20.ah,
                                    width: 20.aw,
                                    fit: BoxFit.fill,
                                  )),
                                ),
                                SizedBox(
                                  height: 10.ah,
                                ),
                                Text(
                                  'In-app messaging/\n    contact owner',
                                  style: TextStyle(
                                      height: 1.ah,
                                      fontFamily: 'Roboto',
                                      color: Color(0xff000000),
                                      fontWeight: FontWeight.w400,
                                      fontSize: 13.fSize),
                                ),
                              ],
                            ),
                            SizedBox(height: 20.ah),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SizedBox(width: 45.aw),
                                Container(
                                  height: 46.ah,
                                  width: 46.aw,
                                  decoration: BoxDecoration(
                                      color: Color(0xff4AB848),
                                      shape: BoxShape.circle),
                                  child: Center(
                                      child: SvgPicture.asset(
                                    'assets/icon/Report asset.svg',
                                    height: 20.ah,
                                    width: 20.aw,
                                  )),
                                ),
                                SizedBox(
                                  height: 10.ah,
                                ),
                                Text(
                                  'Report\nassets',
                                  style: TextStyle(
                                      height: 1.ah,
                                      fontFamily: 'Roboto',
                                      color: Color(0xff000000),
                                      fontWeight: FontWeight.w400,
                                      fontSize: 13.fSize),
                                ),
                              ],
                            ),
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Column(
                              children: [
                                Container(
                                  height: 46.ah,
                                  width: 46.aw,
                                  decoration: BoxDecoration(
                                      color: Color(0xff4AB848),
                                      shape: BoxShape.circle),
                                  child: Center(
                                      child: SvgPicture.asset(
                                    'assets/icon/Vector (4).svg',
                                    height: 20.ah,
                                    width: 20.aw,
                                    fit: BoxFit.fill,
                                  )),
                                ),
                                SizedBox(
                                  height: 10.ah,
                                ),
                                Text(
                                  'Initiate chats/\n    contacts',
                                  style: TextStyle(
                                      height: 1.ah,
                                      fontFamily: 'Roboto',
                                      color: Color(0xff000000),
                                      fontWeight: FontWeight.w400,
                                      fontSize: 13.fSize),
                                ),
                              ],
                            ),
                            SizedBox(height: 20.ah),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SizedBox(width: 45.aw),
                                Container(
                                  height: 46.ah,
                                  width: 46.aw,
                                  decoration: const BoxDecoration(
                                      color: Color(0xff4AB848),
                                      shape: BoxShape.circle),
                                  child: Center(
                                      child: SvgPicture.asset(
                                    'assets/icon/Unlimited assets listings.svg',
                                    height: 24.ah,
                                    width: 24.aw,
                                    fit: BoxFit.fill,
                                  )),
                                ),
                                SizedBox(
                                  height: 10.ah,
                                ),
                                Text(
                                  'Unlimited assets\n        listings',
                                  style: TextStyle(
                                      height: 1.ah,
                                      fontFamily: 'Roboto',
                                      color: Color(0xff000000),
                                      fontWeight: FontWeight.w400,
                                      fontSize: 13.fSize),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20.ah,
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 25.ah),
            Padding(
              padding: EdgeInsets.only(left: 7.h, right: 7.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    ' Choose subscription plan for',
                    style: TextStyle(
                      fontFamily: 'Roboto',
                      color: Color(0xff000000),
                      fontWeight: FontWeight.w500,
                      fontSize: 13.fSize,
                    ),
                  ),
                  SizedBox(height: 10.ah),
                  Obx(
                    () => controller.isLoading.value
                        ? Container()
                        : Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.start,
                            //mainAxisSize: MainAxisSize.min,
                            children: [
                              Expanded(
                                child: DropdownButtonHideUnderline(
                                  child: DropdownButton2<Plan>(
                                    isExpanded: true,
                                    // barrierColor: Colors.green,
                                    hint: Text(
                                      'Select',
                                      style: TextStyle(
                                          fontFamily: 'Roboto',
                                          color: const Color(0xff000000),
                                          fontWeight: FontWeight.w400,
                                          fontSize: 12.fSize),
                                    ),
                                    items: controller.premiumPlanModel.plans
                                        ?.map((var item) {
                                      return DropdownMenuItem<Plan>(
                                        value: item,
                                        child: Text(
                                          "${item.planDays} Months",
                                          style: TextStyle(
                                              fontFamily: 'Roboto',
                                              overflow: TextOverflow.ellipsis,
                                              color: const Color(0xff000000),
                                              fontWeight: FontWeight.w400,
                                              fontSize: 12.fSize),
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      );
                                    }).toList(),
                                    value: controller.plan,
                                    onChanged: (var value) {
                                      setState(() {
                                        controller.plan = value;
                                        setState(() {
                                          controller.amount!.value =
                                              value!.amount.toString();
                                        });
                                      });
                                    },
                                    buttonStyleData: ButtonStyleData(
                                      height: 44.adaptSize,
                                      width: 240.adaptSize,
                                      padding: EdgeInsets.only(
                                          left: 10.h, right: 10.h),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(12),
                                        border: Border.all(
                                          color: const Color(0xFFDEDEDE),
                                          width: 1,
                                        ),
                                        color: Colors.white,
                                      ),
                                    ),

                                    dropdownStyleData: DropdownStyleData(
                                      maxHeight: 120.adaptSize,
                                      width: 268.adaptSize,
                                      isFullScreen: false,
                                      offset: const Offset(0, 0),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(12),
                                        color: Colors.white,
                                      ),

                                      /* scrollbarTheme: ScrollbarThemeData(
                                  minThumbLength: 0,
                                  //radius: const Radius.circular(12),
                                  thickness: MaterialStateProperty.all<double>(1),
                                  thumbVisibility: MaterialStateProperty.all<bool>(true),
                                ),*/
                                    ),
                                  ),
                                ),
                              ),

                              SizedBox(width: 65.aw),
                              Obx(
                                () => Text(
                                  '\$${controller.amount?.value}',
                                  style: TextStyle(
                                      fontFamily: 'Roboto',
                                      color: Colors.black,
                                      fontWeight: FontWeight.w700,
                                      fontSize: 20.fSize),
                                ),
                              ),
                            ],
                          ),
                  ),
                ],
              ),
            ),
            Spacer(),
            Center(
              child: CustomPrimaryBtn1(
                title: 'Pay',
                isLoading: false,
                onTap: () async {
                  // Get.to(()=> SuccessFullyPage());

                  PurchasePlanModel purchasePlanModel =   await  ApiRepository.purchasePlan(id: "${controller.plan?.id}");
                  print(purchasePlanModel.url);
                  if(purchasePlanModel.url ==null) {
                    //user/payment/purchasePlan
                    print("purchasePlanModel.url not found");
                  }
                  String? url = await Get.to(() => GoToStripeWebView(
                        stripeUrl: purchasePlanModel.url ?? ""));
                  // Navigator.push(context, MaterialPageRoute(builder: (context) => SignUp_Screen()));
                  if ((url ?? "").toLowerCase().trim().contains("success")) {
                    Get.to(()=>SuccessFullyPage());
                    //sucess
                  } else {

                  }
                },
              ),
            ),
            SizedBox(height: 50.ah),
          ],
        ),
      ),
    );
  }
}
