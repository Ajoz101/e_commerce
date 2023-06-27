import 'package:e_commerce/core/constant/nameOfRoutes.dart';
import 'package:e_commerce/core/services/services.dart';
import 'package:e_commerce/data/source/remote/home/homeData.dart';
import 'package:get/get.dart';

import '../../core/class/crud.dart';
import '../../core/class/statusRequest.dart';
import '../../core/functions/handlingData.dart';

abstract class HomeController extends GetxController {
  getData();
  signOut();
}

class HomeControllerImp extends HomeController {
  String username = sharedPref.getString("username")!;
  String email = sharedPref.getString("email")!;
  String phone = sharedPref.getString("phone")!;

  /*
   * GETTING CATEGORIES 
   */
  StatusRequest? statusRequest;
  // Crud crd = Crud();
  HomeData home = HomeData(Get.find());
  List categories = [];
  List items = [];
  @override
  getData() async {
    statusRequest = StatusRequest.loading;
    var response = await home.getData();
    print(response);
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest ||
        StatusRequest.offlineFailure == statusRequest) {
      if (response["status"] == "success") {
        categories.addAll(response["categories"]);
        items.addAll(response["items"]);
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  @override
  void onInit() {
    getData();
    super.onInit();
    update();
  }

  @override
  signOut() {
    sharedPref.remove("user");
    Get.offAllNamed(AppRoutes.login);
  }
}
