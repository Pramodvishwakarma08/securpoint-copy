import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';
import 'package:securepoint/core/constants/size.dart';
import 'package:securepoint/screen/dashboard_page/scaffold_layout.dart';
import '../../../../api_client/api_client.dart';
import '../../../../api_client/api_repository.dart';
import '../../../../core/constants/my_colour.dart';
import '../../../../core/utils/calculateTimeDifference.dart';
import '../../../../core/utils/pref_utils.dart';
import '../../../Widget/custom_image_view.dart';
import '../../CustomUI/OwnMessgaeCrad.dart';
import '../../CustomUI/ReplyCard.dart';
import '../../CustomUI/imogi_picker.dart';
import '../../Model/LastSeenModel.dart';
import 'chat_room_controller.dart';
import '../chats/chats_model.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;
import 'chat_room_model.dart';
import 'package:get/get.dart';

class ChatRoomPage extends StatefulWidget {
  const ChatRoomPage(
      {Key? key, required this.participant, required this.chatId})
      : super(key: key);

  final Participant participant;
  final String chatId;

  @override
  _ChatRoomPageState createState() => _ChatRoomPageState();
}

class _ChatRoomPageState extends State<ChatRoomPage> {
  ChatRoomController controller = Get.put(ChatRoomController());

  bool show = false;
  FocusNode focusNode = FocusNode();
  bool sendButton = false;

  Future<void> getLastSeen() async {
    lastSeenModel =
        await ApiRepository.lastSeen(id: "${widget.participant.id}");
    setState(() {});
  }

  @override
  void initState() {
    getLastSeen();
    super.initState();
    controller.getAllMsg(chatId: widget.chatId);
    focusNode.addListener(() {
      if (focusNode.hasFocus) {
        setState(() {
          show = false;
        });
      }
    });
    connect();
  }

  late IO.Socket socket;
  int coiubt = 0;

  Future<void> connect() async {
    Map<String, dynamic> headers = {
      'Authorization': 'Bearer ${PrefUtils().getAuthToken()}', // Example header
    };
    socket = IO.io(
      ApiClient.mainUrl,
      <String, dynamic>{
        "transports": ["websocket"],
        "extraHeaders": headers,
        "autoConnect": false,
      },
    );
    socket.connect();
    socket.onConnect((data) {
      socket.on("messageReceived", (msg) {
        print("line_79${coiubt++}");
        try {
          SingleMessage getSingleMsgModel = SingleMessage.fromJson(msg);
          controller.allMsg.messages!.insert(0, getSingleMsgModel);
          controller.allMsgNOTUSE.refresh();
        } catch (e, log) {
          print("catch==>${e.toString()}");
        }
      });
    });
  }

  LastSeenModel? lastSeenModel;

