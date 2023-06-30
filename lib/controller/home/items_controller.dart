import 'package:e_commerce/data/source/remote/items.dart';
import 'package:get/get.dart';

import '../../core/class/crud.dart';
import '../../core/class/statusRequest.dart';
import '../../core/functions/handlingData.dart';

abstract class ItemsController extends GetxController {
  initalData();
  changeCat(val, String cat_id);
  getItems(String cate_id);
}

class ItemsControllerImp extends ItemsController {
  List categories = [];
  int? selectedCategories;
  ItemsData items = ItemsData(Get.find());
  List data = [];
  StatusRequest? statusRequest;
  Crud crd = Crud();

  String? catId;

  @override
  getItems(cate_id) async {
    statusRequest = StatusRequest.loading;
    var response = await items.getData(cate_id);
    update();

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
    // categories.insert(0, categories);
    catId = Get.arguments['category_id'];
    // update();
  }

  @override
  void onInit() {
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
}
