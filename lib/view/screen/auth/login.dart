import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_commerce/core/class/statusRequest.dart';
import 'package:e_commerce/core/constant/colors.dart';
import 'package:e_commerce/core/constant/image_asset.dart';
import 'package:e_commerce/core/functions/exitAlert.dart';
import 'package:e_commerce/core/functions/validateInput.dart';
import 'package:e_commerce/view/widget/auth/customBottomAuth.dart';
import 'package:e_commerce/view/widget/auth/customTextBody.dart';
import 'package:e_commerce/view/widget/auth/customTextFormField.dart';
import 'package:e_commerce/view/widget/auth/cutsomTextTitle.dart';
import 'package:e_commerce/view/widget/auth/googleSignIn.dart';
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
        backgroundColor: AppColor.forGradient,
        body: WillPopScope(
          onWillPop: () {
            return exitAlert();
          },
          child: SafeArea(
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 30),
              padding: const EdgeInsets.all(15),
              child: Form(
                key: control.state,
                child: Stack(
                  fit: StackFit.passthrough,
                  children: [
                    CachedNetworkImage(
                      imageUrl: ImageAsset.onBoardingImageOne,
                    ),
                    Container(
                      decoration: BoxDecoration(
                          color: AppColor.white,
                          borderRadius: BorderRadius.circular(20)),
                      height: Get.width * 2,
                      width: Get.width * 2,
                      child: ListView(
                        children: [
                          // const Logo(),
                          CustomTitle(title: "Welcome Back"),
                          SizedBox(
                            height: height / 30,
                          ),
                          CustomBodyAuth(
                              body:
                                  "Sign In With Email OR Continue with Socials"),
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
                          GetBuilder<LoginControllerImp>(
                            builder: (controller) {
                              return controller.statusRequest ==
                                      StatusRequest.loading
                                  ? const LinearProgressIndicator(
                                      color: AppColor.primary,
                                      backgroundColor: AppColor.second,
                                    )
                                  : CustomBottomAuth(
                                      text: "Sign In",
                                      tapped: () {
                                        control.login();
                                      },
                                    );
                            },
                          ),
                          SignUpOrSigninText(
                              txtone: "Don't Have  An Account?",
                              txttwo: " Sign Up",
                              onTap: (() => control.goToSignUP())),
                          Container(
                            margin: EdgeInsets.only(top: Get.width / 8),
                            child: Text("Or", textAlign: TextAlign.center),
                          ),
                          GoogleSignInCard()
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
