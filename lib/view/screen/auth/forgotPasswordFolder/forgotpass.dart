import 'package:e_commerce/view/widget/auth/customBottomAuth.dart';
import 'package:e_commerce/view/widget/auth/customTextBody.dart';
import 'package:e_commerce/view/widget/auth/cutsomTextTitle.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../controller/auth/forgotpassController.dart';
import '../../../../core/functions/validateInput.dart';
import '../../../widget/auth/customTextFormField.dart';

class ForgotPassword extends StatelessWidget {
  const ForgotPassword({super.key});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var controller = Get.put(ForgotPassControllerImp());
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        body: SafeArea(
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 30),
            padding: const EdgeInsets.all(15),
            child: Form(
              key: controller.state,
              child: ListView(
                children: [
                  CustomTitle(title: "Forgot Password?"),
                  SizedBox(
                    height: height / 30,
                  ),
                  CustomBodyAuth(body: "Check E-mail"),
                  SizedBox(
                    height: height / 33,
                  ),
                  CustomFormField(
                      validator: (p) {
                        return validInput(p!, 13, 50, "email");
                      },
                      textController: controller.email,
                      title: "E-mail",
                      hintText: "Enter Your Email",
                      icon: Icons.email_outlined),
                  CustomBottomAuth(
                    text: "Check",
                    tapped: () {
                      controller.gotoVerifyCode();
                    },
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
