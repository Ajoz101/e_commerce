import 'package:e_commerce/core/class/crud.dart';
import 'package:e_commerce/core/constant/apiLinks.dart';

class CartData {
  Crud crud;
  CartData(this.crud);
  addCart({String? itemId, String? userId}) async {
    var resp = await crud.getOffline(AppLinks.cartAdd, {
      "item_id": itemId,
      "user_id": userId,
    });
    return resp.fold((l) => l, (r) => r);
  }

  removeCart({String? itemId, String? userId}) async {
    var resp = await crud.getOffline(AppLinks.cartRemove, {
      "item_id": itemId,
      "user_id": userId,
    });
    return resp.fold((l) => l, (r) => r);
  }

  displayCart({String? userId}) async {
    var resp = await crud.getOffline(AppLinks.cartDisplay, {
      "user_id": userId,
    });
    return resp.fold((l) => l, (r) => r);
  }
}
