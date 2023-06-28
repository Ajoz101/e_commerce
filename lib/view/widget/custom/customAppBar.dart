import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

import '../../../controller/home/home_controller.dart';
import '../../../core/constant/colors.dart';

class CustomAppBar extends StatelessWidget {
  CustomAppBar({super.key, this.onTapSearch,this.title});
  void Function()? onTapSearch;
  String? title;

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    var c = Get.put(HomeControllerImp());
    return Container(
      margin: EdgeInsets.only(top: height / 24),
      padding: EdgeInsets.symmetric(horizontal: width / 40),
      child: Row(
        children: [
          Expanded(
            child: TextFormField(
              decoration: InputDecoration(
                prefixIcon: Padding(
                  padding: EdgeInsets.all(height / 40),
                  child: GestureDetector(
                      onTap: onTapSearch,
                      child: FaIcon(FontAwesomeIcons.magnifyingGlass)),
                ),
                hintText: title,
                hintStyle: TextStyle(color: AppColor.white),
                fillColor: AppColor.secondLight.withOpacity(0.3),
                filled: true,
                border: OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
            ),
          ),
          SizedBox(width: 20),
          Container(
            decoration: BoxDecoration(
                color: AppColor.primary.withOpacity(0.1),
                borderRadius: BorderRadius.circular(20)),
            child: IconButton(
              onPressed: () {
                c.signOut();
              },
              icon: FaIcon(FontAwesomeIcons.user,
                  color: AppColor.primary, size: width / 11),
            ),
          ),
        ],
      ),
    );
  }
}
