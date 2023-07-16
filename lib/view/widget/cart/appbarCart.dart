import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

class CartAppBar extends StatelessWidget {
  CartAppBar({super.key, this.title});
  String? title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          Expanded(
            child: Container(
              alignment: Alignment.centerLeft,
              child: IconButton(
                onPressed: () {
                  Get.back();
                },
                icon: const FaIcon(FontAwesomeIcons.arrowRightFromBracket),
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
            Expanded(
            child: Container(
              alignment: Alignment.center,
              child: FaIcon(
                FontAwesomeIcons.cartShopping,
              ),
            ),
          ),
          // const Spacer()
        ],
      ),
    );
  }
}
