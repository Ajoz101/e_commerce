import 'package:e_commerce/data/source/remote/cart/cart_data.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/class/statusRequest.dart';
import '../../core/constant/colors.dart';
import '../../core/functions/handlingData.dart';
import '../../core/services/services.dart';

class CartController extends GetxController {
  CartData cart = CartData(Get.find());
  StatusRequest? statusRequest;
  add(String itemId) async {
    print("hi");
    statusRequest = StatusRequest.loading;
    var response =
        await cart.addCart(userId: sharedPref.getString('id'), itemId: itemId);
    update();

    statusRequest = handlingData(response);
    update();
    if (StatusRequest.success == statusRequest ||
        StatusRequest.offlineFailure == statusRequest) {
      print(statusRequest);
      if (response["status"] == "success") {
        // Get.snackbar("Added", "To Favorites");
        print(response);
        showSnack("Added", "To Cart");
        // data.addAll(response["data"]);
        // print(data);
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  remove(String itemId) async {
    statusRequest = StatusRequest.loading;
    var response = await cart.removeCart(
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
        // data.clear();
        showSnack("Removed", "removed from cart");
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    // display();
    update();
  }

  view() {}

  getCount(String itemId) async {
    statusRequest = StatusRequest.loading;
    var response = await cart.getCount(
        userId: sharedPref.getString('id'), itemsId: itemId);
    update();

    statusRequest = handlingData(response);
    update();
    if (StatusRequest.success == statusRequest ||
        StatusRequest.offlineFailure == statusRequest) {
      print(statusRequest);
      if (response["status"] == "success") {
        var itemsCount = 0;

        itemsCount = int.parse(response["data"]);
        print(itemsCount);
        return itemsCount;
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    // display();
    update();
  }

  showSnack(String title, String sub) {
    Get.snackbar(title, sub,
        backgroundColor: AppColor.primary,
        colorText: AppColor.white,
        dismissDirection: DismissDirection.horizontal,
        duration: Duration(milliseconds: 700));
  }
}
