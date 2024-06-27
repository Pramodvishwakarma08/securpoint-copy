import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:securepoint/core/constants/size.dart';

class Notification_Preference extends StatefulWidget {
  const Notification_Preference({super.key});

  @override
  State<Notification_Preference> createState() => _Notification_PreferenceState();
}

class _Notification_PreferenceState extends State<Notification_Preference> {
  bool _switchValue = true;
  bool _switchValue1 = true;
  bool _switchValue2 = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(Icons.arrow_back_outlined,color: Color(0xFF6A6A6A))),
        title: Text('Notification ',
          style: TextStyle(fontFamily: 'Inter',
              color: Color(0xFF6A6A6A),fontWeight: FontWeight.w600,fontSize:19.fSize
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,surfaceTintColor: Colors.white,shadowColor: Colors.black26,
        elevation: 3,
      ),

      body: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [

          SizedBox(height: 20.ah),

          Center(
            child: Container(
              height: 225.ah,width: 351.aw,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(6),
                  border: Border.all(
                      width: 1.aw,color: Color(0xffDADADA)
                  )
              ),

              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text('Show notification for',
                      style: TextStyle(fontFamily: 'Inter',
                          color: Color(0xff000000).withOpacity(0.50),fontWeight: FontWeight.w600,fontSize:16.fSize
                      ),
                    ),

                    SizedBox(height: 20.ah),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      //mainAxisSize: MainAxisSize.min,
                      children: [

                        Text('Messages',
                          style: TextStyle(fontFamily: 'Inter',
                              color: Color(0xff000000),fontWeight: FontWeight.w500,fontSize:16.fSize
                          ),
                        ),

                        // SizedBox(width: 201.aw),

                        Container(
                          height: 30, //set desired REAL HEIGHT
                          width: 35, //set desired REAL WIDTH

                          child: Transform.scale(
                            transformHitTests: false,
                            scale: .5,

                            child: CupertinoSwitch(
                              value: _switchValue,
                              onChanged: (value) {
                                setState(() {
                                  _switchValue = value;
                                });
                              },
                            ),
                          ),
                        ),
                      ],
                    ),

                    SizedBox(height: 20.ah),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      // mainAxisSize: MainAxisSize.min,
                      children: [

                        Text('Featured plan end',
                          style: TextStyle(fontFamily: 'Inter',
                              color: Color(0xff000000),fontWeight: FontWeight.w500,fontSize:16.fSize
                          ),
                        ),

                        //  SizedBox(width: 142.aw),

                        Container(
                          height: 30, //set desired REAL HEIGHT
                          width: 35, //set desired REAL WIDTH
                          child: Transform.scale(
                            transformHitTests: false,
                            scale: .5,

                            child: CupertinoSwitch(
                              value: _switchValue1,
                              onChanged: (value) {
                                setState(() {
                                  _switchValue1 = value;
                                });
                              },
                            ),
                          ),
                        ),
                      ],
                    ),


                    SizedBox(height: 20.ah),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      //mainAxisSize: MainAxisSize.min,
                      children: [

                        Text('SecurPoint+ plan end',
                          style: TextStyle(fontFamily: 'Inter',
                              color: Color(0xff000000),fontWeight: FontWeight.w500,fontSize:16.fSize
                          ),
                        ),
                        // SizedBox(width: 114.aw),
                        Container(
                          height: 30, //set desired REAL HEIGHT
                          width: 35, //set desired REAL WIDTH
                          child: Transform.scale(
                            transformHitTests: false,
                            scale: .5,

                            child: CupertinoSwitch(
                              value: _switchValue2,
                              onChanged: (value) {
                                setState(() {
                                  _switchValue2 = value;
                                });
                              },
                            ),
                          ),
                        ),
                      ],
                    ),




                  ],
                ),
              ),
            ),
          )

        ],
      ),
    );
  }
}
