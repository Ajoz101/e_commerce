import 'package:e_commerce/controller/home/home_controller.dart';
import 'package:e_commerce/core/services/services.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    var c = Get.put(HomeControllerImp());
    return Scaffold(
      appBar: AppBar(
        title: Text("Hello ${c.username}"),
      ),
      body: SafeArea(
          child: Column(
        children: [Text("Welcome Home!")],
      )),
    );
  }
}
