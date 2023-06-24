// ignore: file_names
import 'package:e_commerce/core/constant/nameOfRoutes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class SignUpController extends GetxController {
  signup();
  gotoVerifySignUp();
}

class SignUpControllerImp extends SignUpController {
  late TextEditingController email;
  late TextEditingController password;
  late TextEditingController username;
  late TextEditingController phone;
  @override
  gotoVerifySignUp() {
    Get.toNamed(AppRoutes.verifySignUP);
  }

  @override
  signup() {
    Get.toNamed(AppRoutes.checkEmail);
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
