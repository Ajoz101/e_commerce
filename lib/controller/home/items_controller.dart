import 'package:get/get.dart';

abstract class ItemsController extends GetxController {
  initalData();
}

class ItemsControllerImp extends ItemsController {
  List categories = [];
  int selectedCategories = 0;

  @override
  initalData() {
    categories = Get.arguments['categories'];
    selectedCategories = Get.arguments['selectedCate'];
    update();
  }

  @override
  void onInit() {
    initalData();
    super.onInit();
  }
}