  @override
  void dispose() {
    socket.disconnect(); // Disconnect the socket when the widget is disposed
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ScaffoldLayout(
      body: Obx(
        () => controller.isLoading.value
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : SafeArea(
                child: Scaffold(
                  appBar: customAppbarForChat(
                      context: context,
                      handle: lastSeenModel?.data?.isLastSeenAllowed == false
                          ? ""
                          : lastSeenModel?.data?.lastSeen == null
                              ? "Online"
                              : calculateTimeDifference(
                                  "${lastSeenModel?.data?.lastSeen}"),
                      name: "${widget.participant.fullName}".capitalizeFirst,
                      imagepath: widget.participant.avatarUrl),
                  backgroundColor: Colors.transparent,
                  body: SizedBox(
                    height: MediaQuery.of(context).size.height,
                    width: MediaQuery.of(context).size.width,
                    child: Column(
                      children: [
                        Expanded(
                          // height: MediaQuery.of(context).size.height - 150,
                          child: Obx(
                            () => ListView.builder(
                              shrinkWrap: true,
                              scrollDirection: flipAxis(Axis.horizontal),
                              reverse: true,
                              itemCount: controller.allMsg.messages!.length,
                              itemBuilder: (context, index) {
                                DateTime? currentDate = controller
                                    .allMsg.messages![index].createdAt;
                                DateTime? previousDate = index > 0
                                    ? controller
                                        .allMsg.messages![index - 1].createdAt
                                    : null;
                                if (currentDate == null) {
                                  return const SizedBox
                                      .shrink(); // Skip if datetime is null
                                }

                                bool showDate = previousDate == null ||
                                    currentDate.year != previousDate.year ||
                                    currentDate.month != previousDate.month ||
                                    currentDate.day != previousDate.day;

                                DateTime today = DateTime.now();
                                DateTime yesterday =
                                    DateTime.now().subtract(Duration(days: 1));

                                //today Yesterday logic
                                String formattedDate;

                                if (currentDate.year == today.year &&
                                    currentDate.month == today.month &&
                                    currentDate.day == today.day) {
                                  formattedDate = 'Today';
                                } else if (currentDate.year == yesterday.year &&
                                    currentDate.month == yesterday.month &&
                                    currentDate.day == yesterday.day) {
                                  formattedDate = 'Yesterday';
                                } else {
                                  formattedDate =
                                      DateFormat.yMMMMd().format(currentDate);
                                }
                                //insert date  in chat logic end

                                if ("${controller.allMsg.messages![index].senderId}" !=
                                    "${widget.participant.id}") {
                                  return Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      if (false)
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Text(
                                            formattedDate,
                                            style: const TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 16,
                                            ),
                                          ),
                                        ),
                                      OwnMessageCard(
                                        message:
                                            controller.allMsg.messages![index],
                                        createdAt: controller
                                            .allMsg.messages![index].createdAt!
                                            .toLocal(),
                                      ),
                                    ],
                                  );
                                } else {
                                  return ReplyCard(
                                    message: controller.allMsg.messages![index],
                                    createdAt: controller
                                        .allMsg.messages![index].createdAt!
                                        .toLocal(),
                                  );
                                }
                                // if (messages[index].type == "source") {
                                //   return OwnMessageCard(
                                //     message: messages[index].message,
                                //     time: messages[index].time,
                                //   );
                                // } else {

                                // }
                              },
                            ),
                          ),
                        ),
                        Align(
                          alignment: Alignment.bottomCenter,
                          child: SizedBox(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Row(
                                  children: [
                                    SizedBox(
                                      width: 10.aw,
                                    ),
                                    Container(
                                      width: 315.aw,
                                      child: TextFormField(
                                        controller: controller.sendMsgController,
                                        focusNode: focusNode,
                                        textAlignVertical: TextAlignVertical.center,
                                        keyboardType: TextInputType.multiline,
                                        maxLines: 5,
                                        minLines: 1,
                                        onChanged: (value) {
                                          if (value.length > 0) {
                                            setState(() {
                                              sendButton = true;
                                            });
                                          } else {
                                            setState(() {
                                              sendButton = false;
                                            });
                                          }
                                        },
                                        decoration: decoration,
                                      ),
                                    ),
                                    Spacer(),
                                    CircleAvatar(
                                      radius: 25.adaptSize,
                                      backgroundColor: MyColor.primaryColor,
                                      child: IconButton(
                                        icon: const Icon(
                                          Icons.send,
                                          color: Colors.white,
                                        ),
                                        onPressed: () {
                                          if (sendButton) {
                                            controller.sendMessage(
                                                message: controller.sendMsgController.text,
                                                chatId: widget.chatId);
                                            controller.sendMsgController.clear();
                                            setState(() {
                                              sendButton = false;
                                            });
                                          }
                                        },
                                      ),
                                    ),
                                    SizedBox(
                                      width: 10.aw,
                                    ),
                                  ],
                                ),
                                SizedBox(height: 8.ah,)
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
      ),
      activeIndex: 4,
    );
  }

  Widget iconCreation(IconData icons, Color color, String text) {
    return InkWell(
      onTap: () {},
      child: Column(
        children: [
          CircleAvatar(
            radius: 30,
            backgroundColor: color,
            child: Icon(
              icons,
              // semanticLabel: "Help",
              size: 29,
              color: Colors.white,
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          Text(
            text,
            style: const TextStyle(
              fontSize: 12,
              // fontWeight: FontWeight.w100,
            ),
          )
        ],
      ),
    );
  }
}

PreferredSizeWidget customAppbarForChat(
    {required BuildContext context,
    String? name,
    String? handle,
    String? imagepath,
    bool? showImage,
    bool? editBlogIcon,
    Function()? onTap}) {
  return PreferredSize(
      preferredSize:
          Size.fromHeight(200.ah), // preferred height for the app bar
      child: Container(
        height: 70.ah,
        child: Row(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: 10.aw,
            ),
            InkWell(
              onTap: () {
                Navigator.pop(context);
              },
              child: SizedBox(
                  height: 36.ah,
                  width: 40.ah,
                  child: const Icon(Icons.arrow_back_outlined)),
            ),
            SizedBox(
              width: 6.aw,
            ),
            CustomImageView(
              width: 42.adaptSize,
              height: 42.adaptSize,
              radius: BorderRadius.circular(36),
              fit: BoxFit.cover,
              imagePath: imagepath,
            ),
            SizedBox(
              width: 10.aw,
            ),
            Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name ?? "",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: const Color(0xFF111111),
                    fontSize: 18.adaptSize,
                    fontFamily: 'Roboto',
                    fontWeight: FontWeight.w700,
                  ),
                ),
                Text(
                  handle ?? "",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: const Color(0xFF111111).withOpacity(.60),
                    fontSize: 14.adaptSize,
                    fontFamily: 'Roboto',
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ],
            ),
            const Spacer(),
            if (editBlogIcon ?? false)
              InkWell(
                  onTap: onTap,
                  child: const Icon(
                    Icons.more_vert_outlined,
                    size: 30,
                  )),
            if (showImage ?? false)
              CustomImageView(
                width: 38.adaptSize,
                height: 38.adaptSize,
                radius: BorderRadius.circular(38.adaptSize),
                fit: BoxFit.cover,
                imagePath: imagepath,
              ),
            SizedBox(
              width: 16.aw,
            ),
          ],
        ),
      ));


}

