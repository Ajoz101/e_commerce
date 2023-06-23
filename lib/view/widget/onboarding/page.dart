import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_commerce/controller/onboardController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/constant/colors.dart';
import '../../../data/static/static.dart';

class CustomSlider extends GetView<OnBoardingControllerImp> {
  const CustomSlider({super.key});

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return PageView.builder(
      controller: controller.pageC,
      onPageChanged: (value) {
        print(value);
        controller.onPageChanged(value);
      },
      itemCount: onBoardingList.length,
      itemBuilder: (context, i) => Column(
        children: [
          const SizedBox(
            height: 20,
          ),
          CachedNetworkImage(
              imageUrl: onBoardingList[i].imgUrl!, width: width / 1),
          const SizedBox(
            height: 20,
          ),
          Text(onBoardingList[i].title!,
              style: Theme.of(context).textTheme.headline1),
          Expanded(
            flex: 2,
            child: FittedBox(
              fit: BoxFit.scaleDown,
              child: Text(
                onBoardingList[i].body!,
                style: Theme.of(context).textTheme.bodyText1,
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
