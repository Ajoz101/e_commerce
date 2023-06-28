import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/home/home_controller.dart';
import '../../../core/constant/colors.dart';

class CustomCard extends StatelessWidget {
  CustomCard({super.key, this.color, this.title, this.subtitle});
  Color? color;
  String? title;
  String? subtitle;

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;

    return Container(
      margin: EdgeInsets.only(right: 1, top: height / 1),
      child: Stack(
        children: [
          GetBuilder<HomeControllerImp>(
            builder: (controller) => Container(
              decoration: BoxDecoration(
                  color: AppColor.shadedWhite,
                  borderRadius: BorderRadius.circular(20)),
              height: height / 5,
              width: double.infinity,
              child: ListTile(
                // trailing: FaIcon(
                //   FontAwesomeIcons.starHalfStroke,
                //   color: AppColor.primary,
                //   size: width / 12,
                // ),
                title: Text(title!,
                    style: Theme.of(context)
                        .textTheme
                        .headline1!
                        .copyWith(fontSize: width / 17)
                        .copyWith(color: AppColor.primary)),
                subtitle: Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: Text(
                    subtitle!,
                    style: Theme.of(context).textTheme.bodyText1,
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            top: -50,
            right: -50,
            child: Container(
                width: 160,
                height: 160,
                decoration: BoxDecoration(
                    color: color, borderRadius: BorderRadius.circular(160))),
          ),
        ],
      ),
    );
  }
}
