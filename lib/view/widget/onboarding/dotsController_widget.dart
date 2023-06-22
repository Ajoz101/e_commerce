import 'package:flutter/material.dart';

import '../../../core/constant/colors.dart';
import '../../../data/static/static.dart';

class Dots extends StatelessWidget {
  const Dots({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ...List.generate(
          onBoardingList.length,
          (index) => AnimatedContainer(
            margin: EdgeInsets.only(right: 5),
            duration: const Duration(milliseconds: 800),
            width: 6,
            height: 6,
            decoration: BoxDecoration(
              color: AppColor.primary,
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        ),
      ],
    );
  }
}
