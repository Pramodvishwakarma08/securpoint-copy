import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:securepoint/model/SubCategoriesListModel.dart';
import '../core/constants/app_dialogs.dart';
import '../core/utils/pref_utils.dart';
import '../model/CategoriesListModel.dart';
import '../screen/auth_and_onboard/login/LoginWithEmailModel.dart';
import '../screen/auth_and_onboard/profile/ProfileModel.dart';
import '../screen/auth_and_onboard/user_profile/UserProfileModel.dart';
import '../screen/chat/Model/LastSeenModel.dart';
import '../screen/chat/Pages/all_frined/AllFriendsModel.dart';
import '../screen/chat/Pages/all_frined/CreateChatModel.dart';
import '../screen/featured_assest_and_all_assets/AllAssetsModel.dart';
import '../screen/home_page/HomePageModel.dart';
import '../screen/my_assets_screen/my_assets_model.dart';
import '../screen/premium_plan/PremiumPlanModel.dart';
import '../screen/premium_plan/PurchasePlanModel.dart';
import '../screen/saved_assets/GetFavouriteAssetsModel.dart';
import 'api_client.dart';

class ApiRepository {
  // //get fcm token
  // static Future<String> getFCMToken() async {
  //   try {
  //     var fcmToken = await FirebaseMessaging.instance.getToken();
  //     return "$fcmToken";
  //   } catch (e) {
  //     print('Failed to get fcm token: $e');
  //     return 'Failed to get fcm token';
  //   }
  // }

  static Future<bool> forgotPassword(
      {required String email,
        required String password,
        required bool isEmail}) async {
    var data = json.encode({
      isEmail ? "email" : "phone_no": email,
    });
    final response = await ApiClient().postRequest(endPoint: "user/forgetPassword", body: data);
    if (response != null) {
      PrefUtils().setAuthToken("${LoginWithEmailModel.fromJson(response).token}");
      return true;
    }
    return false;
  }



  static Future<bool> loginWithEmailPassword(
      {required String email,
      required String password,
      required bool isEmail}) async {
    var data = json.encode({
      isEmail ? "email" : "phone_no": email,
      "password": password,
    });
    final response = await ApiClient()
        .postRequest(endPoint: "user/login", body: data);
    if (response != null) {
      PrefUtils().setAuthToken("${LoginWithEmailModel.fromJson(response).token}");
      PrefUtils().setUserId("${LoginWithEmailModel.fromJson(response).user?.id}");
      return true;
    }
    return false;
  }

  static Future<bool> loginWithNumberPassword({
    required String number,
    required String password,
  }) async {
    var data = json.encode({
      "phone_no": number,
      "password": password,
    });
    final response = await ApiClient()
        .postRequest(endPoint: "user/login", body: data);
    if (response != null) {
      PrefUtils().setAuthToken("${LoginWithEmailModel.fromJson(response).token}");
      PrefUtils().setUserId("${LoginWithEmailModel.fromJson(response).user?.id}");
      return true;
    }
    return false;
  }



  static Future<bool> signUpWithPhoneNumber({
    required String number,
  }) async {
    var data = {
      'phone_no': number,
    };
    Map<String, dynamic>? response = await ApiClient()
        .postRequest(endPoint: "user/signupByEmail", body: data);
    if (response != null) {
      AppDialog.taostMessage("${response["message"]}",);
      return true;
    } else {
      return false;
    }
  }


//http://192.168.1.25:4003

  static Future<bool> signUpWithEmail({
    required String email,
  }) async {
    var data = {
      'email': email,
    };
    Map<String, dynamic>? response = await ApiClient()
        .postRequest(endPoint: "user/signupByEmail", body: data);
    if (response != null) {
      AppDialog.taostMessage("${response["message"]}",);
      return true;
    } else {
      return false;
    }
  }






