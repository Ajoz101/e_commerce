import 'package:e_commerce/core/class/crud.dart';
import 'package:e_commerce/core/constant/apiLinks.dart';

class HomeData {
  Crud crud;
  HomeData(this.crud);
  getData() async {
    var resp = await crud.getOffline(AppLinks.homePage, {});
    return resp.fold((l) => l, (r) => r);
  }

  searchData(String itemName) async {
    var resp = await crud.getOffline(AppLinks.search, {
      "item": itemName,
    });
    return resp.fold((l) => l, (r) => r);
  }
}
