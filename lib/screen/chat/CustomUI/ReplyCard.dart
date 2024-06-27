import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:intl/intl.dart';
import 'package:securepoint/core/constants/size.dart';
import '../../../core/constants/app_dialogs.dart';
import '../../../core/constants/my_colour.dart';
import '../../Widget/custom_image_view.dart';
import '../Pages/chat_room/chat_room_model.dart';

class ReplyCard extends StatelessWidget {
  const ReplyCard({Key ? key, required this.message, required this.createdAt}) : super(key: key);
  final SingleMessage message;
  final DateTime createdAt;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: ConstrainedBox(
        constraints: BoxConstraints(
          maxWidth: MediaQuery.of(context).size.width - 45,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Container(
            //     margin: EdgeInsets.only(left: 10),
            //     padding: EdgeInsets.symmetric(horizontal: 10.h, vertical: 8.v),
            //     decoration: BoxDecoration(
            //       borderRadius: BorderRadius.only(
            //           topLeft: Radius.circular(10),
            //           topRight: Radius.circular(10),
            //           bottomRight: Radius.circular(10),
            //       ),
            //       color: MyColor.primaryColor
            //     ),
            //
            //     // ),
            //   child: InkWell(
            //     onTap: () {
            //       print("dsafgfdsgdgsfgdgdsgdsgdsfgdgdgfdgdfgd${message.isLink}");
            //       print("dsafgfdsgdgsfgdgdsgdsgdsfgdgdgfdgdfgd${message.isLinkId}");
            //       // if(message.isLink==3){
            //       //   if(message.isLinkId!=null){
            //       //     Get.to(()=>VlogFullViewScreen(videoUrl: "${message.isUrl}", vlogId: "${message.isLinkId}"));
            //       //   }else{
            //       //     AppDialog.taostMessage("Vlog not Found");
            //       //   }
            //       // }
            //       //
            //       // if(message.isLink==2){
            //       //   if(message.isLinkId!=null){
            //       //     Get.to(()=>BlogsFullViewScreen( id: '${message.isLinkId}',));
            //       //   }else{
            //       //     AppDialog.taostMessage("Blog not Found");
            //       //   }
            //       // }
            //       // if(message.isLink==1){
            //       //   if(message.isLinkId!=null){
            //       //     Get.to(()=>PostSingleViewScreen(  id: '${message.isLinkId}',));
            //       //   }else{
            //       //     AppDialog.taostMessage("Photo not Found");
            //       //   }
            //       // }
            //     },
            //     child: Row(
            //       mainAxisSize: MainAxisSize.min,
            //       children: [
            //         message.isLink== 0 ? const SizedBox() : Padding(
            //           padding: const EdgeInsets.only(right: 8.0),
            //           child: CustomImageView(imagePath: "assets/image/share.png",color: Colors.white,height: 20,),
            //         ),
            //         Text("${message.content}",style: TextStyle(color:message.isLink== 0 ?   Colors.white :  Colors.white,fontWeight:message.isLink== 0 ?FontWeight.normal : FontWeight.bold),
            //         ),
            //       ],
            //     ),
            //   ),
            //
            // ),
            Padding(
              padding:  EdgeInsets.only(left: 20.0.aw),
              child: Container(
                decoration: ShapeDecoration(
                  color: Color(0xFF32CD30),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                     // topLeft: Radius.circular(20),
                        topRight: Radius.circular(15.adaptSize),
                      bottomRight: Radius.circular(15.adaptSize),
                      bottomLeft: Radius.circular(15.adaptSize),
                    ),
                  ),
                ),
                child :  Padding(
                  padding:  EdgeInsets.all(13.0.adaptSize),
                  child: Text(
                    '${message.content}',
                    style: TextStyle(
                      fontSize: 16.adaptSize,
                      fontFamily: 'Roboto',
                      color: Colors.white,
                      fontWeight: FontWeight.w400,
                      height: 1.40,
                    ),
                  ),
                ),
              ),
            ),

            SizedBox(height: 3.v),
            Opacity(
                opacity: 0.5,
                child: Padding(
                    padding: EdgeInsets.only(left: 20.aw),
                    child: Text(DateFormat('hh:mm a').format(createdAt ?? DateTime.now()),
                      style: TextStyle(fontSize: 12.adaptSize),
                    )

                )),
            SizedBox(height: 10.v),

          ],
        ),
      ),
    );
  }
}