  static Future<bool> setPassWord(
      {required String email,
      required String password,
      required bool isnumber}) async {
    var data = json.encode({
      isnumber ? "phone_no" : "email": email,
      "password": password,
    });
    Map<String, dynamic>? response = await ApiClient()
        .postRequest(endPoint: "user/createPassword", body: data);
    if (response != null) {
      // AppDialog.taostMessage("${response["message"]}",);
      return true;
    } else {
      return false;
    }
  }

  static Future<bool> verifyOtpWithNumber(
      {required String number,
      required String otp,
      required bool isnumber}) async {
    var data = json
        .encode({isnumber == true ? "phone_no" : 'email': number, "otp": otp});
    Map<String, dynamic>? response = await ApiClient()
        .postRequest(endPoint: "user/verifyOtpMail", body: data);
    if (response != null) {


      // AppDialog.taostMessage("${response["message"]}",);
      return true;
    } else {
      return false;
    }
  }

  static Future<MyProfileModel> getProfile() async {
    Map<String, dynamic>? response = await ApiClient().getRequest(
      endPoint: "user/myProfile",
    );
    if (response != null) {
      return MyProfileModel.fromJson(response);
      ;
    } else {
      return MyProfileModel();
    }
  }

  static Future<GetUserByIdModel> getUserProfile(
      {required String userId}) async {
    Map<String, dynamic>? response = await ApiClient().getRequest(
      endPoint: "user/getUser/$userId",
    );
    if (response != null) {
      return GetUserByIdModel.fromJson(response);
      ;
    } else {
      return GetUserByIdModel();
    }
  }

  static Future<SavedAssetsModel> getFavouriteAssets({String ? searchText}) async {
    Map<String, dynamic>? response = await ApiClient().getRequest(
      endPoint: "user/mySavedAssets?search=$searchText",
    );
    if (response != null) {
      return SavedAssetsModel.fromJson(response);
      ;
    } else {
      return SavedAssetsModel();
    }
  }

  static Future<MyAssetsModel> getMyAssets(String searchText) async {
    Map<String, dynamic>? response = await ApiClient().getRequest(
      endPoint: "user/getMyAssets?search=$searchText",
    );
    if (response != null) {
      return MyAssetsModel.fromJson(response);
      ;
    } else {
      return MyAssetsModel();
    }
  }
 static Future<PremiumPlanModel> getPremiunPlans() async {
    Map<String, dynamic>? response = await ApiClient().getRequest(
      endPoint: "user/allPlans",
    );
    if (response != null) {
      return PremiumPlanModel.fromJson(response);
      ;
    } else {
      return PremiumPlanModel();
    }
  }

  static Future<bool> addToFavourite({required String assetId}) async {
    print("addToFavourite_line130");
    Map<String, dynamic>? response = await ApiClient().postRequest(endPoint: "/user/saveAsset/$assetId", body: {});
    if (response != null) {
      return true;
    } else {
      return false;
    }
  }

  // static Future<bool> removeFormFavourite({required String assetId}) async {
  //   var data = json.encode({"assetId": assetId, "status": "0"});
  //   Map<String, dynamic>? response = await ApiClient()
  //       .postRequest(endPoint: "userRouter/addToFavourite", body: data);
  //   if (response != null) {
  //     return true;
  //   } else {
  //     return false;
  //   }
  // }

  // Future<void> forgetPassword() async {}
  static Future<bool> editProfile({
    String? fullName,
    String? notes,
    Map<String, dynamic>? processedImage,
  }) async {
    FormData data;
    if (processedImage != null) {
      data = FormData.fromMap({
        'image': await MultipartFile.fromBytes(processedImage["file"], filename: processedImage["name"]),
        'full_name': '$fullName',
        'notes': '$notes',
        'nameStatus': '1',
      });
    } else {
      data = FormData.fromMap({
        'full_name': '$fullName',
        'notes': '$notes',
        'nameStatus': '1',
      });
    }

    //

    Map<String, dynamic>? response = await ApiClient().postRequest(
      endPoint: "user/editProfile",
      body: data,
    );
    if (response != null) {
      return true;
    } else {
      return false;
    }
  }

