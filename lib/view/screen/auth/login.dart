import 'package:e_commerce/core/functions/validateInput.dart';
import 'package:e_commerce/view/widget/auth/customBottomAuth.dart';
import 'package:e_commerce/view/widget/auth/customTextBody.dart';
import 'package:e_commerce/view/widget/auth/customTextFormField.dart';
import 'package:e_commerce/view/widget/auth/cutsomTextTitle.dart';
import 'package:e_commerce/view/widget/auth/logo.dart';
import 'package:e_commerce/view/widget/auth/signupOrLoginText.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/auth/loginController.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var control = Get.put(LoginControllerImp());
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        body: SafeArea(
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 30),
            padding: const EdgeInsets.all(15),
            child: Form(
              key: control.state,
              child: ListView(
                children: [
                  const Logo(),
                  CustomTitle(title: "Welcome Back"),
                  SizedBox(
                    height: height / 30,
                  ),
                  CustomBodyAuth(
                      body:
                          "Sign In With Your Email And Password OR Continue with Socials"),
                  SizedBox(
                    height: height / 33,
                  ),
                  CustomFormField(
                      validator: (p) {
                        return validInput(p!, 3, 100, "email");
                      },
                      textController: control.email,
                      title: "E-mail",
                      hintText: "Enter Your Email",
                      icon: Icons.email_outlined),
                  CustomFormField(
                      obscureText: true,
                      validator: (p) {
                        return validInput(p!, 3, 100, "password");
                      },
                      textController: control.password,
                      title: "Password",
                      hintText: "Enter Your Password",
                      icon: Icons.password_outlined),
                  InkWell(
                    onTap: () {
                      control.goToForgotPassword();
                    },
                    child: Text(
                      "Forgot Password?",
                      textAlign: TextAlign.center,
                      style: Theme.of(context)
                          .textTheme
                          .bodyText1!
                          .copyWith(fontSize: 19),
                    ),
                  ),
                  SizedBox(height: height / 37),
                  CustomBottomAuth(
                    text: "Sign In",
                    tapped: () {
                      control.login();
                    },
                  ),
                  SignUpOrSigninText(
                      txtone: "Don't Have  An Account?",
                      txttwo: " Sign Up",
                      onTap: (() => control.goToSignUP())),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
