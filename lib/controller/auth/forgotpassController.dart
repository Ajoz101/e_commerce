import 'package:e_commerce/core/constant/nameOfRoutes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/constant/colors.dart';
import '../../core/constant/formKeys.dart';

abstract class ForgotPassController extends GetxController {
  checkEmail();
  gotoVerifyCode();
}

class ForgotPassControllerImp extends ForgotPassController {
  late TextEditingController email;
  var state = FKeys.forgotPassword;

  @override
  checkEmail() {
    throw UnimplementedError();
  }

  @override
  void onInit() {
    email = TextEditingController();

    super.onInit();
  }

  check() {}

  @override
  gotoVerifyCode() {
    var formData = state.currentState;
    // if (formData!.validate()) {
    //   print("VALID");
    // } else {
    //   print("Invalid");
    // }
    formData!.validate()
        ? showSnack().then(Future.delayed(
            Duration(seconds: 2), () => Get.offNamed(AppRoutes.verifyCode)))
        : print("Invalid");
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
