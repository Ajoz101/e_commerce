import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CartAppBar extends StatelessWidget {
  CartAppBar({super.key, this.title, this.onPressed});
  String? title;
  void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Container(
            alignment: Alignment.centerLeft,
            child: IconButton(
              onPressed: onPressed,
              icon: const Icon(Icons.arrow_back),
            ),
          ),
        ),
        Expanded(
          child: Container(
            alignment: Alignment.center,
            child: Text(
              title!,
              style: TextStyle(fontSize: Get.width / 14),
            ),
          ),
        ),
        const Spacer()
      ],
    );
  }
}
