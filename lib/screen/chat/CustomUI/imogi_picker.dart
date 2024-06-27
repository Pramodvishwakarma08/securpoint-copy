import 'package:emoji_picker_flutter/emoji_picker_flutter.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:securepoint/core/constants/size.dart';

import '../Pages/chat_room/chat_room_controller.dart';

class EmojiPickerWidget extends StatelessWidget {
  const EmojiPickerWidget({super.key});

  @override
  Widget build(BuildContext context) {
      ChatRoomController controller = Get.find();
    return Obx(() {
      if (controller.emojiShowing == false) {
        return SizedBox(
          height: 20.ah,
        );
      }else{
        return
        Container(
          margin: EdgeInsets.only(top: 10.h),
          child: EmojiPicker(
            textEditingController: controller.sendMsgController,
            // scrollController: controller.scrollController,
            config: const Config(
              height: 256,
              checkPlatformCompatibility: true,
              // emojiViewConfig: EmojiViewConfig(
              //   // Issue: https://github.com/flutter/flutter/issues/28894
              //   emojiSizeMax: 28 * (foundation.defaultTargetPlatform == TargetPlatform.iOS ? 1.2 : 1.0),
              // ),
              swapCategoryAndBottomBar: false,
              skinToneConfig: SkinToneConfig(),
              categoryViewConfig: CategoryViewConfig(),
              bottomActionBarConfig: BottomActionBarConfig(enabled: false),
              searchViewConfig: SearchViewConfig(),
            ),
          ),
        );
      }
    });

  }
}
