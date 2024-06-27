import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/get_rx.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:securepoint/api_client/api_repository.dart';
import 'package:securepoint/screen/const_iteam/const_textfile.dart';
import 'package:securepoint/core/constants/size.dart';
import '../../Widget/ImageProcessor.dart';
import '../../Widget/custom_image_view.dart';
import '../../const_iteam/custom_button.dart';


class EditProfileScreen extends StatefulWidget {
 final String fullName;
 final String email;
 final String phoneNumber;
 final String imageUrl;
 final String notes;
 const EditProfileScreen({super.key,required this.fullName,required this.email, required this.phoneNumber, required this.imageUrl, required this.notes});

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setData();
  }

  setData(){
    nameC.text   =  widget.fullName;
    emailC.text  =  widget.email;
    phoneC.text  =  widget.phoneNumber;
    notes.text   =  widget.notes;
  }


  Map<String, dynamic>? processedImage;


  Future<void> _pickAndProcessImage() async {
    final result = await ImageProcessor.pickAndProcessImage(
        ImageSource.gallery,
        const CropAspectRatio(ratioX: 1, ratioY: 1)); // You can pass CropAspectRatio if you want to crop the image, otherwise, pass null
    if (result != null) {
      setState(() {
        processedImage = result;
      });
    }
  }


  TextEditingController nameC =TextEditingController();
  TextEditingController emailC =TextEditingController();
  TextEditingController phoneC =TextEditingController();
  TextEditingController notes =TextEditingController();


    RxBool isLoading = false.obs;
  void updateProfile() async {
    isLoading(true);
    await ApiRepository.editProfile(fullName: nameC.text.trim(),notes: notes.text.trim(), processedImage: processedImage );
    Get.back();
    isLoading(false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: const Icon(Icons.arrow_back_outlined,color: Color(0xFF6A6A6A))),
        title: Text('Edit Profile',
          style:TextStyle(fontFamily: 'Inter',
              color: const Color(0xFF6A6A6A),fontWeight: FontWeight.w600,fontSize:19.fSize
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,surfaceTintColor: Colors.white,shadowColor: Colors.black26,
        elevation: 3,
      ),

      body: ListView(
        children: [
          SizedBox(height: 53.ah),
          Center(
            child: Stack(
              children: [
                CustomImageView(
                  height: 155.ah,width: 155.ah,
                // imagePath:    widget.imageUrl == "" ? null : widget.imageUrl,
                   imagePath:"$processedImage" == "null"  ?  widget.imageUrl == "" ? "assets/image/img.png" : widget.imageUrl : "uint8List",
                   uint8List:"$processedImage" == "null"  ? null : processedImage!['file'],
                  radius: BorderRadius.circular(200),
                ),

                Positioned(
                    right: 0,top:80,
                    child: InkWell(
                      onTap: () {
                        _pickAndProcessImage();
                      },
                      child: Container(
                        height: 44.ah,width: 44.aw,
                        decoration: const BoxDecoration(
                            color: Color(0xff32CD30),
                            shape: BoxShape.circle
                        ),
                        child: const Icon(Icons.edit,color: Colors.white,),
                      ),
                    )
                  //Image.asset('assets/image/edit.png',height:38.ah,width: 38.aw,fit: BoxFit.contain,)
                ),

              ],

            ),
          ),

          SizedBox(height:18.ah),
          Padding(
            padding:  EdgeInsets.only(left: 29.h,right: 29.h),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left:10),
                  child: Text('Name',
                    style: TextStyle(fontFamily: 'Roboto',
                        color:Color(0xff000000),fontWeight: FontWeight.w400,fontSize: 15.fSize
                    ),
                  ),
                ),
                SizedBox(height: 7.ah,),
                CustomTextFormField1(
                    hintText: 'Enter your name',
                    controller: nameC
                ),
                SizedBox(height: 18.ah,),

                //email
                Padding(
                  padding: const EdgeInsets.only(left:10),
                  child: Text('Email',
                    style: TextStyle(fontFamily: 'Roboto',
                        color:Color(0xff000000),fontWeight: FontWeight.w400,fontSize: 15.fSize
                    ),
                  ),
                ),
                SizedBox(height: 7.ah,),
                CustomTextFormField1(
                    hintText: 'Enter your email',
                    controller: emailC
                ),
                SizedBox(height: 18.ah,),


                //owner note
                Padding(
                  padding: const EdgeInsets.only(left:10),
                  child: Text('Owner’s Note',
                    style: TextStyle(fontFamily: 'Roboto',
                        color:const Color(0xff000000),fontWeight: FontWeight.w400,fontSize: 15.fSize
                    ),
                  ),
                ),
                SizedBox(height: 7.ah,),
                CustomTextFormField1(
                    hintText: "Enter Your Note's",
                    controller: notes,
                  maxLines: 5
                ),
                SizedBox(height: 18.ah,),

              ],
            ),
          ),

          SizedBox(height:20.ah,),
          Center(
            child: Obx(
              ()=> CustomPrimaryBtn01(
                title: 'Save',
                isLoading: isLoading.value,
                onTap: () {
                  updateProfile();
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
