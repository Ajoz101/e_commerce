import 'package:e_commerce/controller/forgotpass/checkemailController.dart';
import 'package:e_commerce/core/class/statusRequest.dart';
import 'package:e_commerce/core/constant/colors.dart';
import 'package:e_commerce/view/widget/auth/customBottomAuth.dart';
import 'package:e_commerce/view/widget/auth/customTextBody.dart';
import 'package:e_commerce/view/widget/auth/cutsomTextTitle.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/functions/validateInput.dart';
import '../../../widget/auth/customTextFormField.dart';

class ForgotPassword extends StatelessWidget {
  const ForgotPassword({super.key});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var controller = Get.put(CheckEmailControllerImp());
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        body: SafeArea(
          child: GetBuilder<CheckEmailControllerImp>(
            builder: (controller) {
              return controller.statusRequest == StatusRequest.loading
                  ? Center(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 30),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("Checking...",
                                style: Theme.of(context).textTheme.headline1),
                            const SizedBox(
                              height: 20,
                            ),
                            const LinearProgressIndicator(
                                backgroundColor: AppColor.second,
                                color: AppColor.primary),
                          ],
                        ),
                      ),
                    )
                  : Container(
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
                              text: "Send",
                              tapped: () {
                                controller.checkEmail();
                              },
                            )
                          ],
                        ),
                      ),
                    );
            },
          ),
        ),
      ),
    );
  }
}
