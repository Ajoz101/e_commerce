import 'package:flutter/material.dart';
import 'package:fluttericon/iconic_icons.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

import '../../../core/constant/colors.dart';

class CustomCouponButton extends StatelessWidget {
   CustomCouponButton({super.key,required this.onPressed});
  Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      child: ActionChip(
        elevation: 20,
        backgroundColor: AppColor.shadedWhite,
        label: const Text("Apply Code",
            style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: AppColor.primary)),
        onPressed: () {},
        avatar: Icon(FontAwesomeIcons.codiepie,
            color: AppColor.primary, size: Get.width / 14),
      ),
    );
  }
}
