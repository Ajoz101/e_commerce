import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:get/get.dart';

import '../../../controller/home/home_controller.dart';
import '../../../core/constant/colors.dart';
import '../../../core/constant/networkImage_links.dart';

class CustomCategories extends StatelessWidget {
  const CustomCategories({super.key});

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
        height: height / 5,
        width: double.infinity,
        child: ListView.separated(
          separatorBuilder: (context, index) => SizedBox(width: width / 11),
          scrollDirection: Axis.horizontal,
          itemCount: c.categories.length == null ? 0 : c.categories.length,
          itemBuilder: (context, index) {
            return AnimatedContainer(
              duration: Duration(milliseconds: 899),
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                    colors: [AppColor.primary, AppColor.secondLight],
                    begin: Alignment.topRight,
                    end: Alignment.bottomLeft),
                borderRadius: BorderRadius.circular(40),
                // color: AppColor.secondLight,
              ),
              width: 190,
              height: 130,
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
                                "${ImageLink.categories}${c.categories[index]["categories_image"]}")),
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
                      c.categories[index]["categories_name"],
                      style: Theme.of(context).textTheme.headline2!.copyWith(
                          color: AppColor.black, fontSize: width / 18),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
