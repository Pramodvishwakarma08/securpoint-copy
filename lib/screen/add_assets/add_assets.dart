import 'package:dotted_border/dotted_border.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:securepoint/api_client/api_repository.dart';
import 'package:securepoint/core/constants/app_dialogs.dart';
import 'package:securepoint/screen/Widget/custom_image_view.dart';
import 'package:securepoint/core/constants/size.dart';
import 'package:securepoint/screen/my_assets_screen/my_assets_screen.dart';
import '../../model/CategoriesListModel.dart';
import '../../model/SubCategoriesListModel.dart';
import '../Widget/ImageProcessor.dart';
import '../const_iteam/const_textfile.dart';
import '../const_iteam/custom_button.dart';
import '../map_screen/map_screen.dart';
import '../my_assets_screen/my_assets_controller.dart';
import '../notification_screen/notification_screen.dart';

class AddAssetsScreen extends StatefulWidget {
  const AddAssetsScreen({super.key});

  @override
  State<AddAssetsScreen> createState() => _AddAssetsScreenState();
}

class _AddAssetsScreenState extends State<AddAssetsScreen> {



  MyAssetsController controller = Get.put(MyAssetsController());


  LatLng ? mylatlong ;


  //  Get  Categories

  CategoriesListModel categoriesListModel = CategoriesListModel();
  var isLoadingGetCategory = false.obs;
  getCategory() async {
    print("getCategoriesList_line35");
    isLoadingGetCategory(true);
    categoriesListModel = await ApiRepository.getCategoriesList();
    setState(() {});
    isLoadingGetCategory(false);
  }

  //  Get Sub Categories

  SubCategoriesListModel subCategoriesListModel = SubCategoriesListModel();
  var isLoadingSubGetCategory = false.obs;
  Future<void> getSubcategory(id) async {
    print("getCategoriesList_line35");
    isLoadingSubGetCategory(true);
    subCategoriesListModel =
        await ApiRepository.getSubCategoriesListBYid(id: id);
    setState(() {});
    isLoadingSubGetCategory(false);
  }

  //  Get Status

  AddAssetsStatusModel assetsStatusModel = AddAssetsStatusModel();
  var isLoadingStatus = false.obs;
  Future<void> getStatus() async {
    print("getCategoriesList_line35");
    isLoadingSubGetCategory(true);
    assetsStatusModel = await ApiRepository.getAddAssetsStatus();
    setState(() {});
    isLoadingSubGetCategory(false);
  }


  TextEditingController assetNameC = TextEditingController();
  TextEditingController assetDetails = TextEditingController();
  TextEditingController assetIdentifier = TextEditingController();

  Map<String, dynamic>? processedImage;

  List<Map<String, dynamic>> images = [];

  Future<void> _pickAndProcessImage() async {
    final result = await ImageProcessor.pickAndProcessImage(
        ImageSource.gallery,
        const CropAspectRatio(
            ratioX: 1,
            ratioY:
                1)); // You can pass CropAspectRatio if you want to crop the image, otherwise, pass null
    if (result != null) {
      setState(() {
        processedImage = result;
        images.add(processedImage!);
      });
    }
  }

