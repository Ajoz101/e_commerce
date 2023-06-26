import 'package:e_commerce/core/constant/formKeys.dart';
import 'package:e_commerce/core/constant/nameOfRoutes.dart';
import 'package:e_commerce/data/source/remote/auth/loginData.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/class/statusRequest.dart';
import '../../core/constant/colors.dart';
import '../../core/functions/handlingData.dart';

abstract class LoginController extends GetxController {
  login();
  goToSignUP();
  goToForgotPassword();
}

class LoginControllerImp extends LoginController {
  late TextEditingController email;
  late TextEditingController password;
  // GlobalKey<FormState> state = GlobalKey<FormState>();
  var state = FKeys.loginKey;

  StatusRequest? statusRequest;
  LoginData signupData = LoginData(Get.find());
  @override
  login() async {
    var formData = state.currentState;
    if (formData!.validate()) {
      statusRequest = StatusRequest.loading;
      update();
      var response = await signupData.post(
        email: email.text,
        password: password.text,
      );

      statusRequest = handlingData(response);
      if (StatusRequest.success == statusRequest) {
        if (response["status"] == "success") {
          // data.addAll(response["data"]);
          // data.add(email.text);
          Get.offNamed(AppRoutes.home);
        } else {
          showSnack("Failed Sign In ", "Email or Phone Already are invalid 😒");
          statusRequest = StatusRequest.failure;
        }
      }
      // print(data);
      update();
      // Get.offNamed(AppRoutes.checkEmail);
    } else {
      print("Invalid");
    }
  }

  @override
  goToSignUP() {
    Get.offAllNamed(AppRoutes.signup);
  }

  @override
  void onInit() {
    email = TextEditingController();
    password = TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    super.dispose();
    email.dispose();
    password.dispose();
  }

  @override
  goToForgotPassword() {
    Get.offAllNamed(AppRoutes.forgotpass);
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
