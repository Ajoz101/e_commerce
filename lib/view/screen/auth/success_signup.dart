import 'package:e_commerce/controller/auth/signupController.dart';
import 'package:e_commerce/controller/auth/success_signupController.dart';
import 'package:e_commerce/core/constant/colors.dart';
import 'package:e_commerce/view/widget/auth/customBottomAuth.dart';
import 'package:e_commerce/view/widget/auth/customTextBody.dart';
import 'package:e_commerce/view/widget/auth/cutsomTextTitle.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SuccessSignedUp extends StatelessWidget {
  const SuccessSignedUp({super.key});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    var controller = Get.put(SuccessResetControllerImp());
    return Scaffold(
      body: SafeArea(
        child: Container(
          width: width / 1,
          padding: EdgeInsets.all(15),
          child: Column(
            children: [
              CustomTitle(title: "Successfully Signed Up!"),
              SizedBox(
                height: height / 24,
              ),
              Icon(Icons.check_circle_outline,
                  size: height / 5, color: AppColor.second),
              SizedBox(height: height / 13),
              Text(
                "One More Step!\n Verify The Code Sent To Your Email",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: height / 27),
              ),
              SizedBox(height: height / 14),
              Spacer(),
              CustomBottomAuth(
                  tapped: () {
                    controller.gotologin();
                  },
                  text: "Verify"),
              SizedBox(height: height / 14),
            ],
          ),
        ),
      ),
    );
  }
}
