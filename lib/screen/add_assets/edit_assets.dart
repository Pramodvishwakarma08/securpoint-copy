import 'package:dotted_border/dotted_border.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
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
import '../../model/assets_model.dart';
import '../Widget/ImageProcessor.dart';
import '../const_iteam/const_textfile.dart';
import '../const_iteam/custom_button.dart';
import '../map_screen/map_screen.dart';
import '../notification_screen/notification_screen.dart';

class EditAssetsScreen extends StatefulWidget {
      Asset assetDetailsModel ;
   EditAssetsScreen({super.key,required this.assetDetailsModel});

  @override
  State<EditAssetsScreen> createState() => _EditAssetsScreenState();
}

class _EditAssetsScreenState extends State<EditAssetsScreen> {


  CategoriesListModel categoriesListModel = CategoriesListModel();
  var isLoadingGetCategory = false.obs;
  LatLng ? mylatlong ;


  getCategory() async {
    _selectedStatus = widget.assetDetailsModel.status;
    lockUnlock = widget.assetDetailsModel.lock == 0 ? "Lock" : "Unlock";
    print("getCategoriesList_line35");
    isLoadingGetCategory(true);
    categoriesListModel = await ApiRepository.getCategoriesList();
    _selectedCategoryName=categoriesListModel.categories?.firstWhere((element) => element.id.toString()==widget.assetDetailsModel.categoryId.toString());
   // _selectedCategoryName = ObjCategoryName(id: int.parse("${widget.assetDetailsModel.category}"),categoryName:"${widget.assetDetailsModel.categoryName}");
    setState(() {});
    isLoadingGetCategory(false);
  }

  SubCategoriesListModel subCategoriesListModel = SubCategoriesListModel();
  var isLoadingSubGetCategory = false.obs;


  Future<void> getSubcategory(id,bool isEdit) async {
    print("getCategoriesList_line35");
    isLoadingSubGetCategory(true);
    subCategoriesListModel = await ApiRepository.getSubCategoriesListBYid(id: id);
    print("sdfghjhgfdsdfghj${widget.assetDetailsModel.subCategoryId}");
    if(isEdit){
      _selectedSubcatery=subCategoriesListModel.subCategories?.firstWhere((element) => element.id.toString()==widget.assetDetailsModel.subCategoryId.toString());
    }

    //  _selectedSubcatery =ObjSubCategoryName(id: int.parse("${widget.assetDetailsModel.subCategory}"),categoryId: int.parse("${widget.assetDetailsModel.category}"),subCategory: "${widget.assetDetailsModel.subCategoryName}");

    setState(() {});
    isLoadingSubGetCategory(false);
  }

  TextEditingController assetNameC = TextEditingController();
  TextEditingController assetDetails = TextEditingController();
  TextEditingController assetIdentifier = TextEditingController();



  putOldData(){
    assetNameC.text ="${widget.assetDetailsModel.assetName}";
    assetDetails.text ="${widget.assetDetailsModel.assetDetails}";
    assetIdentifier.text ="${widget.assetDetailsModel.assetIdentifier}";
    mylatlong =LatLng(double.tryParse("${widget.assetDetailsModel.latitude}") ?? 0.0, double.tryParse("${widget.assetDetailsModel.latitude}") ?? 0.0);
    // getSubcategory("${widget.assetDetailsModel.subCategory}");

  }



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

  Future<void> editAssets() async {
    isLoadingAddAssets(true);
    print("isLoadingAddAssets =${isLoadingAddAssets.value}");
    final response  = await ApiRepository.editAssets(
        id: widget.assetDetailsModel.id.toString(),
        processedImage: images,
        AssetName: assetNameC.text,
        AssetDetails: assetDetails.text,
        AssetIdentifier: assetIdentifier.text,
        category: _selectedCategoryName!.id.toString(),
        subCategory: _selectedSubcatery!.id.toString(),
        lockAndUnlock: lockUnlock =="Lock" ? "0" : '1',
        status: _selectedStatus!,
        promote: seletedWeek,
        latitude: '${mylatlong!.latitude}',
        longitude: "${mylatlong!.longitude}",
    );
    isLoadingAddAssets(false);
    if(response==true){
      Get.offAll(MyAssetsScreen());
    }

  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getCategory();
    getSubcategory("${widget.assetDetailsModel.categoryId}",true);
    putOldData();
  }

