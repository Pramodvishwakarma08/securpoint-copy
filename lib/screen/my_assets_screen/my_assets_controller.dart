import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../api_client/api_repository.dart';
import 'my_assets_model.dart';

class MyAssetsController extends GetxController{

  final TextEditingController searchController = TextEditingController();

  TextEditingController assetNameC = TextEditingController();
  TextEditingController assetDetails = TextEditingController();
  TextEditingController assetIdentifier = TextEditingController();

  MyAssetsModel myAssetsModel = MyAssetsModel();
  RxBool isLoading =false.obs;


  getMyasset()async{
    isLoading(true);
    myAssetsModel = await ApiRepository.getMyAssets(searchController.text);
    isLoading(false);
  }


  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getMyasset();
  }


}