   var isLoadingAddAssets = false.obs;
   Future<void> addAssets() async {

     isLoadingAddAssets(true);
     print("isLoadingAddAssets =${isLoadingAddAssets.value}");
    final respons =  await ApiRepository.addAssets(
        processedImage: images,
        AssetName: assetNameC.text,
        AssetDetails: assetDetails.text,
        AssetIdentifier: assetIdentifier.text,
        category: _selectedCategoryName!.id.toString(),
        subCategory: _selectedSubcatery!.id.toString(),
        lockAndUnlock: lockUnlock == "Lock" ? "0" : '1',
        status: _selectedStatus!.name.toString(),
        promote: seletedWeek,
        latitude: "${mylatlong?.latitude}",
      longitude:  "${mylatlong?.longitude}",
    );
     isLoadingAddAssets(false);
     print("isLoadingAddAssets =${isLoadingAddAssets.value}");
     if(respons==true){
      Get.offAll(()=>const MyAssetsScreen());
     }


   //  controller.getAssets();
   }


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print("asdfg_line47");
    getCategory();
    getStatus();
  }


  Category ? _selectedCategoryName;
  SubCategory? _selectedSubcatery;
  StatusObj ? _selectedStatus;

  int seletedWeek = 0;
  String lockUnlock = 'Lock';

  bool valuesecond = false;
  bool colourrr = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: const Icon(Icons.arrow_back_outlined, color: Color(0xFF6A6A6A))),
        title: Text(
          'Add Assets',
          style: /*TextStyle(fontFamily: 'Inter',
              color: Color(0xFF6A6A6A),fontWeight: FontWeight.w600,fontSize:20.fSize
          ),*/
              TextStyle(
                  fontFamily: 'Inter',
                  color: const Color(0xFF6A6A6A),
                  fontWeight: FontWeight.w600,
                  fontSize: 19.fSize),
        ),
        centerTitle: true,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 25),
            child: InkWell(
                onTap: () {
                  Get.to(()=>NotificationScreen());
                },
                child: SvgPicture.asset(
                  'assets/icon/Icon.svg',
                  height: 22.ah,
                  width: 22.aw,
                )),
          )
        ],
        backgroundColor: Colors.white,
        surfaceTintColor: Colors.white,
        shadowColor: Colors.black26,
        elevation: 3,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(height: 31.ah),
            Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        for (int i = 0; i < images.length; i++)
                          Padding(
                            padding: const EdgeInsets.only(left: 10.0),
                            child: Stack(
                              children: [
                                CustomImageView(
                                  height: 113.adaptSize,
                                  width: 113.adaptSize,
                                  imagePath: "${images[i]}" == "null" ? null : "uint8List",
                                  uint8List: "${images[i]}" == "null" ? null : images[i]['file'],
                                  radius: BorderRadius.circular(10),
                                  fit: BoxFit.cover,
                                ),
                                SizedBox( height: 113.adaptSize,
                                  width: 113.adaptSize,
                                child: Center(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      CustomImageView(
                                        onTap: () {
                                          images.removeAt(i);
                                          setState(() {

                                          });
                                        },
                                        imagePath: "assets/image/ic_delete_24px.png",
                                        height: 18.adaptSize,
                                        color: Colors.white,
                                      )

                                    ],
                                  ),
                                ),),
                              ],
                            ),
                          ),

                        if(images.length<4)
                        InkWell(
                          onTap: () {
                            _pickAndProcessImage();
                          },
                          child: Padding(
                            padding: const EdgeInsets.only(left: 10.0),
                            child: DottedBorder(
                              borderType: BorderType.RRect,
                              radius: const Radius.circular(15),
                              strokeWidth: 1,
                              color: const Color(0xff7F7F7F),
                              child: ClipRRect(
                                borderRadius:
                                    const BorderRadius.all(Radius.circular(15)),
                                child: SizedBox(
                                  height: 113.adaptSize,
                                  width: 113.adaptSize,
                                  child: Center(
                                    child: SvgPicture.asset(
                                      'assets/icon/+.svg',
                                      height: 20.ah,
                                      width: 19.aw,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(width: 20,)
                      ],
                    ),
                  ),
                  const SizedBox(height: 20,),
                  Text(
                    'Image size : 113 x 113 pixels (Not more than 1 MB file size)     ',
                    style: TextStyle(
                        fontFamily: 'Roboto',
                        letterSpacing: -0.6,
                        color: const Color(0xff000000).withOpacity(0.50),
                        fontWeight: FontWeight.w500,
                        fontSize: 10.fSize),
                  ),
                ],
              ),
            ),
            SizedBox(height: 30.ah),
            Padding(
              padding: EdgeInsets.only(left: 31.h, right: 20.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        'Asset Name',
                        style: TextStyle(
                            fontFamily: 'Roboto',
                            color: const Color(0xff000000),
                            fontWeight: FontWeight.w400,
                            fontSize: 12.fSize),
                      ),
                      SizedBox(width: 33.adaptSize),
                      Expanded(
                          child: primaryTextfield2(
                              hintText: '', controller: assetNameC))
                    ],
                  ),
                  SizedBox(height: 20.ah),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        'Asset Details',
                        style: TextStyle(
                            fontFamily: 'Roboto',
                            color: const Color(0xff000000),
                            fontWeight: FontWeight.w400,
                            fontSize: 12.fSize),
                      ),
                      SizedBox(width: 28.adaptSize),
                      Expanded(
                          child: primaryTextfield3(
                              hintText: 'Describe your asset here',
                              controller: assetDetails))
                    ],
                  ),
                  SizedBox(height: 20.ah),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        'Asset Identifier',
                        style: TextStyle(
                            fontFamily: 'Roboto',
                            color: const Color(0xff000000),
                            fontWeight: FontWeight.w400,
                            fontSize: 12.fSize),
                      ),
                      SizedBox(width: 18.adaptSize),
                      Expanded(
                          child: primaryTextfield3(
                              hintText: 'E.g. Asset Serial no. IMEI, VIN, etc.',
                              controller: assetIdentifier))
                    ],
                  ),
                  SizedBox(height: 20.ah),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        'Category',
                        style: TextStyle(
                            fontFamily: 'Roboto',
                            color: const Color(0xff000000),
                            fontWeight: FontWeight.w400,
                            fontSize: 12.fSize),
                      ),
                      SizedBox(width: 50.adaptSize),
                      Expanded(
                        child: DropdownButtonHideUnderline(
                          child: DropdownButton2<Category>(
                            isExpanded: true,
                            // barrierColor: Colors.green,
                            hint: Text(
                              'Select',
                              style: TextStyle(
                                  fontFamily: 'Roboto',
                                  color: const Color(0xff000000),
                                  fontWeight: FontWeight.w400,
                                  fontSize: 12.fSize),
                            ),
                            items: categoriesListModel.categories?.map((var item) {
                              return DropdownMenuItem<Category>(
                                value: item,
                                child: Text(
                                  item.categoryName ?? "",
                                  style: TextStyle(
                                      fontFamily: 'Roboto',
                                      overflow: TextOverflow.ellipsis,
                                      color: const Color(0xff000000),
                                      fontWeight: FontWeight.w400,
                                      fontSize: 12.fSize),
                                  overflow: TextOverflow.ellipsis,
                                ),
                              );
                            }).toList(),
                            value: _selectedCategoryName,
                            onChanged: (var value) {
                              setState(() {
                                _selectedCategoryName = value;
                                _selectedSubcatery=null;
                                subCategoriesListModel.subCategories =[];
                                getSubcategory(value?.id.toString());
                              });
                            },
                            buttonStyleData: ButtonStyleData(
                              height: 44.adaptSize,
                              width: 240.adaptSize,
                              padding: EdgeInsets.only(left: 10.h, right: 10.h),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12),
                                border: Border.all(
                                  color: const Color(0xFFDEDEDE),
                                  width: 1,
                                ),
                                color: Colors.white,
                              ),
                            ),

                            dropdownStyleData: DropdownStyleData(
                              maxHeight: 120.adaptSize,
                              width: 268.adaptSize,
                              isFullScreen: false,
                              offset: const Offset(0, 0),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12),
                                color: Colors.white,
                              ),

                              /* scrollbarTheme: ScrollbarThemeData(
                                minThumbLength: 0,
                                //radius: const Radius.circular(12),
                                thickness: MaterialStateProperty.all<double>(1),
                                thumbVisibility: MaterialStateProperty.all<bool>(true),
                              ),*/
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 20.ah),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        'Subcategory',
                        style: TextStyle(
                            fontFamily: 'Roboto',
                            color: Colors.black,
                            fontWeight: FontWeight.w400,
                            fontSize: 12.fSize),
                      ),
                      SizedBox(width: 31.adaptSize),
                      Expanded(
                        child: DropdownButtonHideUnderline(
                          child: DropdownButton2<SubCategory>(
                            isExpanded: true,
                            // barrierColor: Colors.green,
                            hint: Text(
                              'Select',
                              style: TextStyle(
                                  fontFamily: 'Roboto',
                                  color: const Color(0xff000000),
                                  fontWeight: FontWeight.w400,
                                  fontSize: 12.fSize),
                            ),
                            items: subCategoriesListModel.subCategories?.map((var item) {
                              return DropdownMenuItem<SubCategory>(
                                value: item,
                                child: Text(
                                  item.subCategory ?? '',
                                  style: TextStyle(
                                      fontFamily: 'Roboto',
                                      overflow: TextOverflow.ellipsis,
                                      color: const Color(0xff000000),
                                      fontWeight: FontWeight.w400,
                                      fontSize: 12.fSize),
                                  overflow: TextOverflow.ellipsis,
                                ),
                              );
                            }).toList(),
                            value: _selectedSubcatery,
                            onChanged: (var value) {
                              setState(() {
                                _selectedSubcatery = value;
                              });
                            },
                            buttonStyleData: ButtonStyleData(
                              height: 44.adaptSize,
                              width: 240.adaptSize,
                              padding: EdgeInsets.only(left: 10.h, right: 10.h),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12),
                                border: Border.all(
                                  color: const Color(0xFFDEDEDE),
                                  width: 1,
                                ),
                                color: Colors.white,
                              ),
                            ),

                            dropdownStyleData: DropdownStyleData(
                              maxHeight: 120.adaptSize,
                              width: 268.adaptSize,
                              isFullScreen: true,
                              offset: const Offset(0, 0),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12),
                                color: Colors.white,
                              ),

                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 20.ah),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        'Status',
                        style: TextStyle(
                            fontFamily: 'Roboto',
                            color: const Color(0xff000000),
                            fontWeight: FontWeight.w400,
                            fontSize: 12.fSize),
                      ),
                      SizedBox(width: 64.adaptSize),
                      Expanded(
                        child: DropdownButtonHideUnderline(
                          child: DropdownButton2<StatusObj>(
                            isExpanded: true,
                            // barrierColor: Colors.green,
                            hint: Text(
                              'Select',
                              style: TextStyle(
                                  fontFamily: 'Roboto',
                                  color: const Color(0xff000000),
                                  fontWeight: FontWeight.w400,
                                  fontSize: 12.fSize),
                            ),
                            items: assetsStatusModel.status?.map((var item) {
                              return DropdownMenuItem<StatusObj>(
                                value: item,
                                child: Text(
                                  item.name ?? "",
                                  style: TextStyle(
                                      fontFamily: 'Roboto',
                                      overflow: TextOverflow.ellipsis,
                                      color: const Color(0xff000000),
                                      fontWeight: FontWeight.w400,
                                      fontSize: 12.fSize),
                                  overflow: TextOverflow.ellipsis,
                                ),
                              );
                            }).toList(),
                            value: _selectedStatus,
                            onChanged: (var value) {
                              setState(() {
                                _selectedStatus = value;
                              });
                            },
                            buttonStyleData: ButtonStyleData(
                              height: 44.adaptSize,
                              width: 240.adaptSize,
                              padding: EdgeInsets.only(left: 10.h, right: 10.h),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12),
                                border: Border.all(
                                  color: const Color(0xFFDEDEDE),
                                  width: 1,
                                ),
                                color: Colors.white,
                              ),
                            ),

                            dropdownStyleData: DropdownStyleData(
                              maxHeight: 120.adaptSize,
                              width: 268.adaptSize,
                              isFullScreen: false,
                              offset: const Offset(0, 0),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12),
                                color: Colors.white,
                              ),

                              /* scrollbarTheme: ScrollbarThemeData(
                                minThumbLength: 0,
                                //radius: const Radius.circular(12),
                                thickness: MaterialStateProperty.all<double>(1),
                                thumbVisibility: MaterialStateProperty.all<bool>(true),
                              ),*/
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: 30.ah),
            Padding(
              padding: EdgeInsets.only(
                left: 36.h,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Radio(
                        visualDensity:
                            const VisualDensity(horizontal: -4, vertical: -4),
                        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                        activeColor: const Color(0xFF32CD30),
                        value: 'Lock',
                        groupValue: lockUnlock,
                        onChanged: (value) {
                          setState(() {
                            lockUnlock = value.toString();
                          });
                        },
                      ),
                      SizedBox(width: 14.aw),
                      Text(
                        'Lock',
                        style: TextStyle(
                            fontFamily: 'Roboto',
                            color: const Color(0xFF000000),
                            fontWeight: FontWeight.w500,
                            fontSize: 12.fSize),
                      ),
                      SizedBox(width: 35.aw),
                      Radio(
                        visualDensity:
                            const VisualDensity(horizontal: -4, vertical: -4),
                        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                        value: 'Unlock',
                        activeColor: const Color(0xFF32CD30),
                        groupValue: lockUnlock,
                        onChanged: (value) {
                          setState(() {
                            lockUnlock = value.toString();
                          });
                        },
                      ),
                      SizedBox(width: 14.aw),
                      Text(
                        'Unlock',
                        style: TextStyle(
                            fontFamily: 'Roboto',
                            color: const Color(0xFF000000),
                            fontWeight: FontWeight.w500,
                            fontSize: 12.fSize),
                      ),
                      SizedBox(width: 60.aw),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Checkbox(
                            visualDensity:
                                const VisualDensity(horizontal: -4, vertical: -4),
                            activeColor: Colors.green,
                            materialTapTargetSize:
                                MaterialTapTargetSize.shrinkWrap,
                            //checkColor: Colors.black,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(3.5),
                              side: BorderSide(
                                  color: const Color(0xFF32CD30), width: 1.aw),
                            ),
                            value: valuesecond,
                            onChanged: (value) {
                              setState(() {
                                this.valuesecond = value!;
                              });
                            },
                          ),
                          SizedBox(width: 14.aw),
                          Text(
                            'Promote',
                            style: TextStyle(
                                fontFamily: 'Roboto',
                                color: const Color(0xff000000),
                                fontWeight: FontWeight.w500,
                                fontSize: 12.fSize),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: 20.ah),
            valuesecond == true
                ? Padding(
                    padding: EdgeInsets.only(left: 20.h, right: 20.h),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.start,
                      // mainAxisSize: MainAxisSize.min,
                      children: [
                        Container(
                          height: 52.ah,
                          width: 350.aw,
                          decoration: BoxDecoration(
                              color: const Color(0xFFD5FFD4),
                              borderRadius: BorderRadius.circular(6)),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              SizedBox(
                                width: 20.aw,
                                height: 10.ah,
                                child: Radio(
                                  activeColor: const Color(0xFF32CD30),
                                  value: '1 Weeks',
                                  groupValue: seletedWeek,
                                  onChanged: (value) {
                                    setState(() {
                                      seletedWeek = 1;
                                    });
                                  },
                                ),
                              ),
                              Text(
                                '1 Weeks',
                                style: TextStyle(
                                    fontFamily: 'Roboto',
                                    color: Colors.black,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 12.fSize),
                              ),
                              SizedBox(
                                width: 5.aw,
                              ),
                              SizedBox(
                                width: 20.aw,
                                height: 10.ah,
                                child: Radio(
                                  value: '2 Weeks',
                                  activeColor: const Color(0xFF32CD30),
                                  groupValue: seletedWeek,
                                  onChanged: (value) {
                                    setState(() {
                                      seletedWeek = 2;
                                    });
                                  },
                                ),
                              ),
                              Text(
                                '2 Weeks',
                                style: TextStyle(
                                    fontFamily: 'Roboto',
                                    color: Colors.black,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 12.fSize),
                              ),
                              SizedBox(
                                width: 5.aw,
                              ),
                              SizedBox(
                                width: 20.aw,
                                height: 10.ah,
                                child: Radio(
                                  activeColor: const Color(0xFF32CD30),
                                  value: '3 Weeks',
                                  groupValue: seletedWeek,
                                  onChanged: (value) {
                                    setState(() {
                                      seletedWeek = 3;
                                    });
                                  },
                                ),
                              ),
                              Text(
                                '3 Weeks',
                                style: TextStyle(
                                    fontFamily: 'Roboto',
                                    color: Colors.black,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 12.fSize),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  )
                : Container(),
            SizedBox(height: 18.ah),
            InkWell(
              onTap: () async {
                await Geolocator.requestPermission();
               Position postion= await Geolocator.getCurrentPosition();
               print(postion.toJson());
                LatLng latLng =LatLng(postion.latitude, postion.longitude);
                var  data =   Get.to(()=> MapScreen(mylatlong: latLng,))?.then((value) {
                  if(value!=null){
                    mylatlong =value ;
                  }
                });
              },
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SvgPicture.asset(
                    'assets/icon/Subtract (1).svg',
                    width: 17.aw,
                    height: 25.ah,
                  ),
                  SizedBox(height: 5.ah),
                  Text(
                    'Tap here to add map view',
                    style: TextStyle(
                        fontFamily: 'Roboto',
                        color: const Color(0xFF6C6C6C),
                        fontWeight: FontWeight.w400,
                        fontSize: 11.fSize),
                  ),
                ],
              ),
            ),
            SizedBox(height: 30.ah),
            Center(
              child: Obx(
                ()=> CustomPrimaryBtn1(
                  title: 'Submit',
                  isLoading: isLoadingAddAssets.value,
                  onTap: () {
                    print("longitudelongitudelongitude${mylatlong?.longitude}");
                    print("latitudelatitudelatitude${mylatlong?.latitude}");

                    if(images.isEmpty){
                      AppDialog.taostMessage("Please select Image");
                    }else if(assetNameC.text==""){
                      AppDialog.taostMessage("Please enter Asset name");
                    }else if(assetDetails.text==""){
                      AppDialog.taostMessage("Please enter Asset Details");
                    }else if(assetIdentifier.text==""){
                      AppDialog.taostMessage("Please enter Asset Identifier");
                    }
                    else if(_selectedCategoryName == null){
                      AppDialog.taostMessage("Please select Category");
                    }
                    else if(_selectedSubcatery == null){
                      AppDialog.taostMessage("Please select SubCategory");
                    }

                    else if(_selectedStatus == null){
                      AppDialog.taostMessage("Please select Status");
                    }else
                    if(mylatlong == null){
                      AppDialog.taostMessage("Please select location");
                    }
                    else{
                      addAssets();
                    }

                    // Get.to(EditAssets());
                    // Navigator.push(context, MaterialPageRoute(builder: (context) => EditAssets()));
                  },
                ),
              ),
            ),
            SizedBox(height: 30.ah)
          ],
        ),
      ),
    );
  }
}