  final List<String> _status = ['Stolen', 'Not Stolen'];

  Category? _selectedCategoryName ;
  SubCategory? _selectedSubcatery ;

  String? _selectedStatus;

  String seletedWeek = '0';
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
            child: Icon(Icons.arrow_back_outlined, color: Color(0xFF6A6A6A))),
        title: Text(
          'Edit Assets',
          style: /*TextStyle(fontFamily: 'Inter',
              color: Color(0xFF6A6A6A),fontWeight: FontWeight.w600,fontSize:20.fSize
          ),*/
          TextStyle(
              fontFamily: 'Inter',
              color: Color(0xFF6A6A6A),
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
                                Container( height: 113.adaptSize,
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

                        for (int i = 0; i < widget.assetDetailsModel.assetImages!.length; i++)
                          Padding(
                            padding: const EdgeInsets.only(left: 10.0),
                            child: Stack(
                              children: [
                                CustomImageView(
                                  height: 113.adaptSize,
                                  width: 113.adaptSize,
                                  imagePath: widget.assetDetailsModel.assetImages![i].imageUrl,
                                  radius: BorderRadius.circular(10),
                                  fit: BoxFit.cover,
                                ),
                                // CustomImageView(
                                //   height: 113.adaptSize,
                                //   width: 113.adaptSize,
                                //   imagePath: "${images[i]}" == "null" ? null : "uint8List",
                                //   uint8List: "${images[i]}" == "null" ? null : images[i]['file'],
                                //   radius: BorderRadius.circular(10),
                                //   fit: BoxFit.cover,
                                // ),
                                Container( height: 113.adaptSize,
                                  width: 113.adaptSize,
                                  child: Center(
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        CustomImageView(
                                          onTap: () {
                                            //images detet ki api chalana hy
                                            widget.assetDetailsModel.assetImages!.removeAt(i);
                                            setState(() {});
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

                        if(images.length + widget.assetDetailsModel.assetImages!.length <4)
                          InkWell(
                            onTap: () {
                              _pickAndProcessImage();
                            },
                            child: Padding(
                              padding: const EdgeInsets.only(left: 10.0),
                              child: DottedBorder(
                                borderType: BorderType.RRect,
                                radius: Radius.circular(15),
                                strokeWidth: 1,
                                color: Color(0xff7F7F7F),
                                child: ClipRRect(
                                  borderRadius:
                                  BorderRadius.all(Radius.circular(15)),
                                  child: Container(
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
                        SizedBox(width: 20,)
                      ],
                    ),
                  ),
                  SizedBox(height: 20,),
                  Text(
                    'Image size : 113 x 113 pixels (Not more than 1 MB file size)     ',
                    style: TextStyle(
                        fontFamily: 'Roboto',
                        letterSpacing: -0.6,
                        color: Color(0xff0000000).withOpacity(0.50),
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
                            color: Color(0xff000000),
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
                            color: Color(0xff000000),
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
                            color: Color(0xff000000),
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
                            color: Color(0xff000000),
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
                                  color: Color(0xff000000),
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
                                      color: Color(0xff000000),
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
                                _selectedSubcatery = null;
                                subCategoriesListModel.subCategories =[];
                                getSubcategory(value?.id.toString(),false);
                              });
                            },
                            buttonStyleData: ButtonStyleData(
                              height: 44.adaptSize,
                              width: 240.adaptSize,
                              padding: EdgeInsets.only(left: 10.h, right: 10.h),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12),
                                border: Border.all(
                                  color: Color(0xFFDEDEDE),
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
                                  color: Color(0xff000000),
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
                                      color: Color(0xff000000),
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
                                  color: Color(0xFFDEDEDE),
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
                        'Status',
                        style: TextStyle(
                            fontFamily: 'Roboto',
                            color: Color(0xff000000),
                            fontWeight: FontWeight.w400,
                            fontSize: 12.fSize),
                      ),
                      SizedBox(width: 64.adaptSize),
                      Expanded(
                        child: DropdownButtonHideUnderline(
                          child: DropdownButton2<String>(
                            isExpanded: true,
                            // barrierColor: Colors.green,
                            hint: Text(
                              'Select',
                              style: TextStyle(
                                  fontFamily: 'Roboto',
                                  color: Color(0xff000000),
                                  fontWeight: FontWeight.w400,
                                  fontSize: 12.fSize),
                            ),
                            items: _status
                                .map((String item) => DropdownMenuItem<String>(
                              value: item,
                              child: Text(
                                item,
                                style: TextStyle(
                                    fontFamily: 'Roboto',
                                    overflow: TextOverflow.ellipsis,
                                    color: Color(0xff000000),
                                    fontWeight: FontWeight.w400,
                                    fontSize: 12.fSize),
                                overflow: TextOverflow.ellipsis,
                              ),
                            ))
                                .toList(),
                            value: _selectedStatus,
                            onChanged: (String? value) {
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
                                  color: Color(0xFFDEDEDE),
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
                        VisualDensity(horizontal: -4, vertical: -4),
                        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                        activeColor: Color(0xFF32CD30),
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
                            color: Color(0xFF000000),
                            fontWeight: FontWeight.w500,
                            fontSize: 12.fSize),
                      ),
                      SizedBox(width: 35.aw),
                      Radio(
                        visualDensity:
                        VisualDensity(horizontal: -4, vertical: -4),
                        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                        value: 'Unlock',
                        activeColor: Color(0xFF32CD30),
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
                            color: Color(0xFF000000),
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
                            VisualDensity(horizontal: -4, vertical: -4),
                            activeColor: Colors.green,
                            materialTapTargetSize:
                            MaterialTapTargetSize.shrinkWrap,
                            //checkColor: Colors.black,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(3.5),
                              side: BorderSide(
                                  color: Color(0xFF32CD30), width: 1.aw),
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
                                color: Color(0xff000000),
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
                        color: Color(0xFFD5FFD4),
                        borderRadius: BorderRadius.circular(6)),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                          width: 20.aw,
                          height: 10.ah,
                          child: Radio(
                            activeColor: Color(0xFF32CD30),
                            value: '1 Weeks',
                            groupValue: seletedWeek,
                            onChanged: (value) {
                              setState(() {
                                seletedWeek = value.toString();
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
                        Container(
                          width: 20.aw,
                          height: 10.ah,
                          child: Radio(
                            value: '2 Weeks',
                            activeColor: Color(0xFF32CD30),
                            groupValue: seletedWeek,
                            onChanged: (value) {
                              setState(() {
                                seletedWeek = value.toString();
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
                        Container(
                          width: 20.aw,
                          height: 10.ah,
                          child: Radio(
                            activeColor: Color(0xFF32CD30),
                            value: '3 Weeks',
                            groupValue: seletedWeek,
                            onChanged: (value) {
                              setState(() {
                                seletedWeek = value.toString();
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
                double lat = double.tryParse("${widget.assetDetailsModel.latitude}") ?? 0.0;
                double long = double.tryParse("${widget.assetDetailsModel.longitude}") ?? 0.0;
                LatLng latLng =LatLng(lat, long);
                var  data =   Get.to(()=> MapScreen(mylatlong: latLng,))?.then((value) {
                  if(value!=null){
                    mylatlong =value ;
                  }
                  print("dsdfgdgdgdgsd${value}");

                });

              },
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  InkWell(
                    onTap: ()async {
                      double lat = double.tryParse("${widget.assetDetailsModel.latitude}") ?? 0.0;
                      double long = double.tryParse("${widget.assetDetailsModel.longitude}") ?? 0.0;
                      LatLng latLng =LatLng(lat, long);
                      var  data =   Get.to(()=> MapScreen(mylatlong: latLng,))?.then((value) {
                        if(value!=null){
                          mylatlong = value ;
                          print("dsdfgdgdgdgsd${value}");
                        }

                      });
                    },
                    child: SvgPicture.asset(
                      'assets/icon/Subtract (1).svg',
                      width: 17.aw,
                      height: 25.ah,
                    ),
                    //Icon(Icons.location_on,size: 35,color: Color(0xFF32CD30))
                  ),
                  SizedBox(height: 5.ah),
                  Text(
                    'Tap here to add map view',
                    style: TextStyle(
                        fontFamily: 'Roboto',
                        color: Color(0xFF6C6C6C),
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
                    if(images.length + widget.assetDetailsModel.assetImages!.length == 0){
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
                    }
                    else{
                      editAssets();
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



