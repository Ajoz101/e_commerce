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
  var count = 0;

  CartController cartC = Get.put(CartController());
  @override
  initalData() async {
    items = Get.arguments['itemsmodel'];
    count = await cartC.getCount(items.itemsId!);
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
      cartC.add(items.itemsId!);
    }
    // count = count.toString();
    update();
  }

  remove() {
    if (count > 0) {
      count--;
      cartC.remove(items.itemsId!);
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
}
