import 'package:e_commerce/core/class/crud.dart';
import 'package:e_commerce/core/constant/apiLinks.dart';

class TestData {
  Crud crud;
  TestData(this.crud);
  getData() async {
    var resp = await crud.postData(AppLinks.test, {});
    return resp.fold((l) => l, (r) => r);
  }
}
