import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:securepoint/core/constants/size.dart';

class TreamsConditionPage extends StatefulWidget {
  const TreamsConditionPage({super.key});

  @override
  State<TreamsConditionPage> createState() => _TreamsConditionPageState();


}

class _TreamsConditionPageState extends State<TreamsConditionPage> {



  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // getdata();
  }


    bool isLoading = false ;
    var   response  ;

    // getdata() async {
    //   isLoading =true ;
    //   var headers = {
    //     'Authorization': 'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySWQiOjEsImlhdCI6MTcxNzk5OTAzMywiZXhwIjoxNzE4MjU4MjMzfQ.fIUnm0zf1cspYhohEm5v6ZtP_bUsc1fw3hGG1H92PKU'
    //   };
    //   var data = {};
    //   var dio = Dio();
    //   var response = await dio.request(
    //     'http://3.222.163.144:4000/api/userRouter/termAndConditions',
    //     options: Options(
    //       method: 'GET',
    //       headers: headers,
    //     ),
    //     data: data,
    //   );
    //
    //   if (response.statusCode == 200) {
    //     print(json.encode(response.data));
    //     // response = response.data ;
    //     // isLoading =false ;
    //     // setState(() {
    //     //
    //     // });
    //     print(json.encode(response.data));
    //   }
    //   else {
    //     isLoading =false ;
    //     setState(() {
    //
    //     });
    //     print(response.statusMessage);
    //   }
    // }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        leading:Navigator.canPop(context) ==false ? Container() : InkWell(
            onTap: () {
              Get.back();
            },
            child:const Icon(Icons.arrow_back_outlined,color: Color(0xFF6A6A6A))),
        // automaticallyImplyLeading: true,
        title: Text(
          'Terms & conditions',
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


      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Center(
          child: isLoading ?  CircularProgressIndicator(strokeWidth: 2,) : HtmlWidget('''<!DOCTYPE html>
<html>
  <head>
    <title>Secure Point </title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <link
      rel="icon"
      type="image/png"
      sizes="16x16"
      href="../../images/favicon.png"
    />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <link
      href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css"
      rel="stylesheet"
    />
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js"></script>
    <style type="text/css">
      body {
        height: 100% !important;
        margin: 0 !important;
        padding: 0 !important;
        width: 100% !important;
        font-family: "Inter", sans-serif;
        background-color: #fff;
      }
      a {
        color: #000;
      }
      .ct_privacy_head h4 {
        font-size: 35px !important;
        color: #000;
      }
      p,
      li {
        color: #000;
        font-size: 15px;
      }
      /* MOBILE STYLES */
      @media screen and (max-width: 600px) {
        h1 {
          font-size: 32px !important;
          line-height: 32px !important;
        }
        .elementor-widget-container h3 {
          font-size: 22px !important;
        }
      }

      /* ANDROID CENTER FIX */
      div[style*="margin: 16px 0;"] {
        margin: 0 !important;
      }

      /* ct css S */
      /*  .ct_sec_padd{
            padding-block: 70px; 
        } */

      .ct_logo {
        text-align: center;
        margin-bottom: 50px;
      }

      footer {
        background-color: #ffe5f4;
        padding: 15px;
        text-align: center;
      }
      footer p {
        margin-bottom: 0px;
      }
      p,
      li {
        color: #000;
        font-size: 15px;
      }
      .elementor-widget-container h3 {
        font-size: 24px;
        margin-bottom: 25px;
        font-weight: 600;
        line-height: 28px;
        color: #000;
      }
      .ct_privacy_head {
        background-image: url("http://44.199.1.149:4000/image/vivid-blurred-colorful-wallpaper-background-2048x1367.jpg");
        height: 250px;
        display: flex;
        align-items: center;
        justify-content: center;
        background-position: bottom;
        background-size: cover;
      }

      /*ol{
   padding-left:0px
}
*/
      .ct_privacy_head {
        text-align: center;
      }
    </style>
  </head>
  <body>
    <div class="ct_privacy_head">
      <h4 class="mb-4">Terms & Conditions</h4>
    </div>

    <div class="container mt-5">
      <div class="row">
        <div class="col-md-12 mx-auto">
          <div class="elementor-widget-container">
            <p>
              Welcome to the Secure Point (“Secure Point”, “we”, “us”, “our”) mobile app (the
              “Secure Point Software”), website and any other mobile or web applications
              or services owned, controlled or offered by Secure Point now or in the
              future (collectively, the “Secure Point Services”). For clarity, any
              reference herein to “Secure Point Services” includes “Secure Point Software.”
              Users who access, download, use, purchase and/or subscribe to the
              Secure Point Services (collectively or individually “You” or “Your” or
              “User” or “Users”) must do so under the following Terms and
              Conditions of service (this “Agreement”).
            </p>
            <p>
              This Agreement sets forth the rules for your use of the Secure Point
              Services, designed to create a genuine community and comply with
              the law for our users. By using Secure Point’s services, you agree to be
              bound by the terms of this Agreement, including our Privacy
              Policy, so it is important that you read this agreement carefully
              before creating an account. We may also update this agreement from
              time to time, so please check back regularly for updates.
              Additionally, please note that by using Secure Point services, you agree
              that we may use your personal data as set out in our Privacy
              Policy.
            </p>
          </div>
        </div>
      </div>
    </div>
  </body>
</html>
'''),
        ),
      ),
    );
  }
}

