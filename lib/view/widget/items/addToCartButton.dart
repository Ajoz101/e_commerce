import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../core/constant/colors.dart';

class AddToCart extends StatelessWidget {
   AddToCart({super.key,this.onPressed});
  Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      child: ActionChip(
        elevation: 20,
        backgroundColor: AppColor.cards,
        label: const Text("Go To Cart",
            style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: AppColor.primary)),
        onPressed:onPressed,
        avatar: const FaIcon(FontAwesomeIcons.cartArrowDown,
            color: AppColor.primary),
      ),
    );
  }
}
