import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:securepoint/core/constants/size.dart';
import 'package:share_plus/share_plus.dart';
import '../../api_client/api_client.dart';
import '../../api_client/api_repository.dart';
import '../../core/utils/pref_utils.dart';
import '../chat/Pages/chat_room/chat_room_model.dart';
import '../chat/Pages/chats/chats_model.dart';
import 'custom_image_view.dart';


class CustomBottomSheets {

  static Future<void> shareBottomSheet({
    required BuildContext context,
    required String userName,
  }) async {



    ShareController controller =Get.find<ShareController>();

    // Get.bottomSheet(Container(child: Text("Vinode",style:TextStyle(fontSize:30)),));
    // return;
    await Get.bottomSheet(
      enableDrag: true,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
        Container(
          color: Colors.white,
          height: 700,
          child: Column(
              children: [
                SizedBox(
                  height: 10,
                ),
                Container(
                  height: 5,
                  width: 100,
                  decoration: BoxDecoration(
                    color: Colors.grey,
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                SizedBox(
                  height: 30,
                ),

                SizedBox(
                  height: 500,
                  child: GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
                    itemCount: controller.chatsModel.chats?.length?? 0,
                    itemBuilder: (BuildContext context, int index) {
                      int indexxx = "${controller.chatsModel.chats![index].participants![0].id}" == PrefUtils().getUserId() ? 1 : 0;

                      return Container(
                          width: 100,
                          child: Column(
                            children: [
                              CustomImageView(
                                radius: BorderRadius.circular(100),
                                height: 80.adaptSize,
                                width: 80.adaptSize,
                                imagePath: controller.chatsModel.chats?[index].participants?[indexxx].avatarUrl,
                                fit: BoxFit.cover,

                              ),
                              Padding(
                                padding: const EdgeInsets.all(2.0),
                                child: Text("${controller.chatsModel.chats?[index].participants?[indexxx].fullName}",textAlign: TextAlign.center,overflow: TextOverflow.ellipsis,maxLines: 2,),
                              )
                            ],
                          )
                      );
                    },

                  ),
                ),
            // Use Builder to get the widget context
            Builder(
              builder: (BuildContext context) {
                return ElevatedButton(
                  onPressed: ()async {
                  await  Share.share("pramid");
                  },
                  child: const Text('Share'),
                );
              },
            ),


                Container(
                  height: 100,
                  decoration: BoxDecoration(
                    color: Colors.green,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      InkWell(
                        onTap: () {
                          Get.back();
                           // Share.share("content");
                        },

                          child: Icon(Icons.share_outlined)),
                      Icon(Icons.copy_sharp),
                    ]

                ))


              ]),
        ));
  }


}



class ShareController extends GetxController {
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getchats();

  }
  // _onShare method:





  ChatsModel chatsModel =ChatsModel();
  RxBool isLoadingChatModel =false.obs;
  Future<void> getchats() async {
    isLoadingChatModel.value=true;
    final response =await ApiClient().getRequest(endPoint: "chat");
    chatsModel= ChatsModel.fromJson(response);
    isLoadingChatModel.value=false;

    print("chatsModel.chats");
    print(chatsModel.chats);
    print("chatsModel.chats");
  }



}
