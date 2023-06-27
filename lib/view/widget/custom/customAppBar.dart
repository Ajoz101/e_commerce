import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

import '../../../controller/home/home_controller.dart';
import '../../../core/constant/colors.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
      var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    var c = Get.put(HomeControllerImp());
    return Container(
      margin: EdgeInsets.only(top: height / 24),
      padding: EdgeInsets.symmetric(horizontal: width / 60),
      child: Row(
        children: [
          Expanded(
            child: TextFormField(
              decoration: InputDecoration(
                prefixIcon: Padding(
                  padding: EdgeInsets.all(height / 40),
                  child: const FaIcon(FontAwesomeIcons.magnifyingGlass),
                ),
                hintText: "Find product",
                fillColor: AppColor.secondLight,
                filled: true,
                border: OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
            ),
          ),
          Container(
            child: MaterialButton(
              onPressed: () {
                c.signOut();
              },
              child: FaIcon(FontAwesomeIcons.solidCircleUser,
                  color: AppColor.primary, size: width / 11),
            ),
          ),
        ],
      ),
    );
  }
}
