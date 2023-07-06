import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/constant/colors.dart';

class CartQuantity extends StatelessWidget {
   CartQuantity({super.key,this.count});
  String ?count;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 15),
      height: Get.width / 10,
      padding: const EdgeInsets.only(top: 5),
      decoration: BoxDecoration(
          color: AppColor.primary, borderRadius: BorderRadius.circular(20)),
      child: Text("You have $count Items in the cart",
          textAlign: TextAlign.center,
          style: Theme.of(context)
              .textTheme
              .bodyText1!
              .copyWith(color: AppColor.white)),
    );
  }
}
