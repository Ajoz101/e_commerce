import 'package:e_commerce/core/constant/colors.dart';
import 'package:e_commerce/core/constant/nameOfRoutes.dart';
import 'package:e_commerce/core/services/services.dart';
import 'package:e_commerce/data/source/remote/favorite/favorite_data.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../core/class/statusRequest.dart';
import '../../core/functions/handlingData.dart';

class FavoriteController extends GetxController {
  //key -> ID of items
  //value -> is it added or not (1 or 0)
  Map isFavorite = {};

  setFavorite(id, val) {
    isFavorite[id] = val;
    update();
  }

  FavoriteData fave = FavoriteData(Get.find());
  List data = [];
  StatusRequest? statusRequest;

  addFave(String itemId) async {
    statusRequest = StatusRequest.loading;
    var response =
        await fave.addFave(userId: sharedPref.getString('id'), itemId: itemId);
    update();

    statusRequest = handlingData(response);
    update();
    if (StatusRequest.success == statusRequest ||
        StatusRequest.offlineFailure == statusRequest) {
      print(statusRequest);
      if (response["status"] == "success") {
        // Get.snackbar("Added", "To Favorites");
        showSnack("Added", "To Favorites");
        // data.addAll(response["data"]);
        // print(data);

      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  removeFave(String itemId, String itemName) async {
    statusRequest = StatusRequest.loading;
    var response = await fave.removeFave(
        userId: sharedPref.getString('id'), itemId: itemId);
    update();

    statusRequest = handlingData(response);
    update();
    if (StatusRequest.success == statusRequest ||
        StatusRequest.offlineFailure == statusRequest) {
      print(statusRequest);
      if (response["status"] == "success") {
        // data.addAll(response["data"]);
        // print(data);
        data.clear();
        showSnack("Removed", "$itemName Was removed");
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    display();
    update();
  }

  display() async {
    if (Get.currentRoute != AppRoutes.items) {
      data.clear();
      statusRequest = StatusRequest.loading;
      var response = await fave.displayFave(userId: sharedPref.getString('id'));

      statusRequest = handlingData(response);
      update();
      if (StatusRequest.success == statusRequest ||
          StatusRequest.offlineFailure == statusRequest) {
        print(statusRequest);
        if (response["status"] == "success") {
          data.addAll(response["data"]);
          print(data);
          // showSnack("Removed", "$itemName Was removed");

        } else {
          statusRequest = StatusRequest.failure;
        }
      }
    }
    update();
  }

  showSnack(String title, String sub) {
    Get.snackbar(title, sub,
        backgroundColor: AppColor.primary,
        colorText: AppColor.white,
        dismissDirection: DismissDirection.horizontal,
        duration: Duration(milliseconds: 700));
  }

  @override
  void onInit() {
    display();
    super.onInit();
  }

  @override
  void onClose() {
    dispose();
    super.onClose();
  }
}
