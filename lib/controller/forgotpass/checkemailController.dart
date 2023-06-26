import 'package:e_commerce/core/constant/nameOfRoutes.dart';
import 'package:e_commerce/data/source/remote/forgot_password/checkemailData.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/class/statusRequest.dart';
import '../../core/constant/colors.dart';
import '../../core/constant/formKeys.dart';
import '../../core/functions/handlingData.dart';

abstract class CheckEmailController extends GetxController {
  checkEmail();
  gotoVerify();
}

class CheckEmailControllerImp extends CheckEmailController {
  late TextEditingController email;
  var state = FKeys.checkEmailKey;
  late StatusRequest statusRequest;

  CheckEmailData check = CheckEmailData(Get.find());
  @override
  checkEmail() async {
    var formData = state.currentState;

    if (formData!.validate()) {
      print("Hello");
      statusRequest = StatusRequest.loading;
      var response = await check.post(
        email: email.text,
      );
      statusRequest = handlingData(response);
      if (StatusRequest.success == statusRequest) {
        if (response["status"] == "success") {
          // data.addAll(response["data"]);
          // data.add(email.text);
          Get.offNamed(AppRoutes.verifyCode, arguments: {"email": email.text});
        } else {
          showSnack("No such email", "Email invalid 😒");
          statusRequest = StatusRequest.failure;
        }
      }
      // print(data);
      update();
    } else {
      print("Invalid");
    }
    update();
  }

  @override
  void onInit() {
    email = TextEditingController();

    super.onInit();
  }

  @override
  gotoVerify() {
    // formData!.validate() ?   Get.toNamed(AppRoutes.verifySignUP) : print("Invalid");
    // if()
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
