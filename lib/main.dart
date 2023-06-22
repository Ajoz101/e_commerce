import 'package:e_commerce/routes.dart';
import 'package:e_commerce/view/screen/onboarding.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'core/constant/colors.dart';

void main() {
  runApp(const HomePage());
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: "PlayfairDisplay",
        textTheme: const TextTheme(
        
          headline1: TextStyle(
            
              fontWeight: FontWeight.bold, fontSize: 30, color: AppColor.black),
          bodyText1: TextStyle(fontSize: 20, color: AppColor.grey),
        ),
        useMaterial3: true,
      ),
      home: const OBoarding(),
      routes: routes,
    );
  }
}
