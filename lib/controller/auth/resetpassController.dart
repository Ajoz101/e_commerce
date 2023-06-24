import 'package:e_commerce/core/constant/colors.dart';
import 'package:e_commerce/core/constant/nameOfRoutes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/constant/formKeys.dart';

abstract class ResetPasswordController extends GetxController {
  checkPasswordCompat();
  gotoSuccess();
}

class ResetPasswordControllerImp extends ResetPasswordController {
  late TextEditingController password;
  late TextEditingController rePassword;
  var state = FKeys.resetPasswordKey;

  @override
  checkPasswordCompat() {
    var formData = state.currentState;

    if (password.text != rePassword.text) {
      showSnack();
    } else {
      formData!.validate() ? gotoSuccess() : print("Invalid");
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
    Get.offAllNamed(AppRoutes.successReset);
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
