import 'package:e_commerce/controller/onboardController.dart';
import 'package:e_commerce/view/widget/onboarding/custom_button.dart';
import 'package:e_commerce/view/widget/onboarding/dotsController_widget.dart';
import 'package:e_commerce/view/widget/onboarding/page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OBoarding extends StatelessWidget {
  const OBoarding({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(OnBoardingControllerImp());
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const Expanded(
              flex: 2,
              child: CustomSlider(),
            ),
            Expanded(
              flex: 1,
              child: Column(
                children: const [
                  Dots(),
                  Spacer(
                    flex: 2,
                  ),
                  ContinueButton(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
