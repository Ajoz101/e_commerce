// ignore: file_names
import 'package:e_commerce/core/constant/nameOfRoutes.dart';
import 'package:e_commerce/data/source/remote/auth/signup.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/class/statusRequest.dart';
import '../../core/constant/colors.dart';
import '../../core/constant/formKeys.dart';
import '../../core/functions/handlingData.dart';

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

  late StatusRequest statusRequest;
  SignupData signupData = SignupData(Get.find());
  List data = [];
  @override
  signup() async {
    var formData = state.currentState;
    if (formData!.validate()) {
      statusRequest = StatusRequest.loading;
      var response = await signupData.post(
          username: username.text,
          email: email.text,
          password: password.text,
          phone: phone.text);

      statusRequest = handlingData(response);
      if (StatusRequest.success == statusRequest) {
        if (response["status"] == "success") {
          // data.addAll(response["data"]);
          data.add(email.text);
          Get.offNamed(AppRoutes.verifySignUP, arguments: {"email": email.text});
        } else {
          showSnack("Failed signing up", "Email or Phone Already in USE");
          statusRequest = StatusRequest.failure;
        }
      }
      print(data);
      update();
      // Get.offNamed(AppRoutes.checkEmail);
    } else {
      print("Invalid");
    }
  }

  @override
  void onInit() {
    email = TextEditingController();
    password = TextEditingController();
    phone = TextEditingController();
    username = TextEditingController();
    super.onInit();
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
