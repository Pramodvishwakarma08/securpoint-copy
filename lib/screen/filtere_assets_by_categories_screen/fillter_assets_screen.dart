import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:securepoint/core/constants/size.dart';
import '../../model/CategoriesListModel.dart';
import '../../model/SubCategoriesListModel.dart';
import '../Widget/CommonGridViewBuilder/common_gridview.dart';
import '../dashboard_page/scaffold_layout.dart';
import 'filter_assets_controller.dart';

class FilteredAssetsScreen extends StatefulWidget {
  final Category categreyID;
 const FilteredAssetsScreen({super.key, required this.categreyID});

  @override
  State<FilteredAssetsScreen> createState() => _FilteredAssetsScreenState();
}

class _FilteredAssetsScreenState extends State<FilteredAssetsScreen> {

  FilterAssetController controller =Get.put(FilterAssetController());


  onall(){

    controller.selectedSubcatery.value=null;
    controller.subCategoriesListModel.subCategories =[];
    controller.getSubcategory(widget.categreyID.id.toString());
    controller.page.value = 1;
    controller.hasNextPage.value = true;
    controller.firstLoad(categoryId01: "${widget.categreyID.id}");
  }


  @override
  void initState() {
    super.initState();
  //  controller.selectedCategoryName.value = widget.categreyID;

    onall();
  }


  @override
  Widget build(BuildContext context) {
    return ScaffoldLayout(
      activeIndex: 8,
      appBar: AppBar(
          leading: InkWell(
              onTap: () {
                Navigator.pop(context);
              },
              child:const Icon(Icons.arrow_back_outlined, color: Color(0xFF6A6A6A))),
          title: Text(
            'Filtered Assets',
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
      showFloatingActionButton: true,
      showBottomAppBar: true,
      body: ListView(
        controller: controller.scrollController,
        children: [

          Padding(
            padding:  EdgeInsets.all(30.aw),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Obx(() => controller.isLoadingGetCategory.value ?  Container():  Expanded(
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton2<Category>(
                      isExpanded: true,
                      // barrierColor: Colors.green,
                      hint: Text(
                        'All Categories',
                        style: TextStyle(
                            fontFamily: 'Roboto',
                            color: Color(0xff000000),
                            fontWeight: FontWeight.w500,
                            fontSize: 13.fSize),
                      ),
                      items: controller.categoriesListModel.categories?.map((var item) {
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
                      value: controller.selectedCategoryName.value,
                      onChanged: (var value) {
                        setState(() {
                          controller.selectedCategoryName.value = value;
                          controller.selectedSubcatery.value=null;
                          controller.subCategoriesListModel.subCategories =[];
                          controller.getSubcategory(value?.id.toString());
                          controller.page.value = 1;
                          controller.hasNextPage.value = true;
                          controller.firstLoad();
                        });
                      },
                      buttonStyleData: ButtonStyleData(
                        height: 31.adaptSize,
                        padding: EdgeInsets.only(left: 10.h, right: 10.h),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: Color(0xFFDEDEDE).withOpacity(0.50),
                        ),
                      ),

                      dropdownStyleData: DropdownStyleData(
                        maxHeight: 250.ah,
                        width: 160.adaptSize,
                        isFullScreen: false,
                        offset: const Offset(0, 0),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),),

                SizedBox(width: 28.aw,),

                Obx(() => controller.isLoadingSubGetCategory.value ?  Container(width:200 ,):   Expanded(
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton2<SubCategory>(
                      isExpanded: true,
                      hint: Text(
                        'All Subcategories',
                        style: TextStyle(
                            fontFamily: 'Roboto',
                            color: Color(0xff000000),
                            fontWeight: FontWeight.w500,
                            fontSize: 13.fSize),
                      ),
                      items: controller.subCategoriesListModel.subCategories?.map((var item) {
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
                      value: controller.selectedSubcatery.value,
                      onChanged: (var value) {
                        setState(() {
                          controller.selectedSubcatery.value = value;
                          controller.page.value=1;
                          controller.firstLoad();
                        });
                      },
                      buttonStyleData: ButtonStyleData(
                        height: 31.adaptSize,
                        width: 157.adaptSize,
                        padding: EdgeInsets.only(left: 10.h, right: 10.h),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: Color(0xFFDEDEDE).withOpacity(0.50),
                        ),
                      ),

                      dropdownStyleData: DropdownStyleData(
                        maxHeight: 250.ah,
                        width: 175.adaptSize,
                        isFullScreen: false,
                        offset: const Offset(0, 0),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),),

              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 30.aw),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Obx(
                      () => Text(
                    '${controller.isLoading.value ? 0 : controller.getAllAssetsModel.count} items',
                    style: TextStyle(
                        decoration: TextDecoration.underline,
                        decorationColor:
                        Color(0xff263238).withOpacity(0.70),
                        color: Color(0xff263238).withOpacity(0.70),
                        fontWeight: FontWeight.w500,
                        fontSize: 13.fSize),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 10,),
          Obx(
                () => controller.isFirstLoadRunning.value
                ? const Center(
              child: CircularProgressIndicator(strokeWidth: 2,),
            )
                : Obx(
                  () => SizedBox(
                  child: controller.isLoading.value
                      ? const Center(
                    child: Text(""),
                  )
                      : Obx(
                        () {
                      return GridViewBuilderCommonAssetCard(
                          assets: controller.assets.value);
                    },
                  )),
            ),
          ),
          Obx(() => controller.hasNextPage.value == false
              ? Container(
            height: 180,
            padding: const EdgeInsets.only(top: 30, bottom: 40),
            child: const Center(
              child: Text('No more assets found...!'),
            ),
          )
              : const SizedBox()),
          Obx(() => controller.isLoadMoreRunning.value == true
              ? const SizedBox(
            height: 180,
            child: Padding(
              padding: EdgeInsets.only(top: 10, bottom: 40),
              child: Center(
                child: CircularProgressIndicator(strokeWidth: 2),
              ),
            ),
          )
              : Container()),
          const SizedBox(
            height: 140,
          )
        ],
      ),
    );
  }

}






