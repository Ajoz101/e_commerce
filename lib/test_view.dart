import 'package:e_commerce/controller/testController.dart';
import 'package:e_commerce/core/class/crud.dart';
import 'package:e_commerce/core/class/statusRequest.dart';
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
              if (controller.statusRequest == StatusRequest.loading) {
                return Center(child: CircularProgressIndicator());
              } else if (controller.statusRequest ==
                  StatusRequest.serverFailure) {
                return Center(child: Text("Server Fail"));
              } else if (controller.statusRequest ==
                  StatusRequest.offlineFailure) {
                return Center(
                  child: Text("offline"),
                );
              }
              return ListView.builder(
                  itemCount: controller.data.length,
                  itemBuilder: (context, index) => Column(
                        children: [
                          ListTile(
                            title:
                                Text(controller.data[index]["users_username"]),
                            subtitle: Text(
                              controller.data[index]["users_email"],
                            ),
                            trailing: Icon(
                                controller.data[index]["users_aproove"] == "1"
                                    ? Icons.check_circle_outline
                                    : Icons.fast_rewind_outlined),
                          )
                        ],
                      ));
            },
          ),
        ),
      ),
    );
  }
}
