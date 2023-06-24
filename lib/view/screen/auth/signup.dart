import 'package:e_commerce/core/constant/colors.dart';
import 'package:e_commerce/view/widget/auth/customBottomAuth.dart';
import 'package:e_commerce/view/widget/auth/customTextBody.dart';
import 'package:e_commerce/view/widget/auth/customTextFormField.dart';
import 'package:e_commerce/view/widget/auth/cutsomTextTitle.dart';
import 'package:e_commerce/view/widget/auth/logo.dart';
import 'package:e_commerce/view/widget/auth/signupOrLoginText.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/auth/signupController.dart';

class SignUp extends StatelessWidget {
  const SignUp({super.key});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var control = Get.put(SignUpControllerImp());

    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        body: SafeArea(
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 30),
            padding: const EdgeInsets.all(15),
            child: ListView(
              children: [
                CustomTitle(title: "Create Your Account"),
                SizedBox(
                  height: height / 30,
                ),
                CustomBodyAuth(body: "Sign up With Your Email And Password "),
                SizedBox(
                  height: height / 33,
                ),
                CustomFormField(
                  textController: control.username,
                  title: "Username",
                  hintText: "Enter Your Username",
                  icon: Icons.person_outlined,
                ),
                CustomFormField(
                  textController: control.email,
                  title: "E-mail",
                  hintText: "Enter Your Email",
                  icon: Icons.email_outlined,
                ),
                CustomFormField(
                  textController: control.phone,
                  title: "Phone",
                  hintText: "Enter Your Phone Number",
                  icon: Icons.phone_android_outlined,
                ),
                CustomFormField(
                  textController: control.password,
                  title: "Password",
                  hintText: "Enter Your Password",
                  icon: Icons.password_outlined,
                ),
                SizedBox(height: height / 37),
                CustomBottomAuth(
                  text: "Sign Up",
                  tapped: () {
                    control.signup();
                  },
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SignUpOrSigninText(
                      txtone: "Already Have An Account? ",
                      txttwo: " Sign in",
                      onTap: (() => control.goToLogin()),
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
