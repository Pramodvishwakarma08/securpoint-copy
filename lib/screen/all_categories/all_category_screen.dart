import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:securepoint/screen/Widget/custom_image_view.dart';
import 'package:securepoint/core/constants/size.dart';
import 'package:securepoint/screen/dashboard_page/scaffold_layout.dart';
import '../filtere_assets_by_categories_screen/fillter_assets_screen.dart';
import 'all_category_controller.dart';

class AllCategories extends StatefulWidget {
  const AllCategories({super.key});

  @override
  State<AllCategories> createState() => _AllCategoriesState();
}

class _AllCategoriesState extends State<AllCategories> {

  ViewAllCategoriesController controller = Get.put(ViewAllCategoriesController());

  bool isList = true;

  @override
  Widget build(BuildContext context) {
    return ScaffoldLayout(
        appBar: AppBar(
          leading: InkWell(
              onTap: () {
                Get.back();
              },
              child: Icon(Icons.arrow_back_outlined, color: Color(0xFF6A6A6A))),
          title: Text(
            'All Categories',
            style: TextStyle(
                fontFamily: 'Inter',
                color: Color(0xFF6A6A6A),
                fontWeight: FontWeight.w600,
                fontSize: 19.fSize),
            /* style: TextStyle(fontFamily: 'Inter',
                color: Color(0xFF6A6A6A),fontWeight: FontWeight.w600,fontSize:20.fSize
            ),*/
          ),
          actions: [
            Padding(
              padding: EdgeInsets.only(right: 25.h),
              child: InkWell(
                  onTap: () {
                    isList = !isList;
                    setState(() {});
                  },
                  child: isList
                      ? SvgPicture.asset('assets/icon/grid.svg')
                      : SvgPicture.asset('assets/icon/listtt.svg')),
            )
          ],
          centerTitle: true,
          backgroundColor: Colors.white,
          surfaceTintColor: Colors.white,
          shadowColor: Colors.black26,
          elevation: 3,
        ),
        body: Obx(
          ()=> controller.isLoading.value ? Center(child: CircularProgressIndicator(strokeWidth: 2,),) : Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Expanded(child: isList ? allCategry() : AllCatGrid()
                  //AllCatg()
                  )
            ],
          ),
        ),
        showFloatingActionButton: true, activeIndex: 12,);
  }

  Widget allCategry() {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: 179.ah,
        child: ListView.builder(
          shrinkWrap: true,
          scrollDirection: Axis.vertical,
          itemCount: controller.categoriesListModel.categories?.length ??
              0,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.all(12.0),
              child: InkWell(
                onTap: () {
                  Get.to(()=>FilteredAssetsScreen(categreyID: controller.categoriesListModel.categories![index],));
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    CustomImageView(
                        radius: BorderRadius.circular(10),
                        imagePath: controller.categoriesListModel
                            .categories?[index].categoryImage,
                        width: 127.aw,
                        height: 100.ah,
                        fit: BoxFit.cover),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            '${controller.categoriesListModel.categories?[index].categoryName}'.capitalizeFirst!,
                            style: TextStyle(
                              color: Color(0xFF3F423F),
                              fontWeight: FontWeight.w600,
                              fontSize: 14.fSize,
                            ),
                          ),
                          Text(
                            '${controller.categoriesListModel.categories?[index].count} items',
                            style: TextStyle(
                              color: Color(0xFF000000).withOpacity(0.50),
                              fontWeight: FontWeight.w400,
                              fontSize: 12.fSize,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  Widget AllCatGrid() {
    return Padding(
      padding: EdgeInsets.only(left: 45.aw,right: 45.aw,top: 20.ah),
      child: GridView.builder(
          shrinkWrap: true,
          itemCount: controller.categoriesListModel.categories?.length ?? 0,
          gridDelegate:  SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisExtent: 147.ah,
              mainAxisSpacing: 20,
              crossAxisSpacing: 40.aw),
          itemBuilder: (context, index) {
            return InkWell(
              onTap: () {
                Get.to(()=>FilteredAssetsScreen(categreyID: controller.categoriesListModel.categories![index],));

              },
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  CustomImageView(
                      width: double.infinity,
                      height: 98.ah,
                      radius: BorderRadius.circular(10),
                      imagePath: controller.categoriesListModel
                          .categories?[index].categoryImage,
                      fit: BoxFit.cover),
                  SizedBox(height: 5.ah,),
                  Padding(
                    padding: const EdgeInsets.only(left: 5.0),
                    child: Text(
                      '${controller.categoriesListModel.categories?[index].categoryName}'.capitalizeFirst!,
                      style: TextStyle(
                        color: Color(0xFF3F423F),
                        fontWeight: FontWeight.w600,
                        fontSize: 14.fSize,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 5.0),
                    child: Text(
                      '${controller.categoriesListModel.categories?[index].id} items',
                      style: TextStyle(
                        color: Color(0xFF000000).withOpacity(0.50),
                        fontWeight: FontWeight.w400,
                        fontSize: 12.fSize,
                      ),
                    ),
                  ),
                ],
              ),
            );
          }),
    );
  }
}
