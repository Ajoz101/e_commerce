import 'package:e_commerce/core/constant/nameOfRoutes.dart';
import 'package:e_commerce/core/services/services.dart';
import 'package:e_commerce/data/model/items.dart';
import 'package:e_commerce/data/source/remote/home/homeData.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../core/class/crud.dart';
import '../../core/class/statusRequest.dart';
import '../../core/functions/handlingData.dart';

abstract class HomeController extends SearchMixController {
  getData();
  gotToItems(List categories, int selectedcate, String cate_id);
  gotoFvortites();
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
  @override
  HomeData home = HomeData(Get.find());
  List categories = [];
  List items = [];
  TextEditingController? search;

  @override
  getData() async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await home.getData();
    statusRequest = handlingData(response);
    update();
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
    search = TextEditingController();
    getData();
    super.onInit();
    update();
  }

  @override
  gotToItems(List categories, int selectedcate, cate_id) {
    Get.toNamed(AppRoutes.items, arguments: {
      "categories": categories,
      "selectedCate": selectedcate,
      "category_id": cate_id
    });
  }

  @override
  gotoFvortites() {
    Get.toNamed(AppRoutes.favorites);
  }

  /*
   * search  
   */

  // search

  gotoDetails(ItemsModel itemsMod) {
    Get.toNamed(AppRoutes.itemsDetails, arguments: {"itemsmodel": itemsMod});
  }
}

class SearchMixController extends GetxController {
  StatusRequest? statusRequest;
  // Crud crd = Crud();
  HomeData home = HomeData(Get.find());
  TextEditingController? search;
  List<ItemsModel> searchedData = [];

  bool isSearched = false;
  checkSearch(String val) {
    if (val.isEmpty) {
      statusRequest = StatusRequest.none;
      isSearched = false;
    }
    update();
  }

  searchData() async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await home.searchData(search!.text);
    statusRequest = handlingData(response);
    update();
    if (StatusRequest.success == statusRequest ||
        StatusRequest.offlineFailure == statusRequest) {
      if (response["status"] == "success") {
        List responseData = response['data'];
        searchedData.addAll(responseData.map((e) => ItemsModel.fromJson(e)));
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  onSearchItems() {
    searchedData.clear();
    if (search!.text == "") {
      isSearched = false;
    } else {
      isSearched = true;
      searchData();
    }
    update();
  }
}
