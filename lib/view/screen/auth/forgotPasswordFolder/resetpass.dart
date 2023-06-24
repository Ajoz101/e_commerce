import 'package:e_commerce/controller/auth/resetpassController.dart';
import 'package:e_commerce/view/widget/auth/customBottomAuth.dart';
import 'package:e_commerce/view/widget/auth/customTextBody.dart';
import 'package:e_commerce/view/widget/auth/cutsomTextTitle.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../controller/auth/forgotpass.dart';
import '../../../widget/auth/customTextFormField.dart';

class ResetPassword extends StatelessWidget {
  const ResetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var controller = Get.put(ResetPasswordControllerImp());
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        body: SafeArea(
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 30),
            padding: const EdgeInsets.all(15),
            child: ListView(
              children: [
                CustomTitle(title: "Reset Password "),
                SizedBox(
                  height: height / 30,
                ),
                CustomBodyAuth(body: "Enter Your New Password 😊"),
                SizedBox(
                  height: height / 33,
                ),
                CustomFormField(
                    validator: (p) {},
                    textController: controller.password,
                    title: "Password",
                    hintText: "Enter Your Password ",
                    icon: Icons.password_outlined),
                CustomFormField(
                    validator: (p) {},
                    textController: controller.rePassword,
                    title: "Confirm",
                    hintText: "Re-Enter Your Password",
                    icon: Icons.password_outlined),
                CustomBottomAuth(
                  text: "Save",
                  tapped: () {
                    controller.checkPasswordCompat();
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
