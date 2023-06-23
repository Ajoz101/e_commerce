import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/constant/colors.dart';

class SignUpOrSigninText extends StatelessWidget {
  SignUpOrSigninText({super.key, this.txtone, this.txttwo, this.onTap});
  String? txtone;
  String? txttwo;
  void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          txtone!,
          style: Theme.of(context).textTheme.bodyText1!.copyWith(fontSize: 15),
        ),
        InkWell(
          onTap: onTap,
          child: Text(txttwo!,
              style: const TextStyle(color: AppColor.second, fontSize: 15)),
        ),
      ],
    );
  }
}