InputDecoration get decoration => InputDecoration(
  hintText:  "Message",
  hintStyle: TextStyle(
    color: Color(0xFFA8A8A8),
    fontSize: 20.adaptSize,
    fontFamily: 'Roboto',
    fontWeight: FontWeight.w500,
  ),

   prefixIcon: CustomImageView(imagePath: "assets/icon/smaily.svg",height: 60.adaptSize,onTap: () {
     EmojiPickerWidget();
   },),
   prefixIconConstraints:BoxConstraints(maxHeight: 25.adaptSize,) ,

//  suffixIcon: suffix,
 // suffixIconConstraints: suffixConstraints,
  isDense: true,

  // contentPadding: EdgeInsets.symmetric(horizontal: 30.aw, vertical: 10.v,),
   contentPadding: EdgeInsets.symmetric(horizontal: 10.aw, vertical: 10.ah,),
  fillColor: Colors.transparent,
  filled: true,
  border:
      OutlineInputBorder(
        borderRadius: BorderRadius.circular(30.adaptSize),
        borderSide: BorderSide(
          color: Colors.black.withOpacity(.50),
          width: 1,
        ),
      ),
  enabledBorder:
      OutlineInputBorder(
        borderRadius: BorderRadius.circular(30.adaptSize),
        borderSide: BorderSide(
          color: Colors.black.withOpacity(.50),
          width: 1,
        ),
      ),
  focusedBorder:
      OutlineInputBorder(
        borderRadius: BorderRadius.circular(30.adaptSize),
        borderSide: BorderSide(
          color: Colors.black.withOpacity(.50),
          width: 1,
        ),
      ),
);