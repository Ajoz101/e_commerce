import 'package:flutter/material.dart';
import 'package:fluttericon/iconic_icons.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

import '../../../core/constant/colors.dart';

class CutomOrderButton extends StatelessWidget {
  const CutomOrderButton({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      child: ActionChip(
        
        elevation: 20,
        backgroundColor: AppColor.cards,
        label: const Text("Order",
            style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: AppColor.primary)),
        onPressed: () {},
        avatar: Icon(Iconic.ok_circle,
            color: AppColor.primary, size: Get.width / 14),
      ),
    );
  }
}
