import 'package:e_commerce/core/constant/nameOfRoutes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class ForgotPassController extends GetxController {
  checkEmail();
  gotoVerifyCode();
}

class ForgotPassControllerImp extends ForgotPassController {
  late TextEditingController email;

  @override
  checkEmail() {
    throw UnimplementedError();
  }

  @override
  void onInit() {
    email = TextEditingController();

    super.onInit();
  }

  @override
  gotoVerifyCode() {
    Get.toNamed(AppRoutes.verifyCode);
  }
}
