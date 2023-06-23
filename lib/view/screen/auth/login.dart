import 'package:e_commerce/core/constant/colors.dart';
import 'package:e_commerce/view/widget/auth/customTextBody.dart';
import 'package:e_commerce/view/widget/auth/customTextFormField.dart';
import 'package:e_commerce/view/widget/auth/cutsomTextTitle.dart';
import 'package:flutter/material.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        appBar: AppBar(
            title: Text("Sign In",
                style: Theme.of(context)
                    .textTheme
                    .headline1!
                    .copyWith(color: AppColor.grey)),
            centerTitle: true),
        body: SafeArea(
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 25),
            padding: const EdgeInsets.all(15),
            child: ListView(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 30),
                  child: SizedBox(
                    child: CustomTitle(title: "Welcome Back"),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                CustomBodyAuth(
                    body:
                        "Sign In With Your Email And Password OR Continue with Socials"),
                const SizedBox(
                  height: 80,
                ),
                CustomFormField(
                    title: "E-mail",
                    hintText: "Enter Your Email",
                    icon: Icons.email_outlined),
                CustomFormField(
                    title: "Password",
                    hintText: "Enter Your Password",
                    icon: Icons.password_outlined),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
