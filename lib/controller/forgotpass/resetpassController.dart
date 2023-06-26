import 'package:e_commerce/core/constant/colors.dart';
import 'package:e_commerce/core/constant/nameOfRoutes.dart';
import 'package:e_commerce/data/source/remote/forgot_password/resetPasswordData.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/class/statusRequest.dart';
import '../../core/constant/formKeys.dart';
import '../../core/functions/handlingData.dart';

abstract class ResetPasswordController extends GetxController {
  checkPasswordCompat();
  gotoSuccess();
}

class ResetPasswordControllerImp extends ResetPasswordController {
  late TextEditingController password;
  late TextEditingController rePassword;
  var state = FKeys.resetPasswordKey;

  ResetPasswordData reset = ResetPasswordData(Get.find());
  late StatusRequest statusRequest;

  String email = '';
  @override
  checkPasswordCompat() {
    var formData = state.currentState;

    if (password.text != rePassword.text) {
      showSnack("passwords dont match", "Make Sure");
    } else {
      formData!.validate() ? gotoSuccess() : print("Invalid");
    }
  }

  @override
  void onInit() {
    password = TextEditingController();
    rePassword = TextEditingController();
    email = Get.arguments["email"];
    super.onInit();
  }

  @override
  void dispose() {
    super.dispose();
    password.dispose();
    rePassword.dispose();
  }

  @override
  gotoSuccess() async {
    statusRequest = StatusRequest.loading;
    var response = await reset.post(email: email, password: password.text);
    statusRequest = handlingData(response);
    print("-========================= $statusRequest and $email");
    if (StatusRequest.success == statusRequest) {
      if (response["status"] == "success") {
        // data.addAll(response["data"]);
        // data.add(email.text);
        Get.offNamed(AppRoutes.successReset);
      } else {
        showSnack("Unknown Error", "Hellosdd");
        statusRequest = StatusRequest.failure;
      }
    }
    // print(data);
    update();

    // password.clear();
    // rePassword.clear();
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
