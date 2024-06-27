import 'package:get/get.dart';
import 'package:securepoint/api_client/api_repository.dart';
import '../../model/CategoriesListModel.dart';


class ViewAllCategoriesController extends GetxController{



  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getCategoriesListMethod();
  }
  CategoriesListModel categoriesListModel =CategoriesListModel() ;

  RxBool isLoading =false.obs;

  getCategoriesListMethod()async{
    isLoading(true);
    categoriesListModel = await  ApiRepository.getCategoriesList();
    isLoading(false);
  }



}