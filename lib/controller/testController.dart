import 'package:e_commerce/core/class/crud.dart';
import 'package:e_commerce/data/source/remote/test_data.dart';
import 'package:get/get.dart';

class TestController extends GetxController {
  Crud crd = Crud();
  TestData test = TestData(Get.find());
}
