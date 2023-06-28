import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_commerce/data/model/categories.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:get/get.dart';

import '../../../controller/home/home_controller.dart';
import '../../../core/constant/colors.dart';
import '../../../core/constant/networkImage_links.dart';

class CustomCategories extends GetView<HomeControllerImp> {
  const CustomCategories({super.key});

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return GetBuilder<HomeControllerImp>(
      builder: (controller) => Container(
        decoration: BoxDecoration(
            // color: AppColor.cards,
            borderRadius: BorderRadius.circular(20)),
        height: height / 5,
        width: 200,
        margin: EdgeInsets.symmetric(
            horizontal: width / 20, vertical: height / 1.5),
        child: ListView.separated(
          separatorBuilder: (context, index) => SizedBox(width: width / 11),
          scrollDirection: Axis.horizontal,
          itemCount: controller.categories.length == null
              ? 0
              : controller.categories.length,
          itemBuilder: (context, index) {
            return CategoriesWidget(
              category: Categories1.fromJson(controller.categories[index]),
            );
          },
        ),
      ),
    );
  }
}

class CategoriesWidget extends StatelessWidget {
  CategoriesWidget({
    super.key,
    required this.category,
  });
  final Categories1 category;
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Column(
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
          width: 190,
          height: height / 5,
          child: Stack(
            alignment: Alignment.bottomCenter,
            children: [
              Positioned(
                top: -30,
                right: -30,
                child: Container(
                  width: 160,
                  height: 160,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        image: CachedNetworkImageProvider(
                            maxHeight: 200,
                            "${ImageLink.categories}${category.categoriesImage}")),
                    borderRadius: BorderRadius.circular(150),
                  ),
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
                child: Text(
                  category.categoriesName.toString(),
                  style: Theme.of(context)
                      .textTheme
                      .headline2!
                      .copyWith(color: AppColor.white, fontSize: width / 18),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
