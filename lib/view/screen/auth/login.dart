import 'package:e_commerce/core/constant/colors.dart';
import 'package:e_commerce/view/widget/auth/customBottomAuth.dart';
import 'package:e_commerce/view/widget/auth/customTextBody.dart';
import 'package:e_commerce/view/widget/auth/customTextFormField.dart';
import 'package:e_commerce/view/widget/auth/cutsomTextTitle.dart';
import 'package:e_commerce/view/widget/auth/logo.dart';
import 'package:flutter/material.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;

    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        body: SafeArea(
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 30),
            padding: const EdgeInsets.all(15),
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
                    title: "E-mail",
                    hintText: "Enter Your Email",
                    icon: Icons.email_outlined),
                CustomFormField(
                    title: "Password",
                    hintText: "Enter Your Password",
                    icon: Icons.password_outlined),
                Text(
                  "Forgot Password?",
                  textAlign: TextAlign.center,
                  style: Theme.of(context)
                      .textTheme
                      .bodyText1!
                      .copyWith(fontSize: 19),
                ),
                SizedBox(height: height / 37),
                CustomBottomAuth(
                  text: "Sign In",
                  tapped: () {},
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Don't Have  An Account?",
                      style: Theme.of(context)
                          .textTheme
                          .bodyText1!
                          .copyWith(fontSize: 15),
                    ),
                    const Text(" Sign Up!",
                        style: TextStyle(color: AppColor.second, fontSize: 15)),
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