  // Future<void> forgetPassword() async {}
  static Future<bool> hideAndUnHide({
    required String? nameStatus,
  }) async {
    Map<String, dynamic>? response = await ApiClient().postRequest(
      endPoint: "user/editProfile",
      body: {'nameStatus': '$nameStatus'},
    );
    if (response != null) {
      return true;
    } else {
      return false;
    }
  }

  static Future<bool> detelAssets(id) async {
    var response = await ApiClient().deleteRequest(
        endPoint: "user/asset/$id", body: {});
    if (response != null) {
      return true;

    } else {
      return false;
    }
  }

  static Future<CategoriesListModel> getCategoriesList() async {
    print("categoriesList");
    var response = await ApiClient().getRequest(
      endPoint: "user/getCategories",
    );
    if (response != null) {
      print("asdfghj");
      return CategoriesListModel.fromJson(response);
      ;
    } else {
      return CategoriesListModel();
    }
  }

  static Future<AllAssetsModel> getAllAssetsWithSerchAndcategeries({required String searchText,required String page ,required String limit,required String ? categoryId,required  String ? subcategoryId,  }) async {
    //=> user/getAllAssets?search=AAA&page=1&limit=1&categoryId=1&subCategoryId=2

    String endPoint = "user/getAllAssets?search=$searchText&page=$page&limit=$limit";
    if(categoryId != ""){
        endPoint ="user/getAllAssets?search=$searchText&page=$page&limit=$limit&categoryId=$categoryId";
        if(subcategoryId != ""){
          endPoint ="user/getAllAssets?search=$searchText&page=$page&limit=$limit&categoryId=$categoryId&subCategoryId=$subcategoryId";
        }
    }
    var response = await ApiClient().getRequest(
      endPoint: endPoint,
    );
    if (response != null) {
      return AllAssetsModel.fromJson(response);
    } else {
      return AllAssetsModel();
    }
  }




  static Future<HomePageModel> homePageData(serchText) async {
    print("categoriesList");
    var response = await ApiClient().getRequest(
      endPoint: "user/homePage?search=${serchText}",
    );
    if (response != null) {
      return HomePageModel.fromJson(response);
    } else {
      return HomePageModel();
    }
  }

  static Future<AddAssetsStatusModel> getAddAssetsStatus() async {
    Map<String, dynamic>? response = await ApiClient().getRequest(
      endPoint: "user/assetStatus",
    );
    if (response != null) {
      return AddAssetsStatusModel.fromJson(response);
      ;
    } else {
      return AddAssetsStatusModel();
    }
  }


  static Future<SubCategoriesListModel> getSubCategoriesListBYid(
      {required String id}) async {
    Map<String, dynamic>? response = await ApiClient().getRequest(
      endPoint: "user/getSubCategories/$id",
    );
    //http://192.168.1.25:4003/user/getSubCategories/3
    if (response != null) {
      return SubCategoriesListModel.fromJson(response);
      ;
    } else {
      return SubCategoriesListModel();
    }
  }

  // Future<void> forgetPassword() async {}
  static Future<bool> addAssets({
    required List<Map<String, dynamic>> processedImage,
    required String AssetName,
    required String AssetDetails,
    required String AssetIdentifier,
    required String category,
    required String lockAndUnlock,
    required String subCategory,
    required String status,
    required int promote,
    required String latitude,
    required String longitude,
  }) async {
    var data = FormData.fromMap({
      'image': await [
        for (int i = 0; i < processedImage.length; i++)
          await MultipartFile.fromBytes(processedImage[i]["file"],
              filename: "${DateTime.now().microsecondsSinceEpoch}"),
      ],
      'AssetName': AssetName,
      'AssetDetails': AssetDetails,
      'AssetIdentifier': AssetIdentifier,
      'categoryId': category,
      'lock': lockAndUnlock,
      'subCategoryId': subCategory,
      'status': status,
      'promote': 1,
      'latitude': latitude,
      'longitude': longitude,
    });

    //

    Map<String, dynamic>? response = await ApiClient().postRequest(
      endPoint: "user/addAsset",
      body: data,
    );
    if (response != null) {
      AppDialog.taostMessage("${response["message"]}");
      return true;
    } else {
      return false;
    }
  }

