import 'package:e_commerce/core/locale/translation.dart';
import 'package:e_commerce/routes.dart';
import 'package:e_commerce/view/screen/onboarding.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'core/constant/colors.dart';
import 'core/services/services.dart';

void main()async {
  WidgetsFlutterBinding.ensureInitialized();
  await initalServices();
  runApp(const HomePage());
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      translations: CustomTranslate(),
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: "PlayfairDisplay",
        textTheme: const TextTheme(
          headline1: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 30,
              color: AppColor.second),
          bodyText1: TextStyle(fontSize: 20, color: AppColor.grey),
        ),
        useMaterial3: true,
      ),
      home: const OBoarding(),
      routes: routes,
    );
  }
}
