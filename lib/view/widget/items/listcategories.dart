import 'package:e_commerce/controller/home/home_controller.dart';
import 'package:e_commerce/controller/home/items_controller.dart';
import 'package:e_commerce/data/model/categories.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:get/get.dart';

import '../../../core/constant/colors.dart';

class CustomCategoriesItems extends GetView<ItemsControllerImp> {
  const CustomCategoriesItems({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(ItemsControllerImp());
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Container(
      decoration: BoxDecoration(
          // color: AppColor.cards,
          borderRadius: BorderRadius.circular(20)),
      height: height / 1,
      width: width / 1,
      margin:
          EdgeInsets.symmetric(horizontal: width / 20, vertical: height / 5),
      child: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, mainAxisSpacing: 20),
        shrinkWrap: true,
        // separatorBuilder: (context, index) => SizedBox(width: width / 11),
        scrollDirection: Axis.vertical,
        itemCount: controller.categories.length == null
            ? 0
            : controller.categories.length,

        itemBuilder: (context, index) {
          // int i = index;
          return CategoriesWidget(
            category: Categories1.fromJson(
              controller.categories[index],
            ),
            i: index,
          );
        },
      ),
    );
  }
}

class CategoriesWidget extends GetView<ItemsControllerImp> {
  CategoriesWidget({super.key, required this.category, this.i});
  final Categories1 category;
  final int? i;
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Container(
      width: width / 5,
      height: height / 2,
      child: GridView(
        shrinkWrap: true,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 1, crossAxisSpacing: 15, mainAxisSpacing: 20),
        padding: EdgeInsets.all(20),
        // mainAxisSize: MainAxisSize.min,
        children: [
          AnimatedContainer(
            duration: const Duration(milliseconds: 899),
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                  colors: [AppColor.primaryLight, AppColor.secondLight],
                  begin: Alignment.bottomLeft,
                  end: Alignment.topRight),
              borderRadius: BorderRadius.circular(40),
              // color: AppColor.secondLight,
            ),
            width: width / 4,
            height: height / 2,
            child: Stack(
              alignment: Alignment.center,
              children: [
                Positioned(
                  top: -30,
                  right: -30,
                  child: Container(
                    width: 160,
                    height: 160,
                  ),
                ),
                Positioned(
                  top: 1,
                  right: 330,
                  child: RotatedBox(
                      quarterTurns: 20,
                      child: FaIcon(
                        FontAwesomeIcons.fire,
                        size: height / 15,
                        color: AppColor.second,
                      )),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 6),
                  child: FittedBox(
                    fit: BoxFit.scaleDown,
                    child: Text(
                      category.categoriesName.toString(),
                      style: Theme.of(context).textTheme.headline2!.copyWith(
                          color: AppColor.white, fontSize: width / 18),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
