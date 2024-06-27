import 'package:get/get.dart';

import '../../api_client/api_repository.dart';
import '../featured_assest_and_all_assets/AllAssetsModel.dart';

class AssetsDetailsController extends GetxController{




  AllAssetsModel allAssetsModel =AllAssetsModel();
  var isLoading = false.obs;
  getRelaredAssets(String categoryId) async {
    isLoading(true);
    allAssetsModel =  await ApiRepository.getAllAssetsWithSerchAndcategeries(searchText: "", page: '1', limit: '8', categoryId: '1', subcategoryId: '');
    isLoading(false);
  }






}