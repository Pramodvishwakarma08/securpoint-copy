import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:securepoint/core/constants/size.dart';

final ScrollController _scrollController = ScrollController();
void bottomSheetWidget(BuildContext context) {
  RxDouble hight = 0.35.obs;
  showModalBottomSheet(
      backgroundColor: Colors.white,
      context: context,
      isScrollControlled: true,
      builder: (context) {
        return Obx(
              () => FractionallySizedBox(
              heightFactor: hight.value,
              child: GestureDetector(
                onTap: () {
                  Get.back();
                },
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: SingleChildScrollView(
                    controller: _scrollController,
                    physics: const BouncingScrollPhysics(),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: 24.v),
                          const Row(),
                          Padding(
                            padding: EdgeInsets.only(left: 11.h),
                            child: const Text(
                              'Report reason ',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 16),
                            ),
                          ),
                          SizedBox(
                            height: 10.v,
                          ),
                          TextFormField(
                            onEditingComplete: () {
                              hight.value = 0.35;
                              FocusScope.of(Get.context!).unfocus();
                              _scrollController.animateTo(
                                0.0,
                                duration: const Duration(
                                    milliseconds:
                                    200), // Adjust the duration as needed
                                curve: Curves.easeInOut,
                              );
                            },
                            onTap: () {
                              hight.value = 0.70;
                            },
                            decoration: InputDecoration(
                              counterText: "",
                              contentPadding:
                              const EdgeInsets.only(left: 20, top: 20),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12.h),
                                borderSide: BorderSide(
                                  color: Color(0xff808080),
                                  width: 1,
                                ),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12.h),
                                borderSide: BorderSide(
                                  color: Color(0xff808080),
                                  width: 1,
                                ),
                              ),
                              errorStyle: TextStyle(color: Colors.red),
                              errorBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12.h),
                                borderSide: BorderSide(
                                  color: Colors.red,
                                  width: 1,
                                ),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12.h),
                                borderSide: BorderSide(
                                  color: Colors.grey,
                                  width: 1,
                                ),
                              ),
                              hintText: "Lorem ipsum",
                              hintStyle: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15),
                            ),
                          ),
                          SizedBox(
                            height: 44.v,
                          ),
                          InkWell(
                            onTap: () {
                              hight.value = .35;
                              Get.back();
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                  color: const Color(0xffC60000),
                                  borderRadius: BorderRadius.circular(600)),
                              height: 44.aw,
                              width: 342.aw,
                              child: Center(
                                child: Text(
                                  "Report this asset",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 16.adaptSize,
                                      color: Colors.white),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 400.v,
                          ),
                        ]),
                  ),
                ),
              )),
        );
      });
}