import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:securepoint/api_client/api_repository.dart';
import '../../model/CategoriesListModel.dart';
import '../../model/SubCategoriesListModel.dart';
import '../../model/assets_model.dart';
import 'AllAssetsModel.dart';

class FeaturedController extends GetxController{



  TextEditingController searchController = TextEditingController();


  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    scrollController = ScrollController()..addListener(loadMore);
  }

  late ScrollController scrollController;


  var getAllAssetsModel0 = AllAssetsModel().obs;
  AllAssetsModel get getAllAssetsModel => getAllAssetsModel0.value;
  RxBool isLoading =false.obs;
  RxList<Asset> assets =<Asset>[].obs;



  RxInt page = 1.obs;
  RxInt  limit = 10.obs;
  RxBool hasNextPage = true.obs;
  RxBool isFirstLoadRunning = false.obs;
  RxBool isLoadMoreRunning = false.obs;



  Future<void> firstLoad() async {
    isFirstLoadRunning.value = true;
   final response = await ApiRepository.getAllAssetsWithSerchAndcategeries(searchText: searchController.text, page: '${page.value}', limit: '${limit.value}',categoryId: "${selectedCategoryName.value?.id ?? ""}",subcategoryId:"${selectedSubcatery.value?.id?? ""}" );
    getAllAssetsModel0(response);
    getAllAssetsModel0.refresh();
    assets.value =getAllAssetsModel.assets ?? <Asset>[];
    isFirstLoadRunning.value = false;
  }

  Future<void> loadMore() async {

    RxList<Asset> loadMoreAssets = <Asset>[].obs;

    if (hasNextPage.value == true &&
        isFirstLoadRunning.value == false &&
        isLoadMoreRunning.value == false &&
        scrollController.position.extentAfter < 300) {
        isLoadMoreRunning.value = true; // Display a progress indicator at the bottom
        page += 1; //
        final response = await ApiRepository.getAllAssetsWithSerchAndcategeries(searchText:searchController.text, page: '${page.value}', limit: '${limit.value}',categoryId: "${selectedCategoryName.value?.id ?? ""}",subcategoryId:"${selectedSubcatery.value?.id?? ""}");
        getAllAssetsModel0(response);
        getAllAssetsModel0.refresh();
        loadMoreAssets.value = getAllAssetsModel.assets ?? <Asset>[];
        if(loadMoreAssets.length == 0){
          print("${loadMoreAssets.length}");
          hasNextPage.value = false;
          isLoadMoreRunning.value = false; // Display a progress indicator at the bottom
        }else{
          print("loadMore_call");
          assets.addAll(loadMoreAssets);
          assets.refresh();
        }
      isLoadMoreRunning.value = false; // Display a progress indicator at the bottom

    }
  }











  CategoriesListModel categoriesListModel = CategoriesListModel();
  var isLoadingGetCategory = false.obs;
  getCategory() async {
    print("getCategoriesList_line35");
    isLoadingGetCategory(true);
    categoriesListModel = await ApiRepository.getCategoriesList();
    isLoadingGetCategory(false);
  }


  SubCategoriesListModel subCategoriesListModel = SubCategoriesListModel();
  var isLoadingSubGetCategory = false.obs;
  Future<void> getSubcategory(id) async {
    print("getCategoriesList_line35");
    isLoadingSubGetCategory(true);
    subCategoriesListModel =
    await ApiRepository.getSubCategoriesListBYid(id: id);

    isLoadingSubGetCategory(false);
  }


  Rxn<Category?>  selectedCategoryName=Rxn();
  Rxn<SubCategory?>  selectedSubcatery=Rxn();



}