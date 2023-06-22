import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../../core/constant/colors.dart';
import '../../../data/static/static.dart';

class CustomSlider extends StatelessWidget {
  const CustomSlider({super.key});

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return PageView.builder(
      itemCount: onBoardingList.length,
      itemBuilder: (context, i) => Column(
        children: [
          const SizedBox(
            height: 20,
          ),
          Text(onBoardingList[i].title!,
              style:
                  TextStyle(fontWeight: FontWeight.bold, fontSize: width / 15)),
          CachedNetworkImage(
              imageUrl: onBoardingList[i].imgUrl!, width: width / 1),
          const SizedBox(
            height: 20,
          ),
          FittedBox(
            fit: BoxFit.scaleDown,
            child: Text(
              onBoardingList[i].body!,
              style: TextStyle(fontSize: width / 20, color: AppColor.grey),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}
