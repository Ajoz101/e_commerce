import 'package:get/get.dart';

abstract class ItemsController extends GetxController {
  initalData();
  changeCat(val);
}

class ItemsControllerImp extends ItemsController {
  List categories = [];
  int? selectedCategories;

  @override
  initalData() {
    categories = Get.arguments['categories'];
    selectedCategories = Get.arguments['selectedCate'];
    // update();
  }

  @override
  void onInit() {
    initalData();
    super.onInit();
  }

  @override
  changeCat(val) {
    selectedCategories = val;
    update();
  }
}
