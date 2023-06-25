import 'package:e_commerce/core/class/crud.dart';
import 'package:e_commerce/core/class/statusRequest.dart';
import 'package:e_commerce/data/source/remote/test_data.dart';
import 'package:get/get.dart';

import '../core/functions/handlingData.dart';

class TestController extends GetxController {
  Crud crd = Crud();
  TestData test = TestData(Get.find());
  List data = [];
  late StatusRequest statusRequest;
  getData() async {
    statusRequest = StatusRequest.loading;
    var response = await test.getData();

    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response["status"] == "success") {
        data.addAll(response["data"]);
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    print(data);
    update();
  }

  @override
  void onInit() {
    // TODO: implement onInit
    getData();
    super.onInit();
  }
}
