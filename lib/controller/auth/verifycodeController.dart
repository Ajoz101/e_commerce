import 'package:e_commerce/core/constant/nameOfRoutes.dart';
import 'package:get/get.dart';

abstract class VerifyCodeController extends GetxController {
  checkEmail();
  gotoResetPass();
}

class VerifyCodeControllerImp extends VerifyCodeController {
 late String verifyCode;

  @override
  checkEmail() {}

  @override
  void onInit() {


    super.onInit();
  }

  @override
  gotoResetPass() {
    Get.offNamed(AppRoutes.resetPass);
  }
}
