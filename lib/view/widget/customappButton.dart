import 'package:e_commerce/core/constant/colors.dart';
import 'package:flutter/material.dart';

class CustomAppButton extends StatelessWidget {
  CustomAppButton({
    super.key,
    required this.onPressed,
    required this.icon,
    this.title,
    this.active,
  });
  IconData? icon;
  String? title;
  bool? active;
  void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        MaterialButton(
          onPressed: onPressed,
          child: AnimatedContainer(
            duration: Duration(milliseconds: 500),
            decoration: BoxDecoration(
                color: active == true
                    ? AppColor.primary.withOpacity(0.4)
                    : AppColor.white.withOpacity(0),
                borderRadius: BorderRadius.circular(12)),
            width: size.width / 9,
            height: size.height / 18,
            child: Icon(
              icon,
              size: size.height / 30,
              color: AppColor.primary,
            ),
          ),
        ),
        Text(
          title == null ? "" : title!,
          style: TextStyle(
              fontWeight: active == true ? FontWeight.bold : FontWeight.normal),
        )
      ],
    );
  }
}
