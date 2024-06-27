import 'package:flutter/material.dart';
import 'package:securepoint/core/constants/size.dart';
import 'package:securepoint/screen/dashboard_page/scaffold_layout.dart';

import '../../../../core/constants/my_colour.dart';
import '../../../../core/utils/pref_utils.dart';
import '../../../Widget/custom_image_view.dart';
import '../../Model/ChatModel.dart';
import '../chat_room/chat_room_page.dart';
import 'chats_controller.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import 'chats_model.dart';

class ChatsScreen extends StatefulWidget {
  ChatsScreen({
    Key? key,
    required this.chatmodels,
  }) : super(key: key);
  final List<ChatModel> chatmodels;

  @override
  _ChatsScreenState createState() => _ChatsScreenState();
}

class _ChatsScreenState extends State<ChatsScreen> {
  ChatScreenController controller = Get.put(ChatScreenController());

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller.getchats();
  }

  @override
  Widget build(BuildContext context) {
    return ScaffoldLayout(
      showBottomAppBar: true,
      appBar: AppBar(
        leading: Navigator.canPop(context) == false
            ? Container()
            : InkWell(
                onTap: () {
                  Get.back();
                },
                child: const Icon(Icons.arrow_back_outlined,
                    color: Color(0xFF6A6A6A))),
        // automaticallyImplyLeading: true,
        title: Text(
          'Msg001',
          style: TextStyle(
              fontFamily: 'Inter',
              color: const Color(0xFF6A6A6A),
              fontWeight: FontWeight.w600,
              fontSize: 19.fSize),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        surfaceTintColor: Colors.white,
        shadowColor: Colors.black26,
        elevation: 3,
      ),
      body: Obx(
        () => controller.isLoading.value
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : controller.chatsModel.chats!.length == 0
                ? const Center(
                    child: Text("No Chats Found"),
                  )
                : ListView.builder(
                    itemCount: controller.chatsModel.chats!.length,
                    itemBuilder: (context, index) => customCard(index),
                  ),
      ), activeIndex: 3,
    );
  }

  Widget customCard(int index) {
    int indexxx =
        "${controller.chatsModel.chats![index].participants![0].id}" ==
                PrefUtils().getUserId()
            ? 1
            : 0;

    return InkWell(
      onTap: () {
        Get.to(() => ChatRoomPage(
              participant: controller.chatsModel.chats![index].participants![indexxx],
              chatId: controller.chatsModel.chats![index].id.toString(),
            ));
      },
      child: ChatListItem(participant: controller.chatsModel.chats![index].participants![indexxx],lastMessage: controller.chatsModel.chats![index].lastMessage,unreadCount: controller.chatsModel.chats![index].unreadCount.toString(),),
    );
  }
}
class ChatListItem extends StatelessWidget {
  Participant ? participant ;
  LastMessage? lastMessage;
  String ? unreadCount ;
  ChatListItem({required this.participant,required this.lastMessage,required this.unreadCount});
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 390,
      height: 88,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CustomImageView(
            radius: BorderRadius.circular(30),
            height: 60,
            width: 60,
            imagePath: participant?.avatarUrl,
            fit: BoxFit.cover,
          ),
          SizedBox(width: 12.aw,),
          Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: 200.aw,
                child: Text(
                  '${participant?.fullName}',
                  textAlign: TextAlign.start,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                    fontFamily: 'Roboto',
                    fontWeight: FontWeight.w600,
                    height: 0,
                  ),
                ),
              ),
              const SizedBox(height: 4),
              Container(
                width: 200.aw,
                child: Text(
                  '${lastMessage?.content}',
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.start,
                  style: TextStyle(
                    color: Color(0xFF858585),
                    fontSize: 15,
                    fontFamily: 'Roboto',
                    fontWeight: FontWeight.w500,
                    height: 0,
                  ),
                ),
              ),
            ],
          ),
          Spacer(),
          Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              // Text('${lastMessage?.createdAt?.month}',
             Text(DateFormat('hh:mm a').format(lastMessage?.createdAt ?? DateTime.now()),
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Color(0xFF32CD30),
                  fontSize: 12,
                  fontFamily: 'Roboto',
                  fontWeight: FontWeight.w500,
                  height: 0,
                ),
              ),
              const SizedBox(height: 4),
              unreadCount == "0" ? SizedBox():
              Container(
                width: 20,
                height: 20,
                child: Center(
                  child: Text(
                    '${unreadCount}',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                      fontFamily: 'Roboto',
                      fontWeight: FontWeight.w500,
                      height: 0,
                    ),
                  ),
                ),
                decoration: ShapeDecoration(
                  color: Color(0xFF32CD30),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(40),
                  ),
                ),)

            ],
          ),




        ],
      ),
    );
  }
}