import 'package:e_commerce/controller/cart/cart_controller.dart';
import 'package:e_commerce/core/constant/colors.dart';
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
  int count = 0;

  CartController cartC = Get.put(CartController());
  @override
  initalData() {
    items = Get.arguments['itemsmodel'];
  }

  buy() {
    if (count <= 0) {
      Get.snackbar("Out of Stock!", "Please stand by for more UPDATES",
          backgroundColor: AppColor.cards, snackPosition: SnackPosition.BOTTOM);
    } else {
      count--;
    }
    // items.itemsCount = count.toString();
    update();
  }

  returnBack() {
    if (count >= int.parse(items.itemsCount!)) {
    } else {
      count++;
    }
    // items.itemsCount = count.toString();
    update();
  }

  @override
  void onInit() {
    initalData();

    count = int.parse(items.itemsCount!);
    super.onInit();
  }
}
