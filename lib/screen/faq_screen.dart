import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:securepoint/core/constants/size.dart';


class FAQ extends StatefulWidget {
  @override
  _FAQState createState() => _FAQState();
}

class _FAQState extends State<FAQ> {
  final List<String> options = ['Pr 1', 'fg 2', 'Gh 3'];
  String? _selectedOption;
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
        title: Text('FAQ',
          style: TextStyle(fontFamily: 'Inter',
              color: Color(0xFF6A6A6A),fontWeight: FontWeight.w600,fontSize:19.fSize
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,surfaceTintColor: Colors.white,shadowColor: Colors.black26,
        elevation: 3,
      ),
      body: Container(
        color: Colors.white,
        child: ListView.builder(
          itemCount: itemData.length,
          itemBuilder: (BuildContext context, int index) {
            return Padding(
              padding:  EdgeInsets.only(left:16.h,right:16.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(height:10.ah),
                  /* Card(
                    color: Colors.white70,
                    shadowColor: Colors.black,
                    surfaceTintColor: Colors.white70,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(43),
                        side: BorderSide(
                            color: Colors.black12,width: 1
                        )
                    ),
                    elevation: 10,
                    child: Container(
                      // width: 293,
                      width: MediaQuery.of(context).size.width,
                      height:45,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: Colors.white70,
                        borderRadius: BorderRadius.circular(43),

                      ),
                      child: TextField(
                        cursorColor: Color(0xFF000000),
                        style: TextStyle(color: Colors.black),
                        decoration: InputDecoration(
                            prefixIcon: //Image.asset('assets/images/seearch.png',),
                            Icon(Icons.search, color: Colors.grey,),
                            hintText:"Search",
                            hintStyle: TextStyle(color:Colors.grey,fontSize:16.fSize,fontWeight: FontWeight.w400),
                            border: InputBorder.none),

                      ),
                    ),
                  ),*/

                  /*TextField(
                    cursorColor: Color(0xFF000000),
                    style: TextStyle(color: Colors.black),
                    decoration: InputDecoration(
                      isDense: true,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(43.h),
                        borderSide: BorderSide(
                          color: Color(0xFFB5B5B5),
                          width: 1,
                        ),
                      ),
                      errorStyle: TextStyle(color: Colors.red),
                      errorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(43.h),
                        borderSide: BorderSide(
                          color: Colors.red,
                          width: 1,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(43.h),
                        borderSide: BorderSide(
                          color: Color(0xFF32CD30), width: 1,),),
                      prefixIcon: //Image.asset('assets/images/seearch.png',),
                      InkWell(
                          onTap: () {
                            //Navigator.push(context, MaterialPageRoute(builder: (context) => SearcScreen()));
                          },
                          child: Icon(Icons.search, color: Colors.grey,size:30)),
                      hintText:"Search Assets",
                      hintStyle: TextStyle(color:Colors.grey,fontSize:16.fSize,fontWeight: FontWeight.w400),

                    ),

                  ),*/


                  Padding(
                    padding:  EdgeInsets.only(left:5.h,right:5.h),
                    child: Center(
                      child: Container(
                        // width: 293,
                        width: MediaQuery.of(context).size.width,
                        height:52.ah,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: Color(0xffFFFFFF),
                          borderRadius: BorderRadius.circular(43),
                          boxShadow: [
                            BoxShadow(
                              color: Color(0xff000000).withOpacity(0.25),
                              spreadRadius: -1,
                              blurRadius: 6,
                              offset: Offset(0, 2),
                            ),
                          ],
                        ),
                        child: TextField(
                          cursorColor: Color(0xFF000000),
                          style: TextStyle(color: Colors.black),
                          decoration: InputDecoration(
                              contentPadding: EdgeInsets.all(15.adaptSize),
                            //contentPadding: EdgeInsets.only(left: 17.h,top: 14.h,bottom: 14.h),
                              prefixIcon: //Image.asset('assets/images/seearch.png',),
                              //Icon(Icons.search, color: Colors.grey,),
                              Padding(padding: const EdgeInsets.all(13.0),
                                child: SvgPicture.asset('assets/icon/Icon (1).svg',height:6.ah,width: 6.8.aw,),
                              ),
                              hintText:"Search",
                              hintStyle: TextStyle(color:Color(0xff000000).withOpacity(0.30),fontSize:16.fSize,fontWeight: FontWeight.w400),
                              border: InputBorder.none),

                        ),
                      ),
                    ),
                  ),

                  SizedBox(height: 31.ah),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(' Frequently Asked Questions',
                        style: TextStyle(fontFamily: 'Roboto',
                            color: Color(0xff000000),fontWeight: FontWeight.w500,fontSize:18.75.fSize
                        ),
                      ),
                      SizedBox(height: 34.ah),
                      ExpansionPanelList(
                        animationDuration: Duration(milliseconds: 300),
                        dividerColor: Colors.white,
                        expandIconColor: Colors.black,
                        elevation: 0.0,
                        children: [
                          ExpansionPanel(
                            body: Container(
                              color: Colors.white,
                              // padding: EdgeInsets.all(10),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Padding(
                                    padding:  EdgeInsets.only(left: 7.h),
                                    child: Text(
                                      itemData[index].discription,
                                      style: TextStyle(
                                          color: Color(0xff8D8D8D),fontFamily: 'Roboto',
                                          fontSize: 13.fSize,fontWeight: FontWeight.w400,
                                          letterSpacing: 0.3,
                                          height: 1.3),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            headerBuilder: (BuildContext context, bool isExpanded) {
                              return Container(
                                color: Colors.white,
                                padding: EdgeInsets.all(10),
                                child: Text(
                                  itemData[index].headerItem,
                                  style: TextStyle(fontWeight: FontWeight.w400,
                                    color: Color(0XFF0F0F0F),fontFamily: 'Roboto',
                                    fontSize:13.2.fSize,
                                  ),
                                ),
                              );
                            },
                            isExpanded: itemData[index].expanded,
                          )
                        ],
                        expansionCallback: (int item, bool status) {
                          setState(() {

                            itemData[index].expanded = !itemData[index].expanded;
                          });
                        },
                      ),

                      SizedBox(height: 10.ah),
                      ExpansionPanelList(
                        animationDuration: Duration(milliseconds: 300),
                        dividerColor: Colors.white,
                        expandIconColor: Colors.black,
                        elevation: 0.0,
                        children: [
                          ExpansionPanel(
                            body: Container(
                              color: Colors.white,

                              // padding: EdgeInsets.all(10),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Padding(
                                    padding:  EdgeInsets.only(left: 7.h),
                                    child: Text(
                                      itemData1[index].discription,
                                      style: TextStyle(
                                          color: Color(0xff8D8D8D),fontFamily: 'Roboto',
                                          fontSize: 13.fSize,fontWeight: FontWeight.w400,
                                          letterSpacing: 0.3,
                                          height: 1.3),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            headerBuilder: (BuildContext context, bool isExpanded) {
                              return Container(
                                color: Colors.white,
                                padding: EdgeInsets.all(10),
                                child: Text(
                                  itemData1[index].headerItem,
                                  style: TextStyle(fontWeight: FontWeight.w400,
                                    color: Color(0XFF0F0F0F),fontFamily: 'Roboto',
                                    fontSize:13.2.fSize,
                                  ),
                                ),
                              );
                            },
                            isExpanded: itemData1[index].expanded,
                          )
                        ],
                        expansionCallback: (int item, bool status) {
                          setState(() {
                            itemData1[index].expanded = !itemData1[index].expanded;
                          });
                        },
                      ),

                      SizedBox(height: 10.ah),
                      ExpansionPanelList(
                        animationDuration: Duration(milliseconds: 300),
                        dividerColor: Colors.white,
                        expandIconColor: Colors.black,
                        elevation:0.0,
                        children: [
                          ExpansionPanel(
                            body: Container(
                              color: Colors.white,

                              // padding: EdgeInsets.all(10),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Padding(
                                    padding:  EdgeInsets.only(left: 7.h),
                                    child: Text(
                                      itemData2[index].discription,
                                      style: TextStyle(
                                          color: Color(0xff8D8D8D),fontFamily: 'Roboto',
                                          fontSize: 13.fSize,fontWeight: FontWeight.w400,
                                          letterSpacing: 0.3,
                                          height: 1.3),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            headerBuilder: (BuildContext context, bool isExpanded) {
                              return Container(
                                color: Colors.white,
                                padding: EdgeInsets.all(10),
                                child: Text(
                                  itemData2[index].headerItem,
                                  style: TextStyle(fontWeight: FontWeight.w400,
                                    color: Color(0XFF0F0F0F),fontFamily: 'Roboto',
                                    fontSize:13.2.fSize,
                                  ),
                                ),
                              );
                            },
                            isExpanded: itemData2[index].expanded,
                          )
                        ],
                        expansionCallback: (int item, bool status) {
                          setState(() {
                            itemData2[index].expanded = !itemData2[index].expanded;
                          });
                        },
                      ),

                      SizedBox(height: 10.ah),
                      ExpansionPanelList(
                        animationDuration: Duration(milliseconds: 300),
                        dividerColor: Colors.white,
                        expandIconColor: Colors.black,
                        elevation: 0.0,
                        children: [
                          ExpansionPanel(
                            body: Container(
                              color: Colors.white,

                              // padding: EdgeInsets.all(10),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Padding(
                                    padding:  EdgeInsets.only(left: 7.h),
                                    child: Text(
                                      itemData3[index].discription,
                                      style: TextStyle(
                                          color: Color(0xff8D8D8D),fontFamily: 'Roboto',
                                          fontSize: 13.fSize,fontWeight: FontWeight.w400,
                                          letterSpacing: 0.3,
                                          height: 1.3),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            headerBuilder: (BuildContext context, bool isExpanded) {
                              return Container(
                                color: Colors.white,
                                padding: EdgeInsets.all(10),
                                child: Text(
                                  itemData3[index].headerItem,
                                  style: TextStyle(fontWeight: FontWeight.w400,
                                    color: Color(0XFF0F0F0F),fontFamily: 'Roboto',
                                    fontSize:13.2.fSize,
                                  ),
                                ),
                              );
                            },
                            isExpanded: itemData3[index].expanded,
                          )
                        ],
                        expansionCallback: (int item, bool status) {
                          setState(() {
                            itemData3[index].expanded = !itemData3[index].expanded;
                          });
                        },
                      ),

                      SizedBox(height: 10.ah),
                      ExpansionPanelList(
                        animationDuration: Duration(milliseconds: 300),
                        dividerColor: Colors.white,
                        expandIconColor: Colors.black,
                        elevation: 0.0,
                        children: [
                          ExpansionPanel(
                            body: Container(
                              color: Colors.white,

                              // padding: EdgeInsets.all(10),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Padding(
                                    padding:  EdgeInsets.only(left: 7.h),
                                    child: Text(
                                      itemData5[index].discription,
                                      style: TextStyle(
                                          color: Color(0xff8D8D8D),fontFamily: 'Roboto',
                                          fontSize: 13.fSize,fontWeight: FontWeight.w400,
                                          letterSpacing: 0.3,
                                          height: 1.3),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            headerBuilder: (BuildContext context, bool isExpanded) {
                              return Container(
                                color: Colors.white,
                                padding: EdgeInsets.all(10),
                                child: Text(
                                  itemData5[index].headerItem,
                                  style: TextStyle(fontWeight: FontWeight.w400,
                                    color: Color(0XFF0F0F0F),fontFamily: 'Roboto',
                                    fontSize:13.2.fSize,
                                  ),
                                ),
                              );
                            },
                            isExpanded: itemData5[index].expanded,
                          )
                        ],
                        expansionCallback: (int item, bool status) {
                          setState(() {
                            itemData5[index].expanded = !itemData5[index].expanded;
                          });
                        },
                      ),

                      SizedBox(height: 10.ah),
                      ExpansionPanelList(
                        animationDuration: Duration(milliseconds: 300),
                        dividerColor: Colors.white,
                        expandIconColor: Colors.black,
                        elevation: 0.0,
                        children: [
                          ExpansionPanel(
                            body: Container(
                              color: Colors.white,

                              // padding: EdgeInsets.all(10),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Padding(
                                    padding:  EdgeInsets.only(left: 7.h),
                                    child: Text(
                                      itemData3[index].discription,
                                      style: TextStyle(
                                          color: Color(0xff8D8D8D),fontFamily: 'Roboto',
                                          fontSize: 13.fSize,fontWeight: FontWeight.w400,
                                          letterSpacing: 0.3,
                                          height: 1.3),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            headerBuilder: (BuildContext context, bool isExpanded) {
                              return Container(
                                color: Colors.white,
                                padding: EdgeInsets.all(10),
                                child: Text(
                                  itemData6[index].headerItem,
                                  style: TextStyle(fontWeight: FontWeight.w400,
                                    color: Color(0XFF0F0F0F),fontFamily: 'Roboto',
                                    fontSize:13.2.fSize,
                                  ),
                                ),
                              );
                            },
                            isExpanded: itemData6[index].expanded,
                          )
                        ],
                        expansionCallback: (int item, bool status) {
                          setState(() {
                            itemData6[index].expanded = !itemData6[index].expanded;
                          });
                        },
                      ),

                      SizedBox(height: 10.ah),
                      ExpansionPanelList(
                        animationDuration: Duration(milliseconds: 300),
                        dividerColor: Colors.white,
                        expandIconColor: Colors.black,
                        elevation: 0.0,
                        children: [
                          ExpansionPanel(
                            body: Container(
                              color: Colors.white,

                              // padding: EdgeInsets.all(10),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Padding(
                                    padding:  EdgeInsets.only(left: 7.h),
                                    child: Text(
                                      itemData4[index].discription,
                                      style: TextStyle(
                                          color: Color(0xff8D8D8D),fontFamily: 'Roboto',
                                          fontSize: 13.fSize,fontWeight: FontWeight.w400,
                                          letterSpacing: 0.3,
                                          height: 1.3),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            headerBuilder: (BuildContext context, bool isExpanded) {
                              return Container(
                                color: Colors.white,
                                padding: EdgeInsets.all(10),
                                child: Text(
                                  itemData4[index].headerItem,
                                  style: TextStyle(fontWeight: FontWeight.w400,
                                    color: Color(0XFF0F0F0F),fontFamily: 'Roboto',
                                    fontSize:13.2.fSize,
                                  ),
                                ),
                              );
                            },
                            isExpanded: itemData4[index].expanded,
                          )
                        ],
                        expansionCallback: (int item, bool status) {
                          setState(() {
                            itemData4[index].expanded = !itemData4[index].expanded;
                          });
                        },
                      ),
                    ],
                  ),


                 // SizedBox(height: 30.ah),
                ],
              ),
            );
          },
        ),
      ),
      bottomNavigationBar: BottomAppBar(
          color: Color(0xffCBCBCB),
          height:109.ah,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [

              Text('Need more help?',
                style: TextStyle(fontFamily: 'Roboto',
                    color: Color(0xff0F0F0F),fontWeight: FontWeight.w400,fontSize:13.12.fSize
                ),
              ),

              SizedBox(height:10.ah),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                //mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    width:109.aw,height:39.ah,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: Color(0xFF32CD30),
                    ),
                    child:  Center(
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          //SvgPicture.asset('assets/icon/Vector (2).svg',height:16.ah,width:20.aw,fit: BoxFit.fill,),
                          Image.asset('assets/image/logo-whatsapp.png',height:24.ah,width:24.aw,fit: BoxFit.fill,),
                          SizedBox(width: 5.aw),
                          Text('WhatsApp',
                            style: TextStyle(fontFamily: 'Roboto',
                                color: Colors.white,fontWeight: FontWeight.w600,fontSize:14.fSize
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),


                  Container(
                    width:109.aw,height:37.ah,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: Color(0xFF32CD30),
                    ),
                    child:  Center(
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          SvgPicture.asset('assets/icon/ic_email_24px.svg',height:16.ah,width:20.aw,fit: BoxFit.fill,),
                          SizedBox(width: 10.aw),
                          Text('Email',
                            style: TextStyle(fontFamily: 'Roboto',
                                color: Colors.white,fontWeight: FontWeight.w600,fontSize:14.fSize
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),

                ],
              )
            ],
          )
      ),


    );
  }

  List<ItemModel> itemData = <ItemModel>[
    ItemModel(
      headerItem: 'How Can I use this service',
      discription:
      "Morbi adipiscing gravida dolor dui tincidunt libero. Duis malesuada massa libero nec accumsan nunc gravida.",
      colorsItem: Colors.black,
    ),
  ];

  List<ItemModel> itemData1 = <ItemModel>[
    ItemModel(
      headerItem: 'Is my info safe ?',
      discription:
      "Morbi adipiscing gravida dolor dui tincidunt libero. Duis malesuada massa libero nec accumsan nunc gravida.",
      colorsItem: Colors.black,
    ),
  ];

  List<ItemModel> itemData2 = <ItemModel>[
    ItemModel(
      headerItem: 'Is one of the largest online shopping website in the world?',
      discription:
      "Morbi adipiscing gravida dolor dui tincidunt libero. Duis malesuada massa libero nec accumsan nunc gravida.",
      colorsItem: Colors.black,
    ),
  ];

  List<ItemModel> itemData3 = <ItemModel>[
    ItemModel(
      headerItem: 'What if my item is stolen?',
      discription:
      "Morbi adipiscing gravida dolor dui tincidunt libero. Duis malesuada massa libero nec accumsan nunc gravida.",
      colorsItem: Colors.black,
    ),
  ];

  List<ItemModel> itemData5 = <ItemModel>[
    ItemModel(
      headerItem: 'What are the benefits of a personal shopper?',
      discription:
      "Morbi adipiscing gravida dolor dui tincidunt libero. Duis malesuada massa libero nec accumsan nunc gravida.",
      colorsItem: Colors.black,
    ),
  ];

  List<ItemModel> itemData6 = <ItemModel>[
    ItemModel(
      headerItem: 'Can I have multiple account for same item?',
      discription:
      "Morbi adipiscing gravida dolor dui tincidunt libero. Duis malesuada massa libero nec accumsan nunc gravida.",
      colorsItem: Colors.black,
    ),
  ];

  List<ItemModel> itemData4 = <ItemModel>[
    ItemModel(
      headerItem: 'My item is sold now what to do?',
      discription:
      "Morbi adipiscing gravida dolor dui tincidunt libero. Duis malesuada massa libero nec accumsan nunc gravida.",
      colorsItem: Colors.black,
    ),
  ];


}
class ItemModel {
  bool expanded;
  String headerItem;
  String discription;
  Color colorsItem;


  ItemModel({this.expanded = false,  required this.headerItem, required this.discription,required this.colorsItem,});
}


