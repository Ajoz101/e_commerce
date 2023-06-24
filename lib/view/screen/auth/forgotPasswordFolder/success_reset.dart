import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../controller/auth/success_resetPasswordController.dart';
import '../../../../core/constant/colors.dart';
import '../../../widget/auth/customBottomAuth.dart';
import '../../../widget/auth/cutsomTextTitle.dart';

class SuccessResetPassword extends StatelessWidget {
  const SuccessResetPassword({super.key});

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
              CustomTitle(title: "Successfully Reset Password!"),
              SizedBox(
                height: height / 24,
              ),
              Icon(Icons.check_circle_outline,
                  size: height / 5, color: AppColor.second),
              SizedBox(height: height / 13),
              Text(
                "Now Just Login with the signed up email",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: height / 27),
              ),
              SizedBox(height: height / 14),
              Spacer(),
              CustomBottomAuth(
                  tapped: () {
                    controller.gotologin();
                  },
                  text: "Login"),
              SizedBox(height: height / 14),
            ],
          ),
        ),
      ),
    );
  }
}
