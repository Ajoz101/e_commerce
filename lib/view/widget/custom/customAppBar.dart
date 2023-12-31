import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

import '../../../controller/home/home_controller.dart';
import '../../../core/constant/colors.dart';

class CustomAppBar extends StatelessWidget {
  CustomAppBar(
      {super.key,
      this.onTapSearch,
      this.title,
      this.color,
      this.height,
      this.width,
      this.showRow,
      this.onChanged,
      required this.searchController});
  void Function()? onTapSearch;
  String? title;

  Color? color;
  double? height;
  double? width;
  bool? showRow;
  Function(String)? onChanged;
  final TextEditingController searchController;
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    var c = Get.put(HomeControllerImp());
    return Container(
      margin: EdgeInsets.only(top: height / height),
      padding: EdgeInsets.symmetric(horizontal: width / width),
      child: Row(
        children: [
          Expanded(
            child: TextFormField(
              controller: searchController,
              onChanged: onChanged,
              style: TextStyle(color: AppColor.white),
              decoration: InputDecoration(
                prefixIcon: Padding(
                  padding: EdgeInsets.all(height / 40),
                  child: GestureDetector(
                      onTap: onTapSearch,
                      child: FaIcon(
                        FontAwesomeIcons.magnifyingGlass,
                        color: AppColor.secondLight,
                      )),
                ),
                hintText: title,
                hintStyle: TextStyle(color: AppColor.white),
                fillColor: color ?? AppColor.secondLight.withOpacity(0.3),
                filled: true,
                border: OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
            ),
          ),
          SizedBox(width: 20),
          showRow == true
              ? Row(
                  children: [
                    SizedBox(width: Get.width / 17),
                    Container(
                      margin: EdgeInsets.only(right: 20),
                      decoration: BoxDecoration(
                          color: AppColor.primary.withOpacity(0.1),
                          borderRadius: BorderRadius.circular(20)),
                      child: IconButton(
                        onPressed: () {
                          c.gotoFvortites();
                        },
                        icon: FaIcon(FontAwesomeIcons.bookmark,
                            color: AppColor.black.withOpacity(0.8),
                            size: width / 11),
                      ),
                    ),
                  ],
                )
              : SizedBox(),
        ],
      ),
    );
  }
}
