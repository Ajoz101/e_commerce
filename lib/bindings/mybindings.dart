import 'package:e_commerce/core/class/crud.dart';
import 'package:get/get.dart';

class InitalBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(Crud());
  }
}
