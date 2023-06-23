import 'package:e_commerce/core/constant/colors.dart';
import 'package:flutter/material.dart';

class CustomBottomAuth extends StatelessWidget {
  CustomBottomAuth({super.key, this.text, this.tapped});
  String? text;
  final void Function()? tapped;
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;

    return Container(
      width: width / 1,
      margin: EdgeInsets.only(bottom: height / 27),
      decoration: BoxDecoration(
          color: AppColor.primary, borderRadius: BorderRadius.circular(30)),
      child: MaterialButton(
        onPressed: tapped,
        child: Text(text!,
            style: Theme.of(context)
                .textTheme
                .bodyText1!
                .copyWith(color: AppColor.white)),
      ),
    );
  }
}
