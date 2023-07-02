import 'package:e_commerce/core/class/crud.dart';
import 'package:e_commerce/core/constant/apiLinks.dart';

class FavoriteData {
  Crud crud;
  FavoriteData(this.crud);
  addFave({String? itemId, String? userId}) async {
    var resp = await crud.getOffline(AppLinks.faveAdd, {
      "item_id": itemId,
      "user_id": userId,
    });
    return resp.fold((l) => l, (r) => r);
  }

  removeFave({String? itemId, String? userId}) async {
    var resp = await crud.getOffline(AppLinks.faveRemove, {
      "item_id": itemId,
      "user_id": userId,
    });
    return resp.fold((l) => l, (r) => r);
  }

  displayFave({String? userId}) async {
    var resp = await crud.getOffline(AppLinks.faveDisplay, {
      "user_id": userId,
    });
    return resp.fold((l) => l, (r) => r);
  }
}
