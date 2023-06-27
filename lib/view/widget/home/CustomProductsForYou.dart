import 'dart:ui';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:get/get.dart';

import '../../../controller/home/home_controller.dart';
import '../../../core/constant/colors.dart';
import '../../../core/constant/networkImage_links.dart';

class CustomProds4You extends StatelessWidget {
  const CustomProds4You({super.key});

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    var c = Get.put(HomeControllerImp());
    return GetBuilder<HomeControllerImp>(
      builder: (controller) => Container(
        decoration: BoxDecoration(
            // color: AppColor.cards,
            borderRadius: BorderRadius.circular(20)),
        height: height / 4,
        width: double.infinity,
        child: ListView.separated(
          separatorBuilder: (context, index) => SizedBox(width: width / 11),
          scrollDirection: Axis.horizontal,
          itemCount: c.items.length,
          itemBuilder: (context, index) {
            return Column(
              children: [
                AnimatedContainer(
                  duration: Duration(milliseconds: 899),
                  decoration: BoxDecoration(
                    color: AppColor.white,

                    image: DecorationImage(
                      image: CachedNetworkImageProvider(
                          "${ImageLink.items}${c.items[index]["items_image"]}"),
                    ),

                    borderRadius: BorderRadius.circular(40),
                    // color:  AppColor.secondLight,
                  ),
                  width: 190,
                  height: 150,
                  child: SizedBox(),
                ),
                Text(
                  "${c.items[index]["items_name"]}\n ${c.items[index]['items_price']}\$",
                  style: Theme.of(context)
                      .textTheme
                      .headline2!
                      .copyWith(color: AppColor.black, fontSize: width / 18),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
