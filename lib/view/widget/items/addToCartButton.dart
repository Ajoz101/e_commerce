import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../core/constant/colors.dart';

class AddToCart extends StatelessWidget {
  const AddToCart({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      child: ActionChip(
        elevation: 20,
        backgroundColor: AppColor.cards,
        label: const Text("Add To Cart",
            style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: AppColor.primary)),
        onPressed: () {},
        avatar: const FaIcon(FontAwesomeIcons.cartArrowDown,
            color: AppColor.primary),
      ),
    );
  }
}
