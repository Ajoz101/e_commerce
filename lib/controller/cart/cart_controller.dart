import 'package:e_commerce/data/model/cart_model.dart';
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
        showSnack("Added", "To Cart");
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

  view() async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await cart.displayCart(userId: sharedPref.getString('id'));
    statusRequest = handlingData(response);
    update();
    if (StatusRequest.success == statusRequest ||
        StatusRequest.offlineFailure == statusRequest) {
      if (response["status"] == "success") {
        List dataResp = response['datacart'];
        data.addAll(dataResp.map((e) => CartModel.fromJson(e)));
        Map dataCountAndPrice = response["countAndPrice"];
        totalCountItems = int.parse(dataCountAndPrice['counts']);
        priceOrders = double.parse(dataCountAndPrice['itemstotal']);
      }
      // print("DATA ${data.first}");
      else {
        statusRequest = StatusRequest.empty;
      }
    }
    update();
  }

  List<CartModel> data = [];

  double priceOrders = 0;
  int totalCountItems = 0;
  @override
  void onInit() {
    view();
    super.onInit();
  }

  resetItem() {
    priceOrders = 0.0;
    totalCountItems = 0;
    data.clear();
  }

  refreshPage() {
    resetItem();
    view();
  }

  /*
   * Cart card additions
   */

  double heightOfContainer = Get.width / 3.3;
  bool isReadMore = false;
  readMore() {
    isReadMore = !isReadMore;
    if (isReadMore == true) {
      heightOfContainer = Get.width / 2.2;
    } else {
      heightOfContainer = Get.width / 3.3;
    }

    update(null, true);
  }
}
