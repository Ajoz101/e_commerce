import 'package:e_commerce/controller/onboard/onboardController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/constant/colors.dart';

class ContinueButton extends GetView<OnBoardingControllerImp> {
  const ContinueButton({super.key});

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return Container(
      width: width / 1.5,
      margin: const EdgeInsets.only(bottom: 60),
      decoration: BoxDecoration(
          color: AppColor.primary, borderRadius: BorderRadius.circular(20)),
      child: MaterialButton(
        onPressed: () {
          controller.next();
        },
        child: Text("Continue",
            style: TextStyle(fontSize: width / 15, color: AppColor.white)),
      ),
    );
  }
}
