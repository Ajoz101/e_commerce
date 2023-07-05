import 'package:e_commerce/core/constant/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        clipBehavior: Clip.none,
        alignment: Alignment.center,
        children: [
          Container(
            color: AppColor.primary,
            height: Get.width / 2,
          ),
          Positioned(
            top: Get.width / 2.9,
            child: CircleAvatar(
              backgroundColor: AppColor.second,
              maxRadius: 60,
            ),
          )
        ],
      ),
    );
  }
}
