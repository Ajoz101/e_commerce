import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_commerce/core/class/statusRequest.dart';
import 'package:e_commerce/core/constant/colors.dart';
import 'package:e_commerce/core/functions/exitAlert.dart';
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
        backgroundColor: AppColor.primary,
        body: WillPopScope(
          onWillPop: () {
            return exitAlert();
          },
          child: SafeArea(
            child: Container(
              width: 999,
              // margin: const EdgeInsets.symmetric(horizontal: 30),
              // padding: const EdgeInsets.all(15),
              child: Form(
                key: control.state,
                child: Stack(
                  clipBehavior: Clip.none,
                  fit: StackFit.passthrough,
                  children: [
                    Container(
                      decoration: const BoxDecoration(
                        color: AppColor.primary,
                        image: DecorationImage(
                          fit: BoxFit.fill,
                          opacity: 0.5,
                          image: CachedNetworkImageProvider(
                            scale: 0.6,
                            // "https://i.pinimg.com/736x/97/e0/9c/97e09c7eda3e88a5f877c961ca7f8738--drown-pastels.jpg",
                            "https://www.hdwallpapers.in/download/artistic_neon_purple_lights_hd_purple_aesthetic-1920x1080.jpg",
                          ),
                        ),
                      ),
                      width: double.infinity,
                      height: Get.width / 1,
                      child: Text(
                        "Materialica",
                        style: Theme.of(context).textTheme.headline1,
                        textAlign: TextAlign.center,
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: Get.width / 2),
                      decoration: BoxDecoration(
                          color: AppColor.secondLight,
                          borderRadius: BorderRadius.circular(30)),
                      height: Get.height / 1.7,
                      width: Get.width * 2,
                      child: ListView(
                        children: [
                          // const Logo(),
                          CustomTitle(title: "Let's sign you in"),
                          SizedBox(
                            height: height / 30,
                          ),
                          CustomBodyAuth(
                              body: "Welcome back you've been missed"),
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
                                  : Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 15.0),
                                      child: CustomBottomAuth(
                                        text: "Sign In",
                                        tapped: () {
                                          control.login();
                                        },
                                      ),
                                    );
                            },
                          ),

                          // Container(
                          //   margin: EdgeInsets.only(top: Get.width / 8),
                          // ),
                          // GoogleSignInCard()
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(bottom: 20),
                      alignment: Alignment.bottomCenter,
                      child: SignUpOrSigninText(
                        txtone: "Don't Have  An Account?",
                        txttwo: " Sign Up",
                        onTap: () {
                          print("Pressed");
                          control.goToSignUP();
                        },
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
