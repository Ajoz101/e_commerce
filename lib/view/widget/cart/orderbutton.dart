import 'package:flutter/material.dart';
import 'package:fluttericon/iconic_icons.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

import '../../../core/constant/colors.dart';

class CutomOrderButton extends StatelessWidget {
  CutomOrderButton({super.key, this.onPressed,this.title});
  void Function()? onPressed;
  String ?title;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      child: ActionChip(
        elevation: 20,
        backgroundColor: AppColor.cards,
        label: Text(title!,
            style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: AppColor.primary)),
        onPressed: onPressed,
        avatar: Icon(Icons.check_circle_outline,
            color: AppColor.primary, size: Get.width / 14),
      ),
    );
  }
}
