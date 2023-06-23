import 'package:e_commerce/core/constant/nameOfRoutes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class SignUpController extends GetxController {
  signup();
  goToLogin();
}

class SignUpControllerImp extends SignUpController {
  late TextEditingController email;
  late TextEditingController password;
  late TextEditingController username;
  late TextEditingController phone;
  @override
  goToLogin() {
    Get.toNamed(AppRoutes.login);
  }

  @override
  signup() {
    throw UnimplementedError();
  }

  
  @override
  void onInit() {
    // TODO:  onInit
    email = TextEditingController();
    password = TextEditingController();
    phone = TextEditingController();
    username = TextEditingController();
    super.onInit();
  }
}
