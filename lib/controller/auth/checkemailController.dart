import 'package:e_commerce/core/constant/nameOfRoutes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/constant/colors.dart';
import '../../core/constant/formKeys.dart';

abstract class CheckEmailController extends GetxController {
  checkEmail();
  gotoVerify();
}

class CheckEmailControllerImp extends CheckEmailController {
  late TextEditingController email;
  var state = FKeys.checkEmailKey;

  @override
  checkEmail() {
    throw UnimplementedError();
  }

  @override
  void onInit() {
    email = TextEditingController();

    super.onInit();
  }

  @override
  gotoVerify() {
     var formData = state.currentState;
    // if (formData!.validate()) {
    //   print("VALID");
    // } else {
    //   print("Invalid");
    // }
    formData!.validate() ?   Get.toNamed(AppRoutes.verifySignUP) : print("Invalid");
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

  

