import 'package:flutter/material.dart';
import 'package:securepoint/core/constants/size.dart';
import 'package:securepoint/screen/dashboard_page/scaffold_layout.dart';



class NotificationScreen extends StatefulWidget {
  const NotificationScreen({super.key});

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  @override
  Widget build(BuildContext context) {
    return ScaffoldLayout(
      activeIndex: 12,
      showBottomAppBar: true,
      appBar: AppBar(
        surfaceTintColor: Colors.white,
        backgroundColor: Colors.white,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Notifications         ', style: TextStyle(fontFamily: 'Inter',
                color: const Color(0xFF6A6A6A),fontWeight: FontWeight.w600,fontSize:19.fSize
            ),
              /*style: TextStyle(fontFamily: 'Inter',
                  color: Color(0xFF6A6A6A),fontWeight: FontWeight.w600,fontSize:32.fSize
              ),*/
            ),
          ],
        ),
        leading: Padding(
          padding:  EdgeInsets.only(left: 15.h),
          child: InkWell(
              onTap: () {
                Navigator.pop(context);
              },
              child: const Icon(Icons.arrow_back_sharp,color:Color(0xFF6A6A6A),)),
        ),
      ),
      body: ListView.builder(
        shrinkWrap: true,
        scrollDirection: Axis.vertical,
        itemCount: 10,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.only(left:20,right:20,top:25),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          height: 62.ah,
                          width: 62.aw,
                          decoration: const BoxDecoration(
                            // borderRadius: BorderRadius.all(Radius.circular(35)),
                              color: Color(0x305B5B5B),
                              shape: BoxShape.circle,
                              image: DecorationImage(
                                fit: BoxFit.fill,
                                image: AssetImage('assets/image/ying-ge--Yo1cWJVKFY-unsplash.jpg'),
                              )),
                          // child: Center(child: Text(firestore.currentUser!.displayName!.toUpperCase().characters.first.toString(), style: TextStyle(fontSize: 20.fSize,fontWeight: FontWeight.w400),)),
                        ),
                        SizedBox(width: 10.aw),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text('Randy Korsgaard',
                              style: TextStyle(fontFamily: 'Roboto',height: 1.ah,
                                color: const Color(0xff090909),fontWeight: FontWeight.w700,fontSize:15.fSize,
                              ),),
                            Text('sent you a message',
                              style: TextStyle(fontFamily: 'Roboto',
                                color: const Color(0xffA6A6A6),fontWeight: FontWeight.w500,fontSize:15.fSize,
                              ),),
                          ],
                        ),
                      ],
                    ),
                    const Icon(Icons.arrow_forward_ios,color: Colors.grey,)
                  ],
                ),
                const Divider(color: Color(0xFFD9D9D9),height: 1,endIndent:40,indent: 55),

              ],
            ),
          );
        },
      ),
    );
  }
}

class NotificationList extends StatelessWidget {
  const NotificationList({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        shrinkWrap: true,
        scrollDirection: Axis.vertical,
        itemCount: 10,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.only(left:20,right:20,top:25),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          height: 62.ah,
                          width: 62.aw,
                          decoration: const BoxDecoration(
                            // borderRadius: BorderRadius.all(Radius.circular(35)),
                              color: Color(0x305B5B5B),
                              shape: BoxShape.circle,
                              image: DecorationImage(
                                fit: BoxFit.fill,
                                image: AssetImage('assets/image/ying-ge--Yo1cWJVKFY-unsplash.jpg'),
                              )),
                          // child: Center(child: Text(firestore.currentUser!.displayName!.toUpperCase().characters.first.toString(), style: TextStyle(fontSize: 20.fSize,fontWeight: FontWeight.w400),)),
                        ),
                        SizedBox(width: 10.aw),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text('Randy Korsgaard',
                              style: TextStyle(fontFamily: 'Roboto',height: 1.ah,
                                color: const Color(0xff090909),fontWeight: FontWeight.w700,fontSize:15.fSize,
                              ),),
                            Text('sent you a message',
                              style: TextStyle(fontFamily: 'Roboto',
                                color: const Color(0xffA6A6A6),fontWeight: FontWeight.w500,fontSize:15.fSize,
                              ),),
                          ],
                        ),
                      ],
                    ),
                    const Icon(Icons.arrow_forward_ios,color: Colors.grey,)
                  ],
                ),
                const Divider(color: Color(0xFFD9D9D9),height: 1,endIndent:40,indent: 55),

              ],
            ),
          );
        },
      ),
    );
  }
}