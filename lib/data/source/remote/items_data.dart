import 'package:e_commerce/core/class/crud.dart';
import 'package:e_commerce/core/constant/apiLinks.dart';

class ItemsData {
  Crud crud;
  ItemsData(this.crud);
  getData(String id, String userId) async {
    var resp = await crud.getOffline(AppLinks.items, {
      "id": id,
      "user_id": userId,
    });
    return resp.fold((l) => l, (r) => r);
  }
}
