import 'package:e_commerce/controller/cart/cart_controller.dart';
import 'package:e_commerce/core/constant/colors.dart';
import 'package:e_commerce/data/model/items.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/class/statusRequest.dart';
import '../../core/constant/nameOfRoutes.dart';
import '../../core/functions/handlingData.dart';
import '../../core/services/services.dart';
import '../../data/model/cart_model.dart';
import '../../data/source/remote/cart/cart_data.dart';

abstract class ItemsDetailsController extends GetxController {
  initalData();
  // changeCat(val, String cat_id);
  // getItems(String cate_id);
  // gotoDetails();
  gotoCart();
}

class DetailsItemsControllerImp extends ItemsDetailsController {
  late ItemsModel items;
  var count = 0;
  CartData cart = CartData(Get.find());

  // CartController cartC = Get.put(CartController());
  @override
  initalData() async {
    items = Get.arguments['itemsmodel'];
    count = await getCount(items.itemsId!);
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

  buy() {
    if (count >= int.parse(items.itemsCount!)) {
      Get.snackbar("Out of Stock!", "Please stand by for more UPDATES",
          backgroundColor: AppColor.cards, snackPosition: SnackPosition.TOP);
      count;
    } else {
      // Get.snackbar("Out of Stock!", "Please stand by for more UPDATES",
      //   backgroundColor: AppColor.cards, snackPosition: SnackPosition.BOTTOM);
      count++;
      add(items.itemsId!);
    }
    // count = count.toString();
    update();
  }

  remove() {
    if (count > 0) {
      count--;
      delete(items.itemsId!);
    } else {
      count;
    }
    // items.itemsCount = count.toString();
    update();
  }

  @override
  void onInit() {
    initalData();

    // count = int.parse(items.itemsCount!);
    update();
    super.onInit();
  }

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

  delete(String itemId) async {
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
  gotoCart() {
    Get.toNamed(AppRoutes.cart);
  }
}
