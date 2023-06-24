import 'package:e_commerce/core/constant/nameOfRoutes.dart';
import 'package:get/get.dart';

abstract class SuccessResetController extends GetxController {
  gotologin();
}

class SuccessResetControllerImp extends SuccessResetController {
  @override
  gotologin() {
    Get.toNamed(AppRoutes.login);
  }
}
