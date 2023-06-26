import 'package:e_commerce/controller/auth/signupController.dart';
import 'package:e_commerce/core/constant/colors.dart';
import 'package:e_commerce/view/widget/auth/customTextBody.dart';
import 'package:e_commerce/view/widget/auth/cutsomTextTitle.dart';
import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:get/get.dart';

import '../../../controller/auth/verifySignUp.dart';

class VerifyCodeForSignUp extends StatelessWidget {
  const VerifyCodeForSignUp({super.key});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var controller = Get.put(VerifyCodeSignUpControllerImp());
    var signupCont = Get.put(SignUpControllerImp());

    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: GestureDetector(
        onTap: () {
          print("hi");
        },
        child: Scaffold(
          body: SafeArea(
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 30),
              padding: const EdgeInsets.all(15),
              child: ListView(
                children: [
                  CustomTitle(title: "Verification code check "),
                  SizedBox(
                    height: height / 30,
                  ),
                  CustomBodyAuth(
                      body:
                          "Please Enter The Code That Was Sent To Your Email"),
                  SizedBox(
                    height: height / 33,
                  ),
                  OtpTextField(
                      borderRadius: BorderRadius.circular(20),
                      fieldWidth: 50,
                      numberOfFields: 5,
                      // borderColor: AppColor.second,
                      focusedBorderColor: AppColor.second,
                      //set to true to show as box or false to show as dash
                      showFieldAsBox: true,
                      //runs when a code is typed in
                      onCodeChanged: (String code) {
                        //handle validation or checks here
                      },
                      //runs when every textfield is filled
                      onSubmit: (String verificationCode) {
                        controller.gotoLogin(verificationCode);
                      } // end onSubmit
                      ),
                  SizedBox(
                    height: height / 33,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
