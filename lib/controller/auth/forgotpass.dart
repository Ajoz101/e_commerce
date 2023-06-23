import 'package:e_commerce/core/constant/nameOfRoutes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/constant/colors.dart';

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

  showSnack() {
    const GetSnackBar(
      snackPosition: SnackPosition.TOP,
      borderRadius: 20,
      backgroundColor: AppColor.primary,
      duration: Duration(seconds: 2),
      title: "Check Your email",
      message: "A code was sent to You",
    ).show();
  }
}
