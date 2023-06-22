import 'package:flutter/material.dart';

import '../../../core/constant/colors.dart';

class ContinueButton extends StatelessWidget {
  const ContinueButton({super.key});

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return Container(
      width: width / 1.5,
      margin: const EdgeInsets.only(bottom: 60),
      decoration: BoxDecoration(
          color: AppColor.primary, borderRadius: BorderRadius.circular(20)),
      child: MaterialButton(
        onPressed: () {},
        child: Text("Continue", style: TextStyle(fontSize: width / 15)),
      ),
    );
  }
}
