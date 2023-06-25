import 'package:e_commerce/controller/testController.dart';
import 'package:e_commerce/core/class/crud.dart';
import 'package:e_commerce/core/class/handlingData_view.dart';
import 'package:e_commerce/core/class/statusRequest.dart';
import 'package:e_commerce/core/constant/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TestApi extends GetView<TestController> {
  const TestApi({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(TestController());
    // Get.put(Crud());

    return MaterialApp(
      home: Scaffold(
        body: SafeArea(
          child: GetBuilder<TestController>(
              init: TestController(),
              builder: (controller) {
                return HandleDataView(
                  statusRequest: controller.statusRequest,
                  widget: ListView.builder(
                    itemCount: controller.data.length,
                    itemBuilder: (context, index) => Column(
                      children: [
                        ListTile(
                          title: Text(controller.data[index]["users_username"]),
                          subtitle: Text(
                            controller.data[index]["users_email"],
                          ),
                          trailing: Icon(
                              controller.data[index]["users_aproove"] == "1"
                                  ? Icons.check_circle_outline
                                  : Icons.fast_rewind_outlined,
                              color: AppColor.primary),
                        )
                      ],
                    ),
                  ),
                );
              }),
        ),
      ),
    );
  }
}
