
import 'package:get/get.dart';
import 'package:securepoint/api_client/api_repository.dart';
import 'PremiumPlanModel.dart';

class PremiumScreenController extends GetxController {


  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getPlans();
  }

  RxBool isLoading =false.obs;

  Plan ? plan;
  RxString ? amount  = "".obs;

  PremiumPlanModel premiumPlanModel =PremiumPlanModel();

  getPlans() async {
    isLoading(true);
    premiumPlanModel = await ApiRepository.getPremiunPlans();
    premiumPlanModel.plans?.removeAt(0);
    plan =premiumPlanModel.plans![0];
    amount!.value =premiumPlanModel.plans![0].amount.toString();
    isLoading(false);
  }



}