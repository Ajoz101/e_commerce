import 'package:e_commerce/core/constant/nameOfRoutes.dart';
import 'package:e_commerce/view/screen/auth/verifycode_signup.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/class/statusRequest.dart';
import '../../core/constant/colors.dart';
import '../../core/constant/formKeys.dart';
import '../../core/functions/handlingData.dart';
import '../../data/source/remote/auth/verifysignup.dart';

abstract class VerifyCodeSignUpController extends GetxController {
  checkEmail();
  gotoLogin(code);
}

class VerifyCodeSignUpControllerImp extends VerifyCodeSignUpController {
  // late String verifyCode;
  late StatusRequest statusRequest;
  String email = "";
  @override
  checkEmail() {}
  VerifyCodeSignupData signupData = VerifyCodeSignupData(Get.find());

  @override
  void onInit() {
    email = Get.arguments["email"];

    super.onInit();
  }

  @override
  gotoLogin(code) async {
    // Get.arguments["email"];
    statusRequest = StatusRequest.loading;
    var response = await signupData.post(email: email, verifycode: code);

    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response["status"] == "success") {
        Get.toNamed(AppRoutes.login);
      } else {
        showSnack("Verification error",
            "code does not match the one sent to $email ");
        statusRequest = StatusRequest.failure;
      }
    }
    // print(data);
    update();
    // Get.toNamed(AppRoutes.login);
  }

  showSnack(String title, String msg) {
    GetSnackBar(
      snackPosition: SnackPosition.TOP,
      borderRadius: 20,
      backgroundColor: AppColor.primary,
      duration: Duration(seconds: 5),
      dismissDirection: DismissDirection.horizontal,
      title: title,
      message: msg,
    ).show();
  }
}
