import 'package:e_commerce/controller/auth/checkemailController.dart';
import 'package:e_commerce/core/constant/colors.dart';
import 'package:e_commerce/core/functions/validateInput.dart';
import 'package:e_commerce/view/widget/auth/customBottomAuth.dart';
import 'package:e_commerce/view/widget/auth/customTextBody.dart';
import 'package:e_commerce/view/widget/auth/cutsomTextTitle.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/auth/forgotpassController.dart';
import '../../widget/auth/customTextFormField.dart';

class CheckEmail extends StatelessWidget {
  const CheckEmail({super.key});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var controller = Get.put(CheckEmailControllerImp());
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
                  CustomTitle(title: "Checking Email"),
                  SizedBox(
                    height: height / 30,
                  ),
                  LinearProgressIndicator(
                      backgroundColor: AppColor.primary,
                      color: AppColor.second),
                  CustomBodyAuth(body: "Check E-mail"),
                  SizedBox(
                    height: height / 33,
                  ),
                  CustomFormField(
                      validator: (p) {
                        return validInput(p!, 30, 50, "email");
                      },
                      textController: controller.email,
                      title: "E-mail",
                      hintText: "Enter Your Email",
                      icon: Icons.email_outlined),
                  CustomBottomAuth(
                    text: "Check",
                    tapped: () {
                      controller.showSnack();
                      Future.delayed(Duration(seconds: 2),
                          (() => controller.gotoVerify()));
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
