import 'package:e_commerce/core/constant/nameOfRoutes.dart';
import 'package:get/get.dart';

abstract class VerifyCodeSignUpController extends GetxController {
  checkEmail();
  gotoLogin();
}

class VerifyCodeSignUpControllerImp extends VerifyCodeSignUpController {
 late String verifyCode;

  @override
  checkEmail() {}

  @override
  void onInit() {


    super.onInit();
  }

  @override
  gotoLogin() {
    Get.toNamed(AppRoutes.login);
  }
}
