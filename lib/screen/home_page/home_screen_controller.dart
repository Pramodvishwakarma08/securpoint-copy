import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:securepoint/api_client/api_repository.dart';
import '../../model/CategoriesListModel.dart';
import 'HomePageModel.dart';

class HomeScreenController extends GetxController{

  CategoriesListModel getCategoryListWithCountModel =CategoriesListModel();

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getHome();
  }

  TextEditingController serchController =TextEditingController();

  HomePageModel homePageModel = HomePageModel();
  RxBool isLoading =false.obs;
  Future<void> getHome() async {
    isLoading(true);
    homePageModel = await ApiRepository.homePageData(serchController.text);
    isLoading(false);
  }


}