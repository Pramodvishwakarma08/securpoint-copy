// import 'package:flutter/material.dart';
// import 'package:securepoint/screen/dashboard_page/scaffold_layout.dart';
// import 'package:securepoint/screen/home_page/homescreen.dart';
// import '../chat/Pages/chats/chats_screen.dart';
// import '../my_assets_screen/my_assets_screen.dart';
//
//
// class DashBoardNew extends StatelessWidget {
//   int ? activeIndex ;
//    DashBoardNew({super.key,this.activeIndex});
//
//   @override
//   Widget build(BuildContext context) {
//     return  ScaffoldLayout(
//         showBottomAppBar: true,
//         activeIndex: 1,
//       body: PageView(
//         children: [
//
//           if(activeIndex == 0)  HomeScreenNew() ,
//           if( activeIndex == 1)  MyAssetsScreen(),
//           if(activeIndex == 2 ) ChatsScreen(chatmodels: [],),
//         ],
//
//       ),
//     );
//   }
// }
