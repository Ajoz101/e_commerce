import 'package:e_commerce/controller/home/items_controller.dart';
import 'package:e_commerce/data/model/categories.dart';
import 'package:flutter/material.dart';

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
          color: AppColor.cards, borderRadius: BorderRadius.circular(20)),
      height: height / 20,
      width: width / 6,
      margin:
          EdgeInsets.symmetric(horizontal: width / 30, vertical: height / 10),
      child: ListView.builder(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemCount: controller.categories.length == null
            ? 0
            : controller.categories.length,
        itemBuilder: (context, index) {
          // int i = index;
          return Padding(
            padding: const EdgeInsets.only(right: 20),
            child: CategoriesWidget(
              category: Categories1.fromJson(
                controller.categories[index],
              ),
              i: index,
            ),
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
    Get.put(ItemsControllerImp());

    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return GetBuilder<ItemsControllerImp>(builder: (controller) {
      return InkWell(
        onTap: () {
          controller.changeCat(i);
        },
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 100),
          decoration: controller.selectedCategories == i
              ? BoxDecoration(
                  color: AppColor.primary,
                  borderRadius: BorderRadius.circular(40),
                  // color: AppColor.secondLight,
                )
              : BoxDecoration(
                  color: AppColor.secondLight,
                  borderRadius: BorderRadius.circular(40)),
          width: width / 3,
          height: height / 4,
          child: Padding(
            padding: const EdgeInsets.only(bottom: 6),
            child: FittedBox(
              fit: BoxFit.scaleDown,
              child: Text(
                category.categoriesName.toString(),
                style: Theme.of(context).textTheme.headline2!.copyWith(
                      color: AppColor.white,
                      fontSize: width / 18,
                    ),
              ),
            ),
          ),
        ),
      );
    });
  }
}
