import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:securepoint/core/constants/size.dart';

class AboutScreen extends StatefulWidget {
  const AboutScreen({super.key});

  @override
  State<AboutScreen> createState() => _AboutScreenState();
}

class _AboutScreenState extends State<AboutScreen> {
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
          title: Text('About',
            style: TextStyle(fontFamily: 'Inter',
                color:const Color(0xFF6A6A6A),fontWeight: FontWeight.w600,fontSize:19.fSize
            ),
          ),
          centerTitle: true,
          backgroundColor: Colors.white,surfaceTintColor: Colors.white,shadowColor: Colors.black26,
          elevation: 3,
        ),

        body: Padding(
          padding:  EdgeInsets.only(left: 20.h,right: 20.h,top: 33.v),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [

              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                mainAxisSize: MainAxisSize.min,
                children: [
                 // SvgPicture.asset('assets/icon/Component 1.svg',height:16.ah,width: 23.aw,fit: BoxFit.fill,),
                  Image.asset('assets/image/Union (9).png',height: 20.ah,width:23.aw,),
                  SizedBox(width: 20.aw),
                  Text('Terms of Service',
                    style: TextStyle(fontFamily: 'Inter',
                        color: Color(0xff000000),fontWeight: FontWeight.w500,fontSize:16.fSize
                    ),
                  ),
                  SizedBox(width: 20.aw),
                  SvgPicture.asset('assets/icon/Union (3).svg',height: 20.ah,width: 16.aw,fit: BoxFit.fill,
                  color:const Color(0xff000000).withOpacity(0.50),
                  ),

                ],
              ),

              SizedBox(height: 30.ah),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                mainAxisSize: MainAxisSize.min,
                children: [
                  SvgPicture.asset('assets/icon/Union (2).svg',height: 16.ah,width:23.aw,fit: BoxFit.fill,),
                  SizedBox(width: 20.aw),
                  Text('Privacy  Policy',
                    style: TextStyle(fontFamily: 'Inter',
                        color:const Color(0xff000000),fontWeight: FontWeight.w500,fontSize:16.fSize
                    ),
                  ),
                  SizedBox(width:33.aw),
                  SvgPicture.asset('assets/icon/Union (3).svg',height: 20.ah,width: 16.aw,fit: BoxFit.fill,
                    color: const Color(0xff000000).withOpacity(0.50),),

                ],
              ),


              SizedBox(height:30.ah),
              Text('  App version 1.2.4',
                style: TextStyle(fontFamily: 'Inter',
                    color:const Color(0xff026D00),fontWeight: FontWeight.w500,fontSize:16.fSize
                ),
              ),


            ],
          ),
        )
    );
  }
}