  static Future<bool> editAssets({
    required String id,
    required List<Map<String, dynamic>> processedImage,
    required String AssetName,
    required String AssetDetails,
    required String AssetIdentifier,
    required String category,
    required String lockAndUnlock,
    required String subCategory,
    required String status,
    required String promote,
    required String latitude,
    required String longitude,
  }) async {
    var data = FormData.fromMap({
      'image': await [
        for (int i = 0; i < processedImage.length; i++)
          await MultipartFile.fromBytes(processedImage[i]["file"], filename: "${DateTime.now().microsecondsSinceEpoch}"),
      ],
      'AssetName': AssetName,
      'AssetDetails': AssetDetails,
      'AssetIdentifier': AssetIdentifier,
      'categoryId': category,
      'subCategoryId': subCategory,
      'lock': lockAndUnlock,
      'status': status,
      'promote': 1,
      'latitude': latitude,
      'longitude': longitude,
      "id" : id,

    });
    var withoutImage = FormData.fromMap({
      'AssetName': AssetName,
      'AssetDetails': AssetDetails,
      'AssetIdentifier': AssetIdentifier,
      'categoryId': category,
      'subCategoryId': subCategory,
      'lock': lockAndUnlock,
      'status': status,
      'promote': 1,
      'latitude': latitude,
      'longitude': longitude,
      "id" : id,
    });

    //

    Map<String, dynamic>? response = await ApiClient().postRequest(
      endPoint: "user/editAsset",
      body: processedImage.isEmpty ? withoutImage : data,
    );
    if (response != null) {
      AppDialog.taostMessage("${response["message"]}");
    //  getMyAssets();
      return true;
    } else {
      return false;
    }
  }

  // Future<void> forgetPassword() async {}
  static Future<bool> lockAndUnlock(
      {required String id, required String lockAndUnlock,}) async {
    var data = FormData.fromMap({'lock': lockAndUnlock, "id" : "$id"});
    Map<String, dynamic>? response = await ApiClient().postRequest(endPoint: "user/editAsset", body: data,);
    if (response != null) {
      AppDialog.taostMessage("${response["message"]}");
      return true;
    } else {
      return false;
    }
  }


//chat apis




  static Future<AllFriendsModel> getFriends() async {
    Map<String, dynamic>? response = await ApiClient().getRequest(
      endPoint: "home/friends",
    );
    if (response != null) {
      return AllFriendsModel.fromJson(response);
    }
    return AllFriendsModel();
  }

  static Future<CreateChatModel> createChat({required String userId}) async {
    Map<String, dynamic>? response =
    await ApiClient().postRequest(endPoint: "chat/$userId", body: {});
    if (response != null) {
      return CreateChatModel.fromJson(response);
    }
    return CreateChatModel();
  }



  static Future<LastSeenModel> lastSeen({required String id}) async {
    final response = await ApiClient().getRequest(
      endPoint: "user/getLastSeen/$id",
    );
    try {
      return LastSeenModel.fromJson(response);
    } catch (e, log) {
      print(e.toString());
      return LastSeenModel.fromJson(response);
    }
  }



  static Future<PurchasePlanModel> purchasePlan({required String id}) async {
    var data = {
      'planId': '$id'
    };
    final response = await ApiClient().postRequest(
        endPoint: "user/payment/purchasePlan",body: data
    );
    try {
      return PurchasePlanModel.fromJson(response);
    } catch (e, log) {
      print(e.toString());
      return PurchasePlanModel.fromJson(response);
    }
  }



}

