import 'package:e_commerce/core/services/services.dart';
import 'package:e_commerce/data/source/remote/home/homeData.dart';
import 'package:get/get.dart';

import '../../core/class/crud.dart';
import '../../core/class/statusRequest.dart';
import '../../core/functions/handlingData.dart';

abstract class HomeController extends GetxController {
  getData();
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
  @override
  getData() async {
    statusRequest = StatusRequest.loading;
    var response = await home.getData();
    print(response);
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest ||
        StatusRequest.offlineFailure == statusRequest) {
      if (response["status"] == "success") {
        print(response["categories"]);
        categories.addAll(response["categories"]);
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    print(categories);
    update();
  }

  @override
  void onInit() {
    getData();
    super.onInit();
  }
}
