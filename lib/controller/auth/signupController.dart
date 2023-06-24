// ignore: file_names
import 'package:e_commerce/core/constant/nameOfRoutes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/constant/formKeys.dart';

abstract class SignUpController extends GetxController {
  signup();
  gotoLogin();
}

class SignUpControllerImp extends SignUpController {
  late TextEditingController email;
  late TextEditingController password;
  late TextEditingController username;
  late TextEditingController phone;

  //Key
  // GlobalKey<FormState> state = GlobalKey<FormState>();
  var state = FKeys.signUpKey;

  @override
  gotoLogin() {
    Get.offNamed(AppRoutes.login);
  }

  @override
  signup() {
    var formData = state.currentState;
    formData!.validate()
        ? Get.offNamed(AppRoutes.checkEmail)
        : print("Invalid");
  }

  @override
  void onInit() {
    email = TextEditingController();
    password = TextEditingController();
    phone = TextEditingController();
    username = TextEditingController();
    super.onInit();
  }
}
