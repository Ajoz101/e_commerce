import 'package:e_commerce/core/constant/nameOfRoutes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class LoginController extends GetxController {
  login();
  goToSignUP();
  goToForgotPassword();
}

class LoginControllerImp extends LoginController {
  late TextEditingController email;
  late TextEditingController password;
  GlobalKey<FormState> state = GlobalKey<FormState>();
  @override
  login() {
    var formData = state.currentState;
    // if (formData!.validate()) {
    //   print("VALID");
    // } else {
    //   print("Invalid");
    // }
    formData!.validate() ? print("VALID") : print("Invalid");
  }

  @override
  goToSignUP() {
    Get.toNamed(AppRoutes.signup);
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
    Get.toNamed(AppRoutes.forgotpass);
  }
}
