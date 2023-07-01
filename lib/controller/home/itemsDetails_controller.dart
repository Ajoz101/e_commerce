import 'package:e_commerce/data/model/items.dart';
import 'package:get/get.dart';

abstract class ItemsDetailsController extends GetxController {
  initalData();
  // changeCat(val, String cat_id);
  // getItems(String cate_id);
  // gotoDetails();
}

class DetailsItemsControllerImp extends ItemsDetailsController {
  late ItemsModel items;

  @override
  initalData() {
    items = Get.arguments['itemsmodel'];
  }

  @override
  void onInit() {
    initalData();
    super.onInit();
  }
}
