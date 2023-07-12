import 'package:e_commerce/controller/home/home_controller.dart';
import 'package:e_commerce/core/constant/nameOfRoutes.dart';
import 'package:e_commerce/core/services/services.dart';
import 'package:e_commerce/data/model/items.dart';
import 'package:e_commerce/data/source/remote/items_data.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../core/class/crud.dart';
import '../../core/class/statusRequest.dart';
import '../../core/functions/handlingData.dart';

abstract class ItemsController extends SearchMixController {
  initalData();
  changeCat(val, String cat_id);
  getItems(String cate_id);
  gotoDetails(ItemsModel itemsMod);
}

class ItemsControllerImp extends ItemsController {
  List categories = [];
  int? selectedCategories;
  ItemsData items = ItemsData(Get.find());
  List data = [];
  StatusRequest? statusRequest;
  Crud crd = Crud();

  String? catId;

  bool? isFave;
  @override
  getItems(cate_id) async {
    statusRequest = StatusRequest.loading;
    var response = await items.getData(cate_id, sharedPref.getString('id')!);
    update();

    statusRequest = handlingData(response);
    update();
    if (StatusRequest.success == statusRequest ||
        StatusRequest.offlineFailure == statusRequest) {
      print(statusRequest);
      if (response["status"] == "success") {
        data.addAll(response["data"]);
        // print(data);
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  @override
  initalData() {
    categories = Get.arguments['categories'];
    selectedCategories = Get.arguments['selectedCate'];
    // categories.insert(0, categories);
    catId = Get.arguments['category_id'];

    // update();
  }

  @override
  void onInit() {
    search = TextEditingController();
    initalData();
    getItems(catId!);
    update();

    super.onInit();
  }

  @override
  changeCat(val, String cat_id) {
    selectedCategories = val;
    data.clear();
    getItems(cat_id.toString());
    update();
  }

  @override
  gotoDetails(ItemsModel itemsMod) {
    Get.toNamed(AppRoutes.itemsDetails, arguments: {"itemsmodel": itemsMod});
  }
}
