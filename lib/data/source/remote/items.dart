import 'package:e_commerce/core/class/crud.dart';
import 'package:e_commerce/core/constant/apiLinks.dart';

class ItemsData {
  Crud crud;
  ItemsData(this.crud);
  getData() async {
    var resp = await crud.getOffline(AppLinks.items, {});
    return resp.fold((l) => l, (r) => r);
  }
}
