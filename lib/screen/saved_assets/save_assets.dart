import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:securepoint/api_client/api_repository.dart';
import 'package:securepoint/screen/Widget/CommonGridViewBuilder/common_gridview.dart';
import 'package:securepoint/screen/Widget/search_textfield_widget.dart';
import 'package:securepoint/core/constants/size.dart';
import 'package:securepoint/screen/dashboard_page/scaffold_layout.dart';
import 'GetFavouriteAssetsModel.dart';

class SavedAssets extends StatefulWidget {
  const SavedAssets({super.key});

  @override
  State<SavedAssets> createState() => _SavedAssetsState();
}

class _SavedAssetsState extends State<SavedAssets> {
  SavedAssetsModel getFavouriteAssetsModel = SavedAssetsModel();

  var isLoading = false.obs;
  getSavedAssets(searchText) async {
    isLoading(true);
    getFavouriteAssetsModel = await ApiRepository.getFavouriteAssets(searchText: searchText);
    isLoading(false);
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getSavedAssets("");
  }

  @override
  Widget build(BuildContext context) {
    return ScaffoldLayout(
      activeIndex: 5,
      showFloatingActionButton: true,
      appBar: AppBar(
        leading: InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: const Icon(Icons.arrow_back_outlined,
                color: Color(0xFF6A6A6A))),
        title: Text(
          'Saved Assets',
          style: TextStyle(
              fontFamily: 'Inter',
              color: const Color(0xFF6A6A6A),
              fontWeight: FontWeight.w600,
              fontSize: 19.fSize),
          /* style: GoogleFonts.inter(
              textStyle: TextStyle(fontFamily: 'Inter',
                  color: Color(0xFF6A6A6A),fontWeight: FontWeight.w600,fontSize:19.fSize
              ),
            )*/
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        surfaceTintColor: Colors.white,
        shadowColor: Colors.black26,
        elevation: 3,
      ),
      body: ListView(
        children: [
          Padding(
            padding: EdgeInsets.only(left: 20.h, right: 20.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 10.ah),
                serchTextField(
                  context: context,
                  onChange: (p0) {
                    getSavedAssets(p0);
                  },
                ),
                SizedBox(height: 28.ah),
                Padding(
                  padding: EdgeInsets.only(left: 10.h),
                  child: Obx(
                    () => Text(
                      '${isLoading.value ? "" : getFavouriteAssetsModel.assets?.length ?? 0} Items',
                      style: TextStyle(
                          fontFamily: 'Roboto',
                          decoration: TextDecoration.underline,
                          color: const Color(0xff000000).withOpacity(0.70),
                          fontWeight: FontWeight.w500,
                          fontSize: 13.fSize),
                    ),
                  ),
                ),
                const SizedBox(height: 30),
              ],
            ),
          ),
          Obx(() => isLoading.value
              ? const Center(
                  child: CircularProgressIndicator(strokeWidth: 2,),
                )
              : getFavouriteAssetsModel.assets!.isEmpty
                  ? SizedBox(
                      height: 400.ah,
                      child: const Center(
                        child: Text("No assets to display"),
                      ))
                  : GridViewBuilderCommonAssetCard(
                      assets: getFavouriteAssetsModel.assets!)),
        ],
      ),
    );
  }
}
