import 'package:e_commerce/core/constant/nameOfRoutes.dart';
import 'package:e_commerce/data/source/remote/forgot_password/verifyForgotPassData.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/class/statusRequest.dart';
import '../../core/constant/colors.dart';
import '../../core/functions/handlingData.dart';

abstract class VerifyCodeController extends GetxController {
  checkEmail();
  gotoResetPass(code);
}

class VerifyCodeControllerImp extends VerifyCodeController {
  late String verifyCode;
  VerifyForgotPasswordData verifyForgot = VerifyForgotPasswordData(Get.find());
  String email = "";
  @override
  checkEmail() {}

  @override
  void onInit() {
    email = Get.arguments["email"];
    super.onInit();
  }

  late StatusRequest statusRequest;

  @override
  gotoResetPass(code) async {
    // Get.arguments["email"];
    statusRequest = StatusRequest.loading;
    var response = await verifyForgot.post(email: email, verify: code);

    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response["status"] == "success") {
        Get.offNamed(AppRoutes.resetPass, arguments: {"email": email});
      } else {
        showSnack("Verification error",
            "code does not match the one sent to $email ");
        statusRequest = StatusRequest.failure;
      }
    }
  }

  showSnack(String title, String msg) {
    GetSnackBar(
      snackPosition: SnackPosition.TOP,
      borderRadius: 20,
      backgroundColor: AppColor.primary,
      duration: const Duration(seconds: 5),
      dismissDirection: DismissDirection.horizontal,
      title: title,
      message: msg,
    ).show();
  }
}
