import 'package:get/get.dart';
import '../../../../api_client/api_repository.dart';
import 'AllFriendsModel.dart';
import 'CreateChatModel.dart';

class AllFriendController extends GetxController {
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();

  }


  AllFriendsModel allFriendsModel = AllFriendsModel();




  RxBool isLoading =false.obs;
  getAllFriends() async {
    isLoading.value =true;
    allFriendsModel = await ApiRepository.getFriends();
    isLoading.value =false;
  }

  CreateChatModel createChatModel = CreateChatModel();
  RxBool isLoadingCreateChat =false.obs;

   createChat({required String userid }) async {
     isLoadingCreateChat.value =true;
      createChatModel = await ApiRepository.createChat(userId: userid);
     isLoadingCreateChat.value =false;
  }



}