class DropdownIssue extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _DropdownIssueState();
  }
}

class _DropdownIssueState extends State<DropdownIssue> {
  int currentValue = 0;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
          color: Colors.grey,
          child: Container(
            alignment: Alignment.center,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                CustomDropDown(
                  hint: 'hint',
                  errorText: '',
                  key: const Key(''),
                  value: currentValue,
                  items: [
                    const DropdownMenuItem(
                      value: 0,
                      child: Text('test 0'),
                    ),
                    const DropdownMenuItem(
                      value: 1,
                      child: Text('test 1'),
                    ),
                    const DropdownMenuItem(
                      value: 2,
                      child: Text('test 2'),
                    ),
                  ].cast<DropdownMenuItem<int>>(),
                  onChanged: (value) {
                    setState(() {
                      currentValue = value;
                    });
                    print('changed to $value');
                  },
                ),
              ],
            ),
          )),
    );
  }
}

class CustomDropDown extends StatelessWidget {
  final int value;
  final String hint;
  final String errorText;
  final List<DropdownMenuItem> items;
  final Function onChanged;

  const CustomDropDown(
      {required Key key,
      required this.value,
      required this.hint,
      required this.items,
      required this.onChanged,
      required this.errorText})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Container(
          decoration: BoxDecoration(
              color: Colors.grey[100], borderRadius: BorderRadius.circular(30)),
          child: Padding(
            padding:
                const EdgeInsets.only(left: 30, right: 30, top: 10, bottom: 5),
            child: DropdownButton<int>(
              value: value,
              hint: Text(
                hint,
                style: const TextStyle(fontSize: 20),
                overflow: TextOverflow.ellipsis,
              ),
              // style: Theme.of(context).textTheme.title,
              //  items: items,
              onChanged: (item) {
                onChanged(item);
              },
              isExpanded: true,
              underline: Container(),
              icon: const Icon(Icons.keyboard_arrow_down),
              items: [],
            ),
          ),
        ),
        if (errorText != null)
          Padding(
            padding: const EdgeInsets.only(left: 30, top: 10),
            child: Text(
              errorText,
              style: TextStyle(fontSize: 12, color: Colors.red[800]),
            ),
          )
      ],
    );
  }
}
