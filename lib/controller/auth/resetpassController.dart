import 'package:e_commerce/core/constant/colors.dart';
import 'package:e_commerce/core/constant/nameOfRoutes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class ResetPasswordController extends GetxController {
  checkPasswordCompat();
  gotoSuccess();
}

class ResetPasswordControllerImp extends ResetPasswordController {
  late TextEditingController password;
  late TextEditingController rePassword;

  @override
  checkPasswordCompat() {
    if (password.text != rePassword.text) {
      showSnack();
    } else {
      gotoSuccess();
    }
  }

  @override
  void onInit() {
    password = TextEditingController();
    rePassword = TextEditingController();

    super.onInit();
  }

  @override
  void dispose() {
    super.dispose();
    password.dispose();
    rePassword.dispose();
  }

  @override
  gotoSuccess() {
    Get.toNamed(AppRoutes.successReset);
    password.clear();
    rePassword.clear();
  }

  showSnack() {
    const GetSnackBar(
      snackPosition: SnackPosition.TOP,
      borderRadius: 20,
      backgroundColor: AppColor.primary,
      duration: Duration(seconds: 3),
      title: "Passwords Dont match",
      message: "Please Make Sure",
    ).show();
  }
}
