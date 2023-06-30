import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/home/HomeScreen_controller.dart';
import '../../../core/constant/colors.dart';
import '../home/customappButton.dart';

class CustomBottomAppButton extends StatelessWidget {
  const CustomBottomAppButton({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    Get.put(HomeScreenControllerImp());

    return GetBuilder<HomeScreenControllerImp>(builder: (controller) {
      return BottomAppBar(
        elevation: 5,
        notchMargin: 10,
        shape: const CircularNotchedRectangle(),
        color: AppColor.cards,
        child: Row(
          children: [
            ...List.generate(
              controller.page.length + 1,
              ((index) {
                int i = index > 2 ? index - 1 : index;
                return index == 2
                    ? Spacer()
                    : CustomAppButton(
                        onPressed: () {
                          controller.changePage(i);
                        },
                        icon: controller.icons[i],
                        title: controller.pageInfo[i],
                        active: controller.currentPage == i ? true : false,
                      );
              }),
            )
          ],
        ),
      );
    });
  }
}
