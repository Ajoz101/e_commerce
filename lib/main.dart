import 'package:e_commerce/core/locale/translation.dart';
import 'package:e_commerce/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'bindings/mybindings.dart';
import 'core/constant/colors.dart';
import 'core/services/services.dart';

// var res;

// initalConnect() async {
//   res = await checkInternet();
//     print(res);
// }

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initalServices();
  // initalConnect();
  // sharedPref.remove("seen");
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
        inputDecorationTheme: InputDecorationTheme(
          prefixIconColor: AppColor.primary,
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: const BorderSide(width: 3, color: AppColor.second),
          ),
        ),
        fontFamily: "PlayfairDisplay",
        textTheme: const TextTheme(
          headline1: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 30,
              color: AppColor.second),
          headline2: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 26,
              color: AppColor.second),
          bodyText1: TextStyle(fontSize: 20, color: AppColor.grey),
        ),
        useMaterial3: true,
      ),
      // home: const OBoarding(),
      // routes: routes,
      getPages: routes,
      initialBinding: InitalBindings(),
    );
  }
}
