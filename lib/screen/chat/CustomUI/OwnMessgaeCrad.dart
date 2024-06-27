import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:securepoint/core/constants/size.dart';
import '../../../core/constants/my_colour.dart';
import '../../Widget/custom_image_view.dart';
import '../Pages/chat_room/chat_room_model.dart';

class OwnMessageCard extends StatelessWidget {
  const OwnMessageCard({Key? key, required this.message, required this.createdAt})
      : super(key: key);
  final SingleMessage message;
  final DateTime createdAt;


  @override
  Widget build(BuildContext context) {
    DateTime time = DateTime.now().toUtc();
    print("$time");

    // convert local date time to string format local date time

    return Align(
      alignment: Alignment.centerRight,
      child: ConstrainedBox(
        constraints: BoxConstraints(
          maxWidth: MediaQuery.of(context).size.width - 45,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Padding(
              padding:  EdgeInsets.only(right: 20.0.aw),
              child: Container(
                decoration: ShapeDecoration(
                  color: Color(0xFFECECEC),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(15.adaptSize),
                    //  topRight: Radius.circular(20),
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
                      color: Color(0xFF111111),
                      fontSize: 16.adaptSize,
                      fontFamily: 'Roboto',
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
                    padding: EdgeInsets.only(left: 10.h),
                    child: Text("${DateFormat('hh:mm a').format(createdAt ?? DateTime.now())}    ",
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
