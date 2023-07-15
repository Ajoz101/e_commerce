import 'package:e_commerce/core/constant/colors.dart';
import 'package:flutter/material.dart';

class CustomTitle extends StatelessWidget {
  CustomTitle({super.key, this.title});
  String? title;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 30, left: 14),
      child: Text(
        title!,
        textAlign: TextAlign.start,
        style: Theme.of(context)
            .textTheme
            .headline1!
            .copyWith(color: AppColor.grey),
      ),
    );
  }
}
