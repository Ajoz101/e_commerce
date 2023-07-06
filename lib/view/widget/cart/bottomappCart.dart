import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/constant/colors.dart';
import 'orderbutton.dart';

class BottomAppCart extends StatelessWidget {
  const BottomAppCart({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
                margin: EdgeInsets.symmetric(horizontal: Get.width / 15),
                child: Text("Total : ",
                    style: TextStyle(fontSize: Get.width / 16))),
            Container(
              width: Get.width / 3,
              decoration: BoxDecoration(
                  color: AppColor.primary,
                  borderRadius: BorderRadius.circular(20)),
              margin: EdgeInsets.symmetric(horizontal: Get.width / 15),
              child: Text(
                textAlign: TextAlign.center,
                "600 \$",
                style: TextStyle(
                    fontSize: Get.width / 16,
                    color: AppColor.white,
                    fontFamily: "sans"),
              ),
            ),
          ],
        ),
        const CutomOrderButton(),
      ],
    );
  }
}
