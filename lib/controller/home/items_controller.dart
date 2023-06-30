import 'package:e_commerce/data/source/remote/items.dart';
import 'package:get/get.dart';

import '../../core/class/crud.dart';
import '../../core/class/statusRequest.dart';
import '../../core/functions/handlingData.dart';

abstract class ItemsController extends GetxController {
  initalData();
  changeCat(val);
  getItems();
}

class ItemsControllerImp extends ItemsController {
  List categories = [];
  int? selectedCategories;
  ItemsData items = ItemsData(Get.find());
  List data = [];
  StatusRequest? statusRequest;
  Crud crd = Crud();

  @override
  getItems() async {
    statusRequest = StatusRequest.loading;
    var response = await items.getData();
    update();

    print(response);
    statusRequest = handlingData(response);
    update();
    if (StatusRequest.success == statusRequest ||
        StatusRequest.offlineFailure == statusRequest) {
      if (response["status"] == "success") {
        data.addAll(response["data"]);
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
    // update();
  }

  @override
  void onInit() {
    initalData();
    getItems();
    update();
    super.onInit();
  }

  @override
  changeCat(val) {
    selectedCategories = val;
    update();
  }
}
