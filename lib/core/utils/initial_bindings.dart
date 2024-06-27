import 'package:get/get.dart';
import 'package:securepoint/core/utils/pref_utils.dart';

import '../../api_client/api_client.dart';

class InitialBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(PrefUtils());
    Get.put(ApiClient());
   // Connectivity connectivity = Connectivity();
  //  Get.put(NetworkInfo(connectivity));
  }
}
